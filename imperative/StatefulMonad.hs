module StatefulMonad where

import Prelude hiding (LT, GT, EQ)
import Data.Maybe (fromJust)
import Control.Monad (ap, liftM)

import Stateful hiding (Stateful, evaluate, execute)

data Stateful t = ST (Memory -> (t, Memory))

instance Monad Stateful where
  return val = ST (\m -> (val, m))
  (ST c) >>= f =
    ST
      (\m -> let (val, m') = c m
                 ST f' = f val
             in f' m')


-- a test case
-- >>> t1
-- (3,[3])
-- "var a = mutable(3); a; a = @a;"
st1 = evaluate (Decl "a" (Mutable (Lit $ IntV 3)) (Seq (Var "a") (Assign (Var "a") (Access (Var "a"))))) []
test = evalState []
{--
st1 
= evaluate (...) []
= (evaluate (Mutable (Lit $ IntV 3)) []) 
    >>= (\ev -> (let newEnv = (("a", ev) : []) in do evaluate (Seq ...) newEnv))
= ((evaluate (Lit $ IntV 3) []) >>= (\ev -> newMemory ev))
    >>= (\ev -> evaluate (Seq ...) (("a", ev) : []))
= ((return (IntV 3)) >>= (\ev -> newMemory ev))
    >>= (\ev -> ...)
= ((ST (\mem -> (IntV 3, mem))) >>= (\ev -> newMemory ev))
    >>= (\ev -> ...)
= (ST (\m -> let (val, m') = (\mem -> (IntV 3, mem)) m
                 ST f' = (\ev -> newMemory ev) val
             in f' m'))
    >>= (\ev -> ...)
= (ST (\m -> let (val, m') = (IntV 3, m)
                 ST f' = newMemory val
             in f' m'))
    >>= (\ev -> ...)
= (ST (\m -> let (val, m') = (IntV 3, m)
                 ST f' = ST (\mem -> (AddressV (length mem), mem ++ [val]))
             in f' m'))
    >>= (\ev -> ...)
= (ST (\m -> (AddressV (length m), m ++ [IntV 3])))
    >>= (\ev -> ...)
= ST (\m -> let (val, m') = ((\m -> (AddressV (length m), m ++ [IntV 3])) m)
                ST f' = (\ev -> ...) val
            in f' m')
= ST (\m -> let (val, m') = (AddressV (length m), m ++ [IntV 3])
                ST f' = (\ev -> evaluate (Seq ...) (("a", ev) : [])) val
            in f' m')
= ST (\m -> let (val, m') = (AddressV (length m), m ++ [IntV 3])
                ST f' = (evaluate (Seq ...) (("a", val) : []))
            in f' m')
= ST (\m -> let (val, m') = (AddressV (length m), m ++ [IntV 3])
                ST f' = (evaluate (Seq (Var "a") (Assign (Var "a") (Access (Var "a")))) (("a", val) : []))
            in f' m')
= ST (\m -> let (val, m') = (AddressV (length m), m ++ [IntV 3])
                ST f' = ((evaluate (Var "a") (("a", val) : [])) >> (evaluate (Assign (Var "a") (Access (Var "a"))) (("a", val) : [])))
            in f' m')
= ST (\m -> let (val, m') = (AddressV (length m), m ++ [IntV 3])
                ST f' = ((return (fromJust (lookup "a" (("a", val) : [])))) >> (evaluate (Assign (Var "a") (Access (Var "a"))) (("a", val) : [])))
            in f' m')
= ST (\m -> let (val, m') = (AddressV (length m), m ++ [IntV 3])
                ST f' = ((return val) >> (evaluate (Assign (Var "a") (Access (Var "a"))) (("a", val) : [])))
            in f' m')
= ST (\m -> let (val, m') = (AddressV (length m), m ++ [IntV 3])
                ST f' = ((ST (\m -> (val, m))) >>= (\_ -> (evaluate (Assign (Var "a") (Access (Var "a"))) (("a", val) : []))))
            in f' m')
= ST (\m -> let (val, m') = (AddressV (length m), m ++ [IntV 3])
                ST f' = ST (\m -> let (val', m'') = (val, m)
                                      ST f'' = (\_ -> (evaluate (Assign (Var "a") (Access (Var "a"))) (("a", val) : []))) val'
                                  in f'' m'')
            in f' m')
= ST (\m -> let (val, m') = (AddressV (length m), m ++ [IntV 3])
                ST f' = ST (\m -> let (val', m'') = (val, m)
                                      ST f'' = (evaluate (Assign (Var "a") (Access (Var "a"))) (("a", val) : []))
                                  in f'' m'')
            in f' m')
= ST (\m -> let (val, m') = (AddressV (length m), m ++ [IntV 3])
                ST f' = ST (\m -> let (val', m'') = (val, m)
                                      ST f'' = ((evaluate (Var "a") (("a", val) : [])) >>= (\(AddressV i) -> ((evaluate (Access (Var "a")) (("a", val) : [])) >>= (\ev -> (updateMemory ev i >>= (\_ -> return ev))))))
                                  in f'' m'')
            in f' m')
= ST (\m -> let (val, m') = (AddressV (length m), m ++ [IntV 3])
                ST f' = ST (\m -> let (val', m'') = (val, m)
                                      ST f'' = ((ST (\m -> (val, m))) >>= (\(AddressV i) -> ((evaluate (Access (Var "a")) (("a", val) : [])) >>= (\ev -> (updateMemory ev i >>= (\_ -> return ev))))))
                                  in f'' m'')
            in f' m')
= ST (\m0 -> let (val, m') = (AddressV (length m0), m0 ++ [IntV 3])
                 ST f' = ST (\m1 -> let (val', m'') = (val, m1)
                                        ST f'' = ST (\m2 -> let (val'', m''') = (val, m2)
                                                                ST f''' = ((evaluate (Access (Var "a")) (("a", val) : [])) >>= (\ev -> (updateMemory ev (length m0) >>= (\_ -> return ev))))
                                                            in f''' m''')
                                    in f'' m'')
             in f' m')
= ST (\m0 -> let (val, m') = (AddressV (length m0), m0 ++ [IntV 3])
                 ST f' = ST (\m1 -> let (val', m'') = (val, m1)
                                        ST f'' = ST (\m2 -> let (val'', m''') = (val, m2)
                                                                ST f''' = (((evaluate (Var "a") (("a", val) : [])) >>= (\(AddressV i) -> readMemory i)) >>= (\ev -> (updateMemory ev (length m0) >>= (\_ -> return ev))))
                                                            in f''' m''')
                                    in f'' m'')
             in f' m')
= ST (\m0 -> let (val, m') = (AddressV (length m0), m0 ++ [IntV 3])
                 ST f' = ST (\m1 -> let (val', m'') = (val, m1)
                                        ST f'' = ST (\m2 -> let (val'', m''') = (val, m2)
                                                                ST f''' = (((ST (\m -> (val, m))) >>= (\(AddressV i) -> readMemory i)) >>= (\ev -> (updateMemory ev (length m0) >>= (\_ -> return ev))))
                                                            in f''' m''')
                                    in f'' m'')
             in f' m')
= ST (\m0 -> let (val, m') = (AddressV (length m0), m0 ++ [IntV 3])
                 ST f' = ST (\m1 -> let (val', m'') = (val, m1)
                                        ST f'' = ST (\m2 -> let (val'', m''') = (val, m2)
                                                                ST f''' = ((ST (\m3 -> let (val''', m'''') = (val, m3)
                                                                                           ST f'''' = readMemory (length m0)
                                                                                       in f'''' m'''') >>= (\ev -> (updateMemory ev (length m0) >>= (\_ -> return ev)))))
                                                            in f''' m''')
                                    in f'' m'')
             in f' m')
= ST (\m0 -> let (val, m') = (AddressV (length m0), m0 ++ [IntV 3])
                 ST f' = ST (\m1 -> let (val', m'') = (val, m1)
                                        ST f'' = ST (\m2 -> let (val'', m''') = (val, m2)
                                                                ST f''' = ST (\m3 -> let (val''', m'''') = (AddressV (length m0), m3)
                                                                                         ST f'''' = ST (\mem -> (mem !! (length m0), mem))
                                                                                       in f'''' m'''') >>= (\ev -> (updateMemory ev (length m0) >>= (\_ -> return ev)))
                                                            in f''' m''')
                                    in f'' m'')
             in f' m')
= ST (\m0 -> let (val, m') = (AddressV (length m0), m0 ++ [IntV 3])
                 ST f' = ST (\m1 -> let (val', m'') = (val, m1)
                                        ST f'' = ST (\m2 -> let (val'', m''') = (val, m2)
                                                                ST f''' = ST (\m3 -> let (val''', m'''') = (m3 !! (length m0), m3)
                                                                                         ST f'''' = (updateMemory (m3 !! (length m0)) (length m0) >>= (\_ -> return (m3 !! (length m0))))
                                                                                     in f'''' m'''')
                                                            in f''' m''')
                                    in f'' m'')
             in f' m')
= ST (\m0 -> let (val, m') = (AddressV (length m0), m0 ++ [IntV 3])
                 ST f' = ST (\m1 -> let (val', m'') = (val, m1)
                                        ST f'' = ST (\m2 -> let (val'', m''') = (val, m2)
                                                                ST f''' = ST (\m3 -> let (val''', m'''') = (m3 !! (length m0), m3)
                                                                                         ST f'''' = (ST (\mem -> ((), update (length m0) (m3 !! (length m0)) mem)) >>= (\_ -> return (m3 !! (length m0))))
                                                                                     in f'''' m'''')
                                                            in f''' m''')
                                    in f'' m'')
             in f' m')
= ST (\m0 -> let (val, m') = (AddressV (length m0), m0 ++ [IntV 3])
                 ST f' = ST (\m1 -> let (val', m'') = (val, m1)
                                        ST f'' = ST (\m2 -> let (val'', m''') = (val, m2)
                                                                ST f''' = ST (\m3 -> let (val''', m'''') = (m3 !! (length m0), m3)
                                                                                         ST f'''' = (ST (\mem -> ((), let (before, (_:after)) = splitAt (length m0) mem in before ++ [m3 !! (length m0)] ++ after)) >>= (\_ -> return (m3 !! (length m0))))
                                                                                     in f'''' m'''')
                                                            in f''' m''')
                                    in f'' m'')
             in f' m')
= ST (\m0 -> let (val, m') = (AddressV (length m0), m0 ++ [IntV 3])
                 ST f' = ST (\m1 -> let (val', m'') = (val, m1)
                                        ST f'' = ST (\m2 -> let (val'', m''') = (val, m2)
                                                                ST f''' = ST (\m3 -> let (val''', m'''') = (m3 !! (length m0), m3)
                                                                                         ST f'''' = ST (\m4 -> let (val'''', m''''') = ((), let (before, (_:after)) = splitAt (length m0) m4 in before ++ [m3 !! (length m0)] ++ after)
                                                                                                                   ST f''''' = ST (\m -> ((m3 !! (length m0)), m))
                                                                                                               in f''''' m''''')
                                                                                     in f'''' m'''')
                                                            in f''' m''')
                                    in f'' m'')
             in f' m')

Thus:

test st
= (\m0 -> let (val, m') = (AddressV (length m0), m0 ++ [IntV 3])
              ST f' = ST (\m1 -> let (val', m'') = (val, m1)
                                     ST f'' = ST (\m2 -> let (val'', m''') = (val, m2)
                                                             ST f''' = ST (\m3 -> let (val''', m'''') = (m3 !! (length m0), m3)
                                                                                      ST f'''' = ST (\m4 -> let (val'''', m''''') = ((), let (before, (_:after)) = splitAt (length m0) m4 in before ++ [m3 !! (length m0)] ++ after)
                                                                                                                ST f''''' = ST (\m -> ((m3 !! (length m0)), m))
                                                                                                            in f''''' m''''')
                                                                                  in f'''' m'''')
                                                         in f''' m''')
                                 in f'' m'')
          in f' m') []
= let (val, m') = (AddressV (length []), [] ++ [IntV 3])
                 ST f' = ST (\m1 -> let (val', m'') = (val, m1)
                                        ST f'' = ST (\m2 -> let (val'', m''') = (val, m2)
                                                                ST f''' = ST (\m3 -> let (val''', m'''') = (m3 !! (length []), m3)
                                                                                         ST f'''' = ST (\m4 -> let (val'''', m''''') = ((), let (before, (_:after)) = splitAt (length []) m4 in before ++ [m3 !! (length [])] ++ after)
                                                                                                                   ST f''''' = ST (\m -> ((m3 !! (length [])), m))
                                                                                                               in f''''' m''''')
                                                                                     in f'''' m'''')
                                                            in f''' m''')
                                    in f'' m'')
             in f' m'
= let (val, m') = (AddressV 0, [IntV 3])
      ST f' = ST (\m1 -> let (val', m'') = (val, m1)
                             ST f'' = ST (\m2 -> let (val'', m''') = (val, m2)
                                                     ST f''' = ST (\m3 -> let (val''', m'''') = (m3 !! 0, m3)
                                                                              ST f'''' = ST (\m4 -> let (val'''', m''''') = ((), let (before, (_:after)) = splitAt 0 m4 in before ++ [m3 !! 0] ++ after)
                                                                                                        ST f''''' = ST (\m -> ((m3 !! 0), m))
                                                                                                    in f''''' m''''')
                                                                          in f'''' m'''')
                                                 in f''' m''')
                         in f'' m'')
  in f' m'
= (\m1 -> let (val', m'') = (val, m1)
              ST f'' = ST (\m2 -> let (val'', m''') = (val, m2)
                                      ST f''' = ST (\m3 -> let (val''', m'''') = (m3 !! 0, m3)
                                                               ST f'''' = ST (\m4 -> let (val'''', m''''') = ((), let (before, (_:after)) = splitAt 0 m4 in before ++ [m3 !! 0] ++ after)
                                                                                         ST f''''' = ST (\m -> ((m3 !! 0), m))
                                                                                     in f''''' m''''')
                                                               in f'''' m'''')
                                  in f''' m''')
          in f'' m'') [IntV 3]
= ...(applying [IntV 3] for three times)...
= let (val'''', m''''') = ((), let (before, (_:after)) = splitAt 0 [IntV 3] in before ++ [[IntV 3] !! 0] ++ after)
      ST f''''' = ST (\m -> (([IntV 3] !! 0), m))
  in f''''' m'''''
= let (val'''', m''''') = ((), [] ++ [[IntV 3] !! 0] ++ [])
      ST f''''' = ST (\m -> (([IntV 3] !! 0), m))
  in f''''' m''''' 
= (\m -> (([IntV 3] !! 0), m)) [IntV 3]
= (IntV 3, [IntV 3])



--}

-- Evaluation
evaluate :: Exp -> Env -> Stateful Value
evaluate (Lit v) env = return v
evaluate (Unary op a) env = do
  av <- evaluate a env
  return (unary op av)
evaluate (Bin op a b) env = do
  av <- evaluate a env
  bv <- evaluate b env
  return (binary op av bv)
evaluate (If a b c) env = do
  BoolV cond <- evaluate a env
  evaluate (if cond then b else c) env

-- Variables and declarations (non-recursive)
evaluate (Var x) env = return (fromJust (lookup x env))
evaluate (Decl x e body) env = do
  ev <- evaluate e env
  let newEnv = (x, ev) : env
  evaluate body newEnv

-- First-class functions
evaluate (Fun x body) env = return (ClosureV x body env)
evaluate (Call f a) env = do
  ClosureV x body clos <- evaluate f env
  argv <- evaluate a env
  let newEnv = (x, argv) : clos
  evaluate body newEnv

-- Mutation operation
evaluate (Mutable e) env = do
  ev <- evaluate e env
  newMemory ev
evaluate (Access a) env  = do
  AddressV i <- evaluate a env
  readMemory i
evaluate (Assign a e) env = do
  AddressV i <- evaluate a env
  ev <- evaluate e env
  updateMemory ev i
  return ev
evaluate (Seq e1 e2) env = do
  evaluate e1 env
  evaluate e2 env

execute :: Exp -> Value
execute e = evalState [] (evaluate e [])

{--
execute e =
  let ST c = evaluate e []
      (v, _) = c []
  in v
--}

-- Utility
newMemory :: Value -> Stateful Value
newMemory val = ST (\mem -> (AddressV (length mem), mem ++ [val]))

readMemory :: Int -> Stateful Value
readMemory i = ST (\mem -> (access i mem, mem))

updateMemory :: Value -> Int -> Stateful ()
updateMemory val i = ST (\mem -> ((), update i val mem))

{--
updateMemory :: Value -> Int -> Stateful Value
updateMemory val i = ST (\mem -> (val, update i val mem))
--}

evalState :: Memory -> Stateful Value -> Value
evalState m (ST c) =
  let (v, _) = c m
  in v

-- Make GHC 7.10 happy
instance Functor Stateful where
  fmap = liftM

instance Applicative Stateful where
  pure = return
  (<*>) = ap
