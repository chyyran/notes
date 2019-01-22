# Dictionaries

Look at the ADTs we have so far.

|ADT|DS|Insert|Min|Extract|Union|
|-|-|-|-|-|-|
|PQ|Min-Heap|\(\log n\)|\(1\)|\(\log n\)|NO|
|Mergeable PQ|Min Binomial Heap|\(\log n\)|\(\log n\)|\(\log n\)|\(\log n\)|

We can not search with these ADTs!

```rust
<T> trait Dictionary<T> {
    fn search(mut self, x: &T);
    fn insert(mut self, x: T);
    fn delete(mut self, x: &T); 
}
```

Consider LinkedList for the dictionary ADT. The time complexity for search operation is...

\(Insert\): \(O(1)\)
\(Search\): \(O(n)\)
\(Delete\): \(O(n)\).

Not very good!

But we have Binary Search Trees!

* For each node, every key in the left subtree is less than or equal to the right subtree.
* key in *left* subtree \(\leq\) node's key \(\leq\) keys in *right* subtree
* keys are not unique!

If we do an **in-order traversal** of the tree, 

* Traverse left subtree recursively
* The root node
* Traverse right subtree recursively

We get the keys in sorted order.

Is the BST for a set of keys \(S\) unique? **No!**

Consider this BST with \(S = \{2, 4, 5, 6, 7, 9\}\)
```yaml
4:
 - 2
 - 7:
   - 5:
     - 6
   - 9
```

## Rotations
From the example above, after a left rotation anchored on 7, we get
```yaml
7
 - 4:
   - 2
 - 9
 # .. but where do 5 and 6 go? They used to be the children of 7, and are smaller. 7 can not have more than 2 children!

7
 - 4:
   - 2
   - 5:
     - 6
 - 9
```

Which is a BST containing the same values in \(S\).

