# SINH-Interpreter-in-Haskell
SINH is a simple **functional** script language demonstrated in COMP3259 Principles of Programming Languages of The University of Hong Kong.
This repo shows the SINH interpreter I wrote along the course. The codes are [here](sinh/).

There is also an **imperative** version of the language. You can find its introduction and interpreter [here](imperative/).

## Features
- First-Class Functions
- Recursion
- Static Type Checking (and division-by-0 error checking)

## Syntax of SINH
See `Sample codes`.

## How to run
- Ensure that you have `ghc: The Glorious Glasgow Haskell Compilation System` (>=7.10) installed.
- In the terminal, run `ghc Main.hs -o sinh` and you will get an executable `sinh`.
- Write your code (e.g. mycode.sinh) in the SINH language and run it by `./sinh mycode.sinh`(or `sinh.exe` in Windows).

## Sample codes

```javascipt
var fact : Int -> Int = function(x : Int) {
  if (x == 0) 1; else x * fact(x - 1)
};
var fib : Int -> Int = function(x:Int) {
  if (x == 0) 0;
  else if (x == 1) 1;
       else fib(x-1) + fib(x-2)
};
var add : Int -> Int = function(y:Int) {
    if (y == 0) 0; else y + add(y-1)
};
var tt : (Int -> Int) -> Int = function(x : Int -> Int) {
  x(3)
};
tt(add)
```

The output of this piece should be `6`.