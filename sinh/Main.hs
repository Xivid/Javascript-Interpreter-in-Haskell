module Main where

import Parser
import Interp
import TypeCheck
import System.Environment (getArgs)


main :: IO ()
main =
  do args <- getArgs
     src <- readFile . head $ args
     let ast = parseExpr src
     case tcheck ast [] of
      Just _ -> print . execute $ ast
      Nothing ->  error "You have type error in your program!"
