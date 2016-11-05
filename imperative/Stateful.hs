module Stateful where

import Prelude hiding (LT, GT, EQ)
import Data.Maybe (fromJust)

data BinaryOp = Add | Sub | Mult | Div | Power
              | And | Or  | GT   | LT  | LE
              | GE  | EQ
              deriving (Eq, Show)

data UnaryOp = Neg
             | Not
             deriving (Eq, Show)

data Value = IntV Int
           | BoolV Bool
           | ClosureV String Exp Env
           | AddressV Int        -- new
           deriving Eq

instance Show Value where
  show (IntV n) = show n
  show (BoolV b) = show b
  show (ClosureV{}) = show "#Closure#"
  show (AddressV n) = show $ "Address: " ++ show n

data Exp = Lit Value
         | Unary UnaryOp Exp
         | Bin BinaryOp Exp Exp
         | If Exp Exp Exp
         | Var String
         | Decl String Exp Exp
         | Call Exp Exp
         | Fun String Exp
         | Seq Exp Exp          -- sequential composition
         | Mutable Exp          -- new
         | Access Exp           -- new
         | Assign Exp Exp       -- new
         deriving (Eq, Show)

-- Memory operations

type Memory = [Value]

access :: Int -> Memory -> Value
access n m = m !! n

update :: Int -> Value -> Memory -> Memory
update n v m =
  let (before,(_:after)) = splitAt n m in
  before ++ [v] ++ after

-- Modelling stateful computation

type Stateful t = Memory -> (t, Memory)

type Env = [(String, Value)]


-- Evaluation

evaluate :: Exp -> Env -> Stateful Value
evaluate (Lit v) env mem = (v, mem)
evaluate (Unary op a) env mem =
  let (av, mem') = evaluate a env mem
  in (unary op av, mem')
evaluate (Bin op a b) env mem =
  let (av, mem1) = evaluate a env mem
  in let (bv, mem2) = evaluate b env mem1
     in (binary op av bv, mem2)
evaluate (If a b c) env mem =
  let (BoolV test, mem') = evaluate a env mem
  in evaluate (if test then b else c) env mem'
evaluate (Var x) env mem = (fromJust (lookup x env), mem)
evaluate (Decl x e body) env mem =
  let (ev, mem') = evaluate e env mem
      newEnv = (x, ev) : env
  in evaluate body newEnv mem'
evaluate (Fun x body) env mem = (ClosureV x body env, mem)
evaluate (Call f a) env mem =
  let (ClosureV x body clos, mem1) = evaluate f env mem
      (av, mem2) = evaluate a env mem1
      newEnv = (x, av) : clos
  in evaluate body newEnv mem2
evaluate (Mutable e) env mem =
  let (ev, mem') = evaluate e env mem
  in (AddressV (length mem'), mem' ++ [ev])

evaluate (Access a) env mem =
  let (AddressV addr, mem') = evaluate a env mem
  in (access addr mem', mem')
evaluate (Assign a e) env mem =
  let (AddressV addr, mem') = evaluate a env mem
      (ev, mem'') = evaluate e env mem'
  in (ev, update addr ev mem'')
evaluate (Seq e1 e2) env mem =
  let (_, mem') = evaluate e1 env mem
  in evaluate e2 env mem'

execute :: Exp -> Value
execute e = v
  where
    (v, _) = evaluate e [] []

-- Utility

unary :: UnaryOp -> Value -> Value
unary Not (BoolV b) = BoolV (not b)
unary Neg (IntV i)  = IntV (-i)

binary :: BinaryOp -> Value -> Value -> Value
binary Add (IntV a) (IntV b) = IntV (a + b)
binary Sub (IntV a) (IntV b) = IntV (a - b)
binary Mult (IntV a) (IntV b) = IntV (a * b)
binary Div (IntV a) (IntV b) = IntV (a `div` b)
binary Power (IntV a) (IntV b) = IntV (a ^ b)
binary And (BoolV a) (BoolV b) = BoolV (a && b)
binary Or (BoolV a) (BoolV b) = BoolV (a || b)
binary LT (IntV a) (IntV b) = BoolV (a < b)
binary LE (IntV a) (IntV b) = BoolV (a <= b)
binary GE (IntV a) (IntV b) = BoolV (a >= b)
binary GT (IntV a) (IntV b) = BoolV (a > b)
binary EQ a b = BoolV (a == b)
