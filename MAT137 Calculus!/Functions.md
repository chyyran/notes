# Functions
A *relation* is a mapping from one element in a set A to another element in a set B.

```
a -> a'
b -> b'
c -> c'
c -> c''
c -> a'
```

A *function* is a relation where one element in a set A can map to at most one in a set B.


```
a -> a'
b -> b'
c -> a'
```

A *function* is injective if every element in a set A (domain) maps to at most one element on the set B (co-domain).
However, Card(A) may not be the same as Card(B)
```
a -> a'
b -> b'
c -> c'
     d'
     e'
```

A *function* is surjective if every element in a set B (co-domain) is mapped to at least one element on the set A (domain).
However, Card(A) may not be the same as Card(B)
```
a -> a'
b -> b'
c -> c'
d -> a'
e 
f
```

Notice this function is not injective, as `a' -> d` and `a' -> a`. 

A *function* is bijective if it is both injective and surjective. This implies Card(A) = Card(B)

```
a -> a'
b -> b'
c -> c'
```

If a function is strictly increasing or decreasing on an interval I, then it is one-to-one on the interval I.