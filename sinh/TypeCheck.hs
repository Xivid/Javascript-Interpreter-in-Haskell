module TypeCheck where

import Declare
import Prelude hiding (LT, GT, EQ)

type TEnv = [(String,Type)]

tunary :: UnaryOp -> Type -> Maybe Type
tunary Neg TInt = Just TInt
tunary Not TBool = Just TBool
tunary _ _ = Nothing

tbinary :: BinaryOp -> Type -> Type -> Maybe Type
tbinary Add TInt TInt = Just TInt
tbinary Sub TInt TInt = Just TInt
tbinary Mult TInt TInt = Just TInt
tbinary Div TInt TInt = Just TInt
tbinary And TBool TBool = Just TBool
tbinary Or TBool TBool = Just TBool
tbinary LT TInt TInt = Just TBool
tbinary LE TInt TInt = Just TBool
tbinary GE TInt TInt = Just TBool
tbinary GT TInt TInt = Just TBool
tbinary EQ t1 t2
  | t1 == t2 = Just TBool
tbinary _ _ _ = Nothing

tcheck :: Exp -> TEnv -> Maybe Type
tcheck (Decl x t e body) env =
  case (t, e) of
    (TFun _ _, Fun _ _) ->
      if tcheck e ((x, t):env) == Just t then tcheck body ((x, t):env) else Nothing
    (_, _) ->
      if tcheck e env == Just t then tcheck body ((x, t):env) else Nothing
tcheck (Fun (x, t1) e) env =
  case tcheck e ((x, t1):env) of
    Just t2 -> Just $ TFun t1 t2
    _       -> Nothing
tcheck (Call e1 e2) env =
  case tcheck e1 env of
    Just (TFun t1 t2) -> if tcheck e2 env == Just t1 then Just t2 else Nothing
    _                 -> Nothing

tcheck (Lit (IntV _)) _ = Just TInt
tcheck (Lit (BoolV _)) _ = Just TBool
tcheck (Lit (ClosureV (_, t) _ _)) _ = Just t
tcheck (Unary op e) env =
  case tcheck e env of
    Nothing -> Nothing
    Just t  -> tunary op t
tcheck (Bin op e1 e2) env =
  case (tcheck e1 env, tcheck e2 env) of
    (Just t1, Just t2) -> tbinary op t1 t2
    _                  -> Nothing
tcheck (If e1 e2 e3) env =
  case (tcheck e1 env, tcheck e2 env, tcheck e3 env) of
    (Just TBool, Just t1, Just t2)
      | t1 == t2 -> Just t1
    _ -> Nothing
tcheck (Var x) env = lookup x env
