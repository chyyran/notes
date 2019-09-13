# Recursion - efficient implementations
* Is recursion slower than loops?
* How can we mitigate the overhead?

**Denotational semantics** is the meaning of an expression as an abstract mathematical value; *what* this expression evaluates to?

**Operational semantics** is the meaning of an expression as what computational steps it represents; *how* this expression is evaluated.

## Space

Consider the following expressions

```lisp
10
2 + 8
(* 2 5)
```
```haskell
(\x x + 3) 7
ord('\n')
```

These all evaluate to the number 10, but how they evaluate is different.

```lisp
; Recursive identity function for naturals
(define (count n)
    (if (zero? n)
        0
        (+ 1 (count (- n 1)))))
```
Theoretically

```lisp
(count 100) ;100
```
But consider the evaluation of 
```lisp
(count 100000000) ;Out of memory
```

When we call `(count 100)`, this calls `(count 99)`, `(count 98)`, ..., `(count 0)`, creating a stack frame *for every call*. Each stack frame stores wheres it should return to; eg. `(count 99)` stores that it should return to `(count 100)`. In more concrete terms, it needs to know to add one after the call returns.

Consider this function that returns 0.
```lisp
(define (countz n)
    if (zero? n)
        0
        (countz (- n 1)))
```

We don't do anything with the value in `countz` and so
`(countz 1000000)` will evaluate to `0`.

### Definition of Tail Recursion
> Let \(E\) be an expression and \(E'\) a subexpression in \(E\). \(E'\) is said to be in **tail position** with respect to \(E\) if evaluating \(E'\) is the last step in evaluating \(E\).
> 
> A function call in tail position is a **tail call**.
> 
> A recursive function is said to be **tail recursive** when all of its recursive calls are tail calls.

We can see here that `countz` is tail recursive, but `count` is not.

The expansion for `count` looks like

```lisp
(count 100)
(+ 1 (count 99))
(+ 1 (+ 1 (count 98)))
;...
```
But for `countz`
```lisp
(countz 100)
(countz 99)
(countz 98)
;...
```

We *don't need to keep track of `(countz 100)` once we call `(countz 99)`*. It no longer is useful for determining the meaning of `(countz 100)`, because `(countz 100)` is evaulated the same as `(countz 99)`. We can thus drop the stack frame for `(countz 100)`; this optimization is called **tail call elimination**.

We use **accumulators** to track leftover computations.

Can we transform `(count n)` into a tail recursive function?

```lisp
; Recursive identity function for naturals
(define (count-tail n acc)
    (if (zero? n)
        acc
        (count-tail (- n 1) (+ 1 acc))))
```
Now this function is tail recursive!

Python *does not have tail-call elimination*.

```python
def count_tail(n, acc):
    if n == 0:
        return acc
    else:
        return count_tail(n - 1, acc + 1)
```
This evaluates to `RecursionError`, even though `count_tail` is still tail recursive! Tail call elimination fundamentally alters the stack trace, which is orthogonal to Python's goals.

## Time
We have examined tail call elimination, which allows constant stack space usage. We can transform tail recursion into a loop. *Instead of tearing down the entire stack frame, we can just replace the variables*.

For example, `(count-tail 100 0)` is exactly equivalent to `(count-tail 99 1)`.

```python
def count_iter(initial):
    n, acc = initial, 0
    while n == 0:
        # transformation of count_tail
        n, acc = n - 1, acc + 1
    return acc
```

The insight here is that we can look at code as data that can be transformed from one form to another, that may be more efficient.

*It is always possible to write a recursive function as tail recursive, and a tail recursive function as iterative*. It may not result in the same space savings, if the accumulated value is complex.
