## BST Delete

**BST_Delete(T, K)** 
 * find `x` that has the key `k`
 * if `x` is a leaf
   * delete `x`
 * if `x` has exactly 1 child
   * move child up to replace `x`
   * works due to BST property. (everything is less than or greater than x's parent)
 * if `x` has two children
   * **successor** `s` is the least child that is greater than the parent node.
     * by definition, it can not have a lesser child.
     * go right **once**, then keep going left until there are no left children.
   * replace `x` with the successor
   * delete `s` if `s` is a leaf, else `BST-Delete(T, s.key)`

## AVL Tree

Recall that AVL trees are BSTs that for each node have balance factor [-1, 0, 1]. 

Alternatively, an AVL tree is a tree for which each left and right subtree's height differ only by one.

**AVL_Delete(T, k)**
 * find `x` that has key `k`
 * if `x` is a leaf
   * delete `x`
 * if `x` has exactly one child `c`.
   * by the AVL tree property, `c` does not have **any children**.
     * WLOG, let `c` be the left child of `x`.
     * Then `x` has right tree height -1. Then if `x` is an AVL tree, `c` must have height 0.
       * note in this case `x` has balance factor -1. (left-skewed)
   * simply delete `c` since it is a leaf.
 * if `x` has 2 children
   * **successor** `s` is the least child that is greater than the parent node.
     * by definition, it can not have a lesser child.
     * go right **once**, then keep going left until there are no left children.
   * swap `x` with successor `s` 
   * delete copy of `s`
   * now we do the rotations, after the deletion.

```
-----------| Balance Factors
   /       |                                /
  x        | + 2                           y
 / \       |                              / \      | 0
A   y      | + 1           ------>       /   \     | 
   / \     |                            x     z    | 0 0   
  B   z    | 0                         / \   / \
     / \   |                          A   B C   D
    C   D  |
```

In this other situation, where 

```
   /       |                         /                   /
  X        | + 2                    x                   z
 / \       |                       / \                 / \
A   y      | - 1      ------>     A   z     ----->    /   \     
   / \     |                         / \             x     y
  z   D    | 0 0                    B   y           / \   / \
 / \       |                           / \         A   B  C  D
B   C      |                          C   D
```

We need to do a left rotation first, then apply a right rotation to get into a similar situation on top.

```

