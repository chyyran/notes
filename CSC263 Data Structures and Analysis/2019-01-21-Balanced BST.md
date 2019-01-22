# 2019-01-21 Balanced BST

|ADT|Operations|Implementation|
|-|-|-|
|Dictionary|Search, Replace, Insert|BST|

Suppose we start with a balanced BST. 

```
   1
 /  \
0    2
```

If we just keep adding 3, 4, 5, ..., n keys


```
   1
 /  \
0    2
      \
       3
        \
         ... 
          \
           n
```

Now the height is \(\Theta(n)\). We want to create a balanced tree, where the height is guaranteed to be \(\Theta(\log n)\).

We will be working with so called *AVL trees*

Remember the height of a node is **length of the longest path from that node to some leaf.**

Then for an arbitrary node \(height(v)\) is the number of edges in the longest path from \(v\) to a leaf. Height of the root \(height(T)\) is the height of the whole tree.

* Height of single node tree is 0
* Height of empty tree is -1

A **balance factor** of a node \(v\) in the tree is the difference between the height of the right subtree of \(v\) and the height of the left subtree of \(v\). So \(BF(v) = h_R - h_L\). Intuitively if the height is really high, then we have a right-skewed tree. If the height is really small (negative), we have a left-skewed tree.

For a balanced tree, we want the balance factor to be close to 0.

## AVL Trees (Adelson-Velski-Landis)

* is a BST (thus obeys BST property) for every every node is between -1 and 1 (inclusive). Hence we have BST can be 1, 0, and -1.

* If the BST of a node is 1 then we have a right-heavy node. -1 is left heavy, 0 is balanced

* The singleton tree is an AVL tree.

```
These are all AVL trees.

              | Balance Factor
 O            | 1
  \           |
   O          | 0


              | Balance Factor
   O          | 1
  /           |
 O            | 0

 
              | Balance Factor
   O          | 1
  / \         |
 O   O        | 0  -1
    /         |
   O          | 0

   
              | Balance Factor
     O        | +1
    / \       |
   O   O      | -1  +1
  /   / \     |
 O   O   O    | 0  0  +1
          \   |
           O  | 0
```

```
This is not an AVL tree

         | Balance Factor
   O     | 2 (Height of left is 1, height of right is 3. Hence 3-1 = 2)
  / \    |
 O   O   | 0  +1
    / \  |
   O   O | 0  -1
      /  |
     O   | 0
```

AVL trees of \(n\) nodes has height \(\Theta(\log n)\) (height \(\leq 1.44 \log_2{(n+2)}\))

After we do an insert or delete, we can maintain the tree balance in \(\Theta(\log n)\) time.

## AVL Tree Ops

**Search(T, x)**


**Insert(T, x)**

* Insert `x` as would be a BST. Now `x` is a leaf.
  * Compare left, right as a regular BST 
  * The nodes in the path from the root to `x` (ancestors) may have had their height, and thus balance factors changed
  * For each of those nodes, `x` could be in the left and right subtree.
  * **Only** the ancestors of `x` would have had BF changed!
  * There are \(\log n\) ancestors of `x`
* Go up from `x` the root. For each node,
  * Recompute the BF, rebalancing if necessary (i.e. if BF > 1 or BF < -1>).
  * Each rebalancing operation is constant time

We are keeping track of the balance factor in each node.
  

Consider the AVL of `[1, 3, 7, 12, 14, 17, 19]`.

```
      12
     /  \
    /    \
   3     17
  / \   /  \
 1   7 14  19
```

We want to insert 8.


```
                           | Balance Factors
       12                  | -1
      /  \                 |
     /    \                |
    /      \               |
   3       17              | 1 0
  / \     /  \             | 
 1   7   14  19            | 0 1 0 0
      \                    | 
       8 <-- BST property  | 0
```

No balancing needed, what if we add `5`?

```
                           | Balance Factors
       12                  | -1
      /  \                 |
     /    \                |
    /      \               |
   3       17              | 1 0
  / \     /  \             | 
 1   7   14  19            | 0 0 0 0
    / \                    | 
   5   8                   | 0 0
```

When 7 was 1, adding a new node returned it back to 0, so we balanced it. Hence the height didn't change, and we don't need to go up anymore.

If we get a balance factor that changes from -1 to 0, or +1 to 0, then the height didn't change and we stop.

What if we want to insert 10?


```
                          | Balance Factors
        12                | -1
       /  \               |
      /    \              |
     /      \             |
    /        \            |
   3         17           | 2 0
  / \       /  \          | 
 1   7     14  19         | 0 1 0 0
    / \                   | 
   5   8                  | 0 1
        \                 |
        10                | 0
```

Note that the node at 3 violates the AVL Property. It is right heavy.

Then the left subtree of 12 is right heavy, and the right subtree of 7 is also right heavy. If we left rotate


```
                          | Balance Factors
          12              | -1
         /  \             |
        /    \            |
       /      \           |
      /        \          |
     /          \         |
    7            17       | 0 0
   / \          /  \      | 
  3   8        14  19     | 0 1 0 0
 / \   \                  | 
1   5   10                | 0 0 0 
```

In order to maintain the BST property, 5 must be inserted as the right child of 3 to maintain the BST property.

Notice that the height of the left subtree of 12 (with root 7) (which we rebalanced), has the same height as before inserting 10, so we don't have to go up anymore.


What if instead of inserting 10, we insert 6?


```
                          | Balance Factors
        12                | -1
       /  \               |
      /    \              |
     /      \             |
    /        \            |
   3         17           | 2 0 <-- Balance factor of 2 is off. (3 is Right Heavy)
  / \       /  \          | 
 1   7     14  19         | 0 -1 0 0 (7 is Left Heavy)
    / \                   | 
   5   8                  | 1 0
  /                       |
 6                        | 0
```

Again, lets try a left rotation on left subtree of at 12.


```
                          | Balance Factors
          12              | -1
         /  \             |
        /    \            |
       /      \           |
      /        \          |
     /          \         |
    7            17       | -2 0 <-- 7 is unbalanced, and is left-skewed
   / \          /  \      | 
  3   8        14  19     | 0 1 0 0
 / \                      | 
1   5                     | 0 1
     \                    |
      6                   | 0 
```

This doesn't work.

Instead, we right rotate on the right subtree rooted at 3



```
                          | Balance Factors
        12                | -1
       /  \               |
      /    \              |
     /      \             |
    /        \            |
   3         17           | 2 0 
  / \       /  \          | 
 1   5     14  19         | 0 -1 0 0
      \                   | 
       7                  | 0
      / \                 |
     6   8                | 0 0
```
Now we left rotate left subtree of 12


```
                          | Balance Factors
           12             | -1
          /  \            |
         /    \           |
        /      \          |
       /        \         |
      5         17        | 0 0 
     / \       /  \       | 
    3   7     14  19      | -1 0 0 0
   /   / \                | 
  1   6   8               | 0 0 0

```


**Delete(T, x)**
* Done in tutorials

