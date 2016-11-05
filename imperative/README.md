# Interpreter with imperative features

The syntax is based on JavaScript but with mutable state explicitly declared using the `mutable` keyword.

Use `ghc Main.hs -o sinh` to compile the interpreter and `./sinh demo.sinh` to run the demo. 

## Sample codes

```JavaScript
var x = mutable 3;
var y = mutable true;
if (@y) { x = @x + 1 } else { x };
@x
var x = mutable 3;
var y = mutable 7;
x = @x + @y;
y = @y * @x
```

Here in this code, x and y are like pointers in C/C++, actually storing the address of the values they are meant to hold. 

One can compare `mutable` and `@` with `&` and `*` in C/C++ in their meanings, respectively.    