module Main where

import System.Environment (getArgs)

import Parser
import StatefulCheckedMonad

main :: IO ()
main =
  do args <- getArgs
     src <- readFile . head $ args
     let ast = parseExpr src
     print . execute $ ast
