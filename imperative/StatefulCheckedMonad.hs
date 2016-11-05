module StatefulCheckedMonad where

import Prelude hiding (LT, GT, EQ)
import Control.Monad (ap, liftM)

import Stateful hiding (Stateful, evaluate, execute)

data Checked a = Good a
               | Error String
               deriving Show

data CheckedStateful t = CST (Memory -> (Checked t, Memory))

instance Monad CheckedStateful where
  return v = CST (\m -> (Good v, m))
  (CST c) >>= f = CST (\m -> let (val, m') = c m
                             in case val of
                                  Error s -> (Error s, m')
                                  Good v -> let CST f' = f v in f' m')

-- Evaluation

evaluate :: Exp -> Env -> CheckedStateful Value
evaluate (Lit v) _ = return v
evaluate (Unary op a) env = do
  v <- evaluate a env
  checked_unary op v
evaluate (Bin op a b) env = do
  v1 <- evaluate a env
  v2 <- evaluate b env
  checked_binary op v1 v2
evaluate (If a b c) env = do
  cond <- evaluate a env
  BoolV cond' <- check_if cond
  evaluate (if cond' then b else c) env

-- Variables and declarations (non-recursive)
evaluate (Var x) env =
  case lookup x env of
   Just v' -> return v'
   Nothing -> CST (\m -> (Error $ "not in scope: " ++ x, m))
evaluate (Decl x e body) env = do
  ev <- evaluate e env
  evaluate body ((x, ev) : env)

-- First-class functions
evaluate (Fun x body) env = return (ClosureV x body env)
evaluate (Call f a) env = do
  fun <- evaluate f env
  pv <- evaluate a env
  case fun of
    ClosureV pn body oldenv -> evaluate body ((pn, pv) : oldenv)
    _ -> CST (\m -> (Error "function undefined", m))
-- Mutation operation
evaluate (Mutable e) env = do
  ev <- evaluate e env
  newMemory ev
evaluate (Access a) env = do
  addr <- evaluate a env
  check_readMemory addr
evaluate (Assign a e) env = do
  addr <- evaluate a env
  ev <- evaluate e env
  check_updateMemory addr ev
evaluate (Seq e1 e2) env = do
  evaluate e1 env
  evaluate e2 env


runCheck :: CheckedStateful Value -> Checked Value
runCheck (CST c) =
  let (val, _) = c []
  in val

execute :: Exp -> Checked Value
execute e = runCheck (evaluate e [])

-- Utility
newMemory :: Value -> CheckedStateful Value
newMemory v = CST (\m -> (Good $ AddressV $ length m, m ++ [v]))

check_access :: Int -> Memory -> Checked Value
check_access addr m = if (0 <= addr && addr < length m) then Good $ m !! addr
                      else Error "memory index error"

-- expect address value AddressV
check_readMemory :: Value -> CheckedStateful Value
check_readMemory (AddressV addr) = CST (\m -> (check_access addr m, m))
                                -- CST (\m -> if (0 <= addr && addr < length m) then (Good $ m !! addr, m)
                                --            else (Error "memory index error", m))
check_readMemory _ = CST (\m -> (Error "not an address", m))
-- expect address value (addr->ev->cst)
check_updateMemory :: Value -> Value -> CheckedStateful Value
check_updateMemory (AddressV addr) v = CST (\m -> if (0 <= addr && addr < length m) then
                                                      let (before, (_:after)) = splitAt addr m
                                                      in (Good v, before ++ [v] ++ after)
                                                  else (Error "memory index error", m))
                                    -- CST (\m -> (Good v, update addr v m))
check_updateMemory _ _ = CST (\m -> (Error "not an address", m))

checked_unary :: UnaryOp -> Value -> CheckedStateful Value
checked_unary Not (BoolV b) = return (BoolV (not b))
checked_unary Neg (IntV i)  = return (IntV (-i))
checked_unary _ _ =  CST (\m -> (Error "unary operation error", m))

checked_binary :: BinaryOp -> Value -> Value -> CheckedStateful Value
checked_binary Add (IntV a) (IntV b) = return (IntV (a + b))
checked_binary Sub (IntV a) (IntV b) = return (IntV (a - b))
checked_binary Mult (IntV a) (IntV b) = return (IntV (a * b))
checked_binary Div (IntV _) (IntV 0) = CST (\m -> (Error "division by zero", m))
checked_binary Div (IntV a) (IntV b) = return (IntV (a `div` b))
checked_binary Power (IntV a) (IntV b) =
  if b < 0 then CST (\m -> (Error "negative exponent", m))
  else return (IntV (a ^ b))
checked_binary And (BoolV a) (BoolV b) = return (BoolV (a && b))
checked_binary Or (BoolV a) (BoolV b) = return (BoolV (a || b))
checked_binary LT (IntV a) (IntV b) = return (BoolV (a < b))
checked_binary LE (IntV a) (IntV b) = return (BoolV (a <= b))
checked_binary GE (IntV a) (IntV b) = return (BoolV (a >= b))
checked_binary GT (IntV a) (IntV b) = return (BoolV (a > b))
checked_binary EQ a b = return (BoolV (a == b))
checked_binary _ _ _ = CST (\m -> (Error "binary operation error", m))

-- check condition should be boolean value
check_if :: Value -> CheckedStateful Value
check_if (BoolV b) = return (BoolV b)
check_if _ = CST (\m -> (Error "condition is not a boolean value", m))





-- Make GHC 7.10 happy
instance Functor CheckedStateful where
  fmap = liftM

instance Applicative CheckedStateful where
  pure = return
  (<*>) = ap
