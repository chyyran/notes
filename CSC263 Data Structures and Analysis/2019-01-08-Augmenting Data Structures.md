# Augumenting Data Structures

* Often useful to modify existing data structures to perform additional operations
* We can add extra information to a standard datastructure to support new operations


## High level steps
* Determine which additional information to store to be able to do the new ops
* Check that the additional info can be cheaply maintained
* Use the additional info to efficiently implement new operations

## Examples

Dynamic Order States

We want to maintain a set \(S\) of elements with **distinct keys**, supporting the following ops (a dictionary)

* `Select(x)`
* `Insert(x)`
* `Delete(x)`

And two additional 
* `Select(k)`
  Where we want to find the *k*th smallest element in \(S\), or rather the element with rank `k`.
* `Rank(x)`
  Given `x`, find the rank of `x`

**What datastructure do we use?**

For efficient *Search, Insert, Delete*, we can use an AVL tree or any balanced BST.


How can be efficiently implement `Select`, and `Rank`?
* We can't just traverse the tree, that would take \(n\) time.
## A naive augmentation

Naively, we can
 * at each node `x`, store the rank of `x`
 * We can efficiently `Rank` and `Select`
   * simply compare rank instead of the key
 * How do we maintain the rank!?
   * With this naive implementation, insert and delete take linear time!

### A better augmentation

At each node `x`, we can store the **size** of the subtree rooted at `x`.

> In general, for some node x, `size(x) = size(x.left) + size(x.right) + 1`

Maintaining this property is cheap, since we only use local information (assuming we don't need to recompute the size for the left and right trees).

#### How can we efficiently implement `Select` and `Rank`

```

 Sizes | Keys
-------|------
  19   | A <-- x has key A, rank 19
 /  \  | 
6   12 | L R
```

The relative rank of A is 7, where `RR = size(left(x))`. Relative rank of `x` in the subtree with respect to the root. Hence we don't need to care about the right size. We don't know the order of the items in the left subtree, but we know that there are 6 items, so A has rank 6 relative to the left.


Then if we want to `Select(x, 7)`, we return `x`.

If we want to `Select(x, 3)`, we return `Select(x.left, 3)`
If we want to `Select(x, 8)`, we return `Select(x.right,  k - RR(x) = 1)`
If we want to `Select(x, 11)`, we return `Select(x.right, k - RR(x) = 4)`

```rust
fn select(x: Node, key: T) -> &Node {
    let rr = x.left.size() + 1;
    match key {
        key == rr => x,
        key < rr => x.left.select(key),
        key > rr => x.right.select(key - rr)
    }
}
```

Each `Select` call goes down one level in `T` or returns. Since `Height(T)` is \(O \log n\), `Select` takes logarithmic time.



```

 Sizes | Keys
-------|------
  19   | A <-- x has key A, rank 19
 /  \  | 
6   12 | L R
```

To calculate `RR(x, y)`, `x` with respect to `y`

* Get the relative rank with respect to yourself
  * `size(x.left) + 1` `RR(x, x)`
* For each node `y` in the path `x` to root of `T`, 
  * If `x` is in the left subtree of `y`, do nothing
  * Else, add the left, then add 1 (to count for 1), then the rank of `x` with respect to `x`.
    * If `x` is in the right subtree, then all the elements to the left of `y`, including `y` itself, and the left-children of `x`, are smaller than `x`.
    * Hence, we need to include all of those values.
  
#### How can we efficiently maintain the size field during `Insert` and `Delete`

* On an insert, increment the size of each ancestor
* Then rebalance the tree
* After the rebalance, the size of the former and new roots are no longer correct
* Recalculate the former and new root by using the precalculated sizes for the new children.
* 