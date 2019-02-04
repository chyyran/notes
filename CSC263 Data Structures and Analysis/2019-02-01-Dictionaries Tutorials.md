## Booking system
We want to be able to make a booking system that can book arbitrarily small intervals.

*Goal*: Maintain a set \(S\) of closed intervals (\([low, high]\)), with operations

\(Insert(S, I) := S \gets S\cup\{I\}\)
\(Delete(S, I) := S \gets S - \{I\}\)
\(Search(S, I) := S \to I' \in S \implies I \cap I' \neq \emptyset, I' \notin S \implies Nil\)

* Search returns an overlapping interval, or nil if such an interval doesn't exist
  
* The set of intervals maintained, all the intervals are disjunct
* We use binary search to filter out any non-overlapping intervals
* Starting time as the key
* Store intervals in AVL trees?
  

```
       |----|
      /      \
  |--|        |---|
 /
 |---------------| <-- overlap (has earlier start time)
```

Suppose we knew how long the left interval extend? What is the largest ending time contained in the subtree rooted at a node?

```
  |-|
 /   \
/\ <- store the largest starting time of the tree in the left
```

Can we augment the node of a AVL tree? We an augment when we want to store data that is just a function of the left and right subtrees.

```
 node
+----------+---------+
| key      | value   |
+----------+---------+
| balance factor     |
+----------+---------+
| left     | right   |
+----------+---------+
| parent             |
+--------------------+
| **max**            | 
+--------------------+
max is largest ending time of any interval rooted in the subtree
```

Hence we have `max` = `left.max + right.max + self.endtime`

Then we can determine where to look. Make sure that the augmented field can be updated efficiently when we update the tree.

## Pseudocode

**`Search(S, I)`**
  * y = root(T)
  * while y is not NULL and 

```python
def search(tree, interval):
    y = tree.root
    while y is not None and len(intersect(y.interval, interval)) == 0: # is there any intersection? if there is, return the root
        if y.left is not None and y.left.max >= interval.start:
            y = y.left
        else:
            y = y.right
    return y
```

If the left subtree interval crosses into the right, side, we look at the left subtree because we're guaranteed we'll find something in there.