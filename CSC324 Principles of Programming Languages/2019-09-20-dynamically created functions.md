# 2019-09-20 Dynamically Created Functions

* How do we functions that return a function?
* **Naive implementation of function**
  * `\x -> x + 10`
  * We need to represent a function with a data structure storing
    * `Params (['x'])`
    * `Expr (x + 10)`
  * How much space to allocate for arguments?
  * How much space to allocate for body?

Consider the following code
```haskell
makeAdder n = \x -> x + n
add1 = makeAdder 1 
add2 = makeAdder 2
```

How is this generated naively? This expands to 

```haskell
makeAdder n = \x -> x + n
add1 = \x -> x + 1 
add2 = \x -> x + 2
```

So does the compiler generate bytecode for every implementation of the function? That is, are higher order functions monomorphizised? If so, it would be very space inefficient.

An *environment* is just a collection of name bindings.

We'll replace the function params with the environment instead


```haskell
add1 = (\x -> x + n, {n: 1})
```

A **free identifier** is an identifier in a function body that is neither a parameter nor bound locally (i.e. with `let`). Basically a non-local identifier.

The concept of a **free identifier** depends on what you're looking at.

```scheme
(define (make-adder n)
    (lambda (x) + (+ x n)))
```
With respect with the lambda, `n` is free, but with respect to `make-adder`, `n` is bound.

The environment that is stored needs to capture the values for all free identifiers in the function. If we can't capture all of them, we have an *unbound identifier*.

Together this is what is called a *closure*

* A reference to the function parameter list & body
* An environment storing bindings of all free identifiers in the function body.


* Difference between *static* and *dynamic*
  * static: based on only the source code of the program
  * dynamic: determined at runtime

Even if we have 1 bit of user input, it must be dynamic.