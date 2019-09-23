# 2019-09-18 Higher Order Functions

## Recall
* In racket, `0` is not considered `#f`. 

Consider this version of `countz`
```scheme
(define (countz-or n)
    (if (zero? n)
        0
        (or (countz-or (- n 1)) #f)))
```
Even though the `or` always evaluates to `0`, it is not tail recursive: Racket does not optimize away the second expression evaluation `#f`.

## Higher Order Functions
* We can abstract over functions as a first class value
* Functions as values using `lambda` (in Racket)
* Higher Order Function 
  * A function `f` that at least
    * Takes a function as an argument
    * Returns a function `f`

## `map` function
* `map :: (a -> b) -> [a] -> [b]`

## `filter` function
* `filter :: (a -> Bool) -> [a] -> [a]`

## `foldl` / `reduce`
* `foldl :: (a -> b -> a) -> a -> [b] -> a`
  * `foldl` is tail recursive.

## `compose`
* `compose :: (f -> g)

## `apply`
* `apply :: (a -> b) -> a -> b`
* `map` takes the function and list and calls for all list
* `apply` takes function and list and calls the function for all the values
* `$` has the lowest precendence and is used to remove parentheses 