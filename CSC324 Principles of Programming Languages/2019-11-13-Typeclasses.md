# 2019-11-13 Typeclasses

* ad-hoc polymorphism
  * the ability for an entity to behave differently on different input or contained types.
  * "ad-hoc implementation" per type
  * same function, but different implementations


A type class is a set of types defined by an interface (a set of functions) that the types must implement. (Compare Rust traits)


Type classes are defined by the `class` keyword, which means "set" of types

```haskell
class Eq a where
    (==) :: a -> a -> Bool
```

Compare Rust
```rust
trait Eq {
    fn eq(&self, other: &Self) -> bool;
}
```

`Eq` is a typeclass. `Eq a =>` is a type class constraint.


The implementation of `(+)` 
```haskell
(+) :: Num a => a -> a -> a
```

Hence `(+)` is polymorphic for all types in the typeclass `Num`

```haskell
[] :: [a]
undefined :: a
```

`undefined` is polymorphic to be able to act as a hole.

```haskell
1 :: Num a => a
```
Integer literals are *also polymorphic!*.  This allows us to do things like

```haskell
:type 1 + 4.6 :: Fractional a => a
```

We get defined type coercion for free. Fractional gives us floating point division.

```haskell
class Num a => Fractional a where
    (/) :: a -> a -> a
```

## Higher order typeclasses
Consider these functions

```haskell
listMap :: (a -> b) -> [a] -> [b]
streamMap :: (a -> b) -> Stream a -> Stream b 
vectorMap :: (a -> b) -> Vector a -> Vector b
```
We can abstract over the types here with HKTs

```haskell
class Functor f where
  fmap :: (a -> b) -> f a -> f b
```

We can think of this as 'mappable'. `f` is parameterization of the container type for `a` and `b`. That is we can take some function that maps `a -> b`, apply it to some instance of `f a`, and get back a `f b`.

Consider

```haskell
add10 :: Integer -> Integer
add10 n = n + 10

add10ToAll :: Functor f => f Integer -> f Integer
add10ToAll numbers = fmap add10 numbers
```

`fmap` is implemented for different type constructors!


```haskell
instance Functor [] where
    fmap = map

instance Functor (Map k) where
    fmap :: (a -> b) -> Map k a -> Map k b
    fmap = ...
```

Notice that `Functor` isn't implemented on `Map`, but on `Map k`! So we transform values when we call `fmap` on `Map`. For all `k`, `Map k` is a `Functor`. 

With this we can model mutation in an immutable world.

What if we want to count the number of recursive calls this function makes?

```haskell
fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)
```

Consider the `foldl` update function.

```haskell
update :: acc -> x -> acc
```

We can add an extra parameter and return value to `fib` to accumulate a counter.

```haskell
fibCounted :: Integer -> Integer -> (Integer, Integer)
fibCounted n count = ...
```

In this we have to keep track of the state everywhere! We can do better. 

In general, if we have a function `f :: t1 -> ... -> tn -> a`, we can transform this to `f :: t1 -> ... -> tn -> s -> (a, s)`.

```haskell
data State s a = State (s -> (a, s))
```

The `State` monad is an abstraction over the the last argument for these stateful functions. Then we have `f :: t1 -> ... -> tn -> State s a`. Given some state `s`, we yield `a`! This is still pure since for the same value of `s`, we get the same value of `a`. 