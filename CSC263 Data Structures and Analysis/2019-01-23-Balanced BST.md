# 2019-01-23

* Goal BST tree with \(\Theta(\log n)\) height
* Method: Balanced BST
* Last lecture:
  * Define AVL Trees
  * How to insert a key into AVL tree
    * high level procedure
    * examples
  * Extracted an algorithm from examples
* **Try to show that algorithm works in all cases**


## Insert
* Insert `x` into `T` as any BST
  * `x` is now a leaf.

* For each node `v` from `x` to `T_root`, 
  * adjust `BF(v)`
  * rebalance if `BF(v) > 1` or `BF(v) < 1` 

* Let `A` be the **first node** from `x` to the root of `T` that loses it's balance, i.e. `BF(A)` becomes +2 or -2.

There are 2 cases.

```
    /   |
   A    | +2
  / \   |
 /   \  |
      x | Height = h + 1
```


```
    /   |
   A    | -2 
  / \   |
 /   \  |
x       | Height = h + 1
```

We will focus on the first case, without loss of generality.


```
    /   |
   A    | +2
  / \   |
 /   \  | ... some tree here
      x | Height = h + 1
```

We need to look at the first subtree below A so
```
    /   |
   A    | +2
  / \   |
 /   \  | 
      B | B is some child tree of height h + 1
      | |
      x | Height = h + 1
```

Again there are 2 sub cases, X is a right child of B, or X is a left child of B

```
    /      |
   A       | +2
  / \      |
 /   \     | 
      B    | -1 B is the first right child of A
     / \   | 
    /   \  | ...some tree here.
    X      | If X is to the left, then B has factor 
```


```
    /      |
   A       | +2
  / \      |
 /   \     | 
      B    | +1 B is the first right child of A
     / \   | 
    /   \  | ...some tree here
         X | If X is to the left, then B has factor 
```
And these are the only two cases! How can we justify that?

How do we know that if B is of height `h+1`, then it actually contains 2 subtrees with height `h`?

Since `B` has height `h+1`:
 * at least one subtree of `B` has height h
 * we must show that it is impossible for one subtree to have different heights.
 * note that since `B` was an AVL tree before insertion, then the worse that could happen is one differs by one.
  
If `B` was left (WLOG) skewed `x` inserted right, then the balance factor of `B` would have been 0, and the algorithm would have not adjusted the balance factor of `A`.

If `B` was left (WLOG) skewed, and `x` inserted right, then `B` would have balance factor of 2. But `A` was the first node that became unbalanced. 

**Hence the only possible case is both subtrees of `B` are the same height.**

Lets look at this case

```
    /      |
   A       | +2
  / \      |
 /   \     | 
1     B    | +1 B is the first right child of A
     / \   | 
    /   \  | 
   2     3 | 1, 2, 3 are subtrees. 
         | |
         X |
```

We left rotation pivot on `A`.


```
      /      |
     B       | 0
    / \      |
   /   \     | 
  A     3    | 0 1
 / \     \   | 
1   2     X  | 
```
Notice that this left rotation preserves the BST property. In both cases, note the in order traversal remains `1, A, 2, B, 3, X`

We get a bonus, before and after insertion and balance, the height of the subtree remains the same. Hence, the balance factor of the parents. In this case, A = 2, B = 1, we are done.

**How many parent/child pointers changed?**

* Before, the child of the parent of A is A. Now it is B.
* Before, B was the child of A, now A is the child of B
* Before, 2 was a child of B, now it is a child of A.

Hence we have constant pointer swaps.

Now the other case


```
    /      |
   A       | +2
  / \      |
 /   \     | 
1     B    | -1 B is the first right child of A
     / \   | 
    /   \  | 
   2     3 | 1, 2, 3 are subtrees. 
   |       |
   X       |
```

We have a degenerate case when h = -1, when we have 1, 2, 3 are empty.


```
    /      |
   A       | +2
    \      |
     \     | 
      B    | -1 B is the first right child of A
     /     | 
    /      | 
   X       | 0 
```


What if we right and left rotate?

```
    /       |
   A        | +2
    \       |
     \      | 
      X     | -1 B is the first right child of A
       \    | 
        \   | 
         B  | 0 
```


```
    /       |
   x        | 0
  / \       |
 /   \      | 
A     B     | 0 0 
```


When we insert x, the height became two. After right-left rotation, the height goes back to one.

What if its not empty? It's the same roration.


```
    /        |
   A         | +2
  / \        |
 /   \       | 
1     B      | -1 B is the first right child of A 
     / \     | Note that height of 1 is h, height of B is h + 1
    /   \    | 
   C     3   | 1, 2, 3 are subtrees. C is the root node of 2.
  / \        |
 a   b       | a, and b are subtrees of 2, and have height h -1
```

From here there are two subcases again.


```
    /        |
   A         | +2
  / \        |
 /   \       | 
1     B      | -1 B is the first right child of A 
     / \     | Note that height of 1 is h, height of B is h + 1
    /   \    | 
   C     3   | 1, 2, 3 are subtrees. C is the root node of 2.
  / \        |
 a   b       | a, and b are subtrees of 2, and have height h -1
 |   |       |
 x   x       | X child of A, or X child of B
```

Lets do the right rotation.

```
    /          |
   A           | +2
  / \          |
 /   \         | 
1     C        | -1 B is the first right child of A 
     / \       | Note that height of 1 is h, height of B is h + 1
    /   \      | 
   a     B     | 1, 2, 3 are subtrees. C is the root node of 2.
  /     / \    |
 x     b   3   | a, and b are subtrees of 2, and have height h -
       |       |
       x       |
```

And the left rotation...

We go from 

```
    /        |
   A         | +2
  / \        |
 /   \       | 
1     B      | -1 B is the first right child of A 
     / \     | Note that height of 1 is h, height of B is h + 1
    /   \    | 
   C     3   | 1, 2, 3 are subtrees. C is the root node of 2.
  / \        |
 a   b       | a, and b are subtrees of 2, and have height h -1
 |   |       |
 x   x       | X child of A, or X child of B
 ```
 to

```
      /          |
     C           | 0
    / \          |
   /   \         | 
  A     B        | 0 1 IF x is on a. if X on B, then -1 0
 / \   / \       | since a and b have height h-1. Hence a/b + x have height h.
1   a  b  3      | 
    |  |         | 
    x  x         |
```

Again notice the inorder traversal is observed after rotation, and the BST is still observed.

The height before inserting x, the height of the subtree rooted at A is h + 2. Before and after the insertion, the height is still h + 2! Hence we do not need to change anything above A.

Essentially it boils down to A = +2 B = +1, and A = +2 B = -1

## Insert Algorithm

* Go up from `x` to the root, and for each node `v` in this path
  * Adjust the BF
    * if `x` is in the right subtree of `v`, increment `BF(v)`
    * if `x` is in the left subtree of `v`, decrement `BF(v)`
    * if `BF(v) = 0` STOP
    * if `BF(v) = +2`
      *   if `BF(v.right)` = +1
          *   Left rotation, update BF of rotated nodes, stop
      *   if `BF(v.right)` = -1
          *   Do right left rotation, update BFs of rotated nodes, stop
  *   if `BF(v) = -2`
      *   symmetric case to above.

## Delete Algorithm
* Same idea as insert, but no bonus.
* We can't stop, so we need to keep going up the tree and do up to \(\log n\) rotations
## Memory layout of AVL tree
```
|Parent        |
|Key           |
|Balance Factor|
|Left   | Right|
```

```rust
struct AVLNode<T> {
    parent: &AVLNode<T>,
    key: T,
    balance: usize,
    left: &AVLNode<T>,
    right: &AVLNode<T>
}
```

