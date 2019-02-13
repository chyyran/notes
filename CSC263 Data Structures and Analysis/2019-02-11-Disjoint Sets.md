# 2019-02-11

## Disjoint Set

* \(n\) distinct elements \(1, 2, 3, ..., n\)
* Each element is in its own set
    * \(S_1\ = \{1\}, ..., S_n = \{n\}\) 
* Each set has a representative element
* \(S_x\) is the set represented by the element \(x\)



* Operations
    * \(Union(S_x, S_y)\): Creates set \(S = S_x \cup S_y\), and return the representative of \(S\)
    * \(Find(z)\) given a pointer to \(z\), find \(S\) that contains \(z\) and return the representative of \(S\)

### Example

| |\(S_1\)|\(S_2\)|\(S_3\)|\(S_4\)|\(S_5)|
|-|-|-|-|-|-|
Initial|{1}|{2}|{3}|{4}|{5}|
Union(\(S_3, S_4)\)|{1}|{2}|{3, 4}|x|{5}|
Find(\(4\)) = \(S_3\)| | | |
Union(\(S_1, S_5)\)|{1, 5}|{2}|{3,4}|x|x|
Union(\(S_1, S_3\))|{1, 5, 3, 4}|{2}|x|x|x|
Find(\(4\)) = \(S_1\)|
Find(\(2\)) = \(S_2\)|
Union(\(S_1, S_2)\)|{1, 5, 3, 4, 2}| 

### Observations

Each \(Union\) reduces the number of sets by 1, thus we can do at most \(n-1\) unions.

Let \(\sigma\) be a sequence of \(n-1\) unions mixed with \(m \geq n\) finds.

Goal: A datastructure that minimizes the cost of executing such sequences.

### 1. Doubly Linked Lists

* One list per set
* Store a head and tail pointer for each set

```
h1
   \ 
    \
S1 = 1 <-> 5 <-> 3 <-> 4 
                        \
                         \ 
                          t1

h2
   \ 
    \
S2 = 2 <-> 6 <-> 6 
                  \
                   \ 
                    t2
```
* Union is just attaching the two lists, which is constant time
* Find is linear time
* Hence the worst case complexity of \(\sigma\) is \(O(1n + mn) = O(mn)\), since \(n\) unions, and \(mn\) finds. (note, \(m \geq n \implies mn\) dominates).

Can we modify the linked list which makes Find more optimal?

### 2. Augmented linked list

* Each node points to the first element


```
           +-----------+
          /            |
         +-------+     |
h1      /        |     |
   \   +---+     |     |
    \ /    |     |     |
S1 = 1 <-> 5 <-> 3 <-> 4 
                        \
                         \ 
                          t1


         +-------+                  
h2      /        |
   \   +---+     |
    \ /    |     |
S2 = 2 <-> 6 <-> 6 
                  \
                   \ 
                    t2
```

* Now Find is constant time, but Union is linear time
* When we merge the second set, we need to change all the pointers in the second set

\(\sigma\) is now \(\mathcal{O}(n^2 + m)\), since each union takes \(O(n)\), and each find takes \(O(1)\).

However, if we always append the smallest list onto the bigger list (keep track of the side of the list), it turns out that \(\sigma\) then becomes \(O(m + n \log n)\). This is called **Weighted Union**

### 3. Forest data structure for Union-Find

* Each set is represented by  tree
* Each node represents an element
* Each non-root node points to its parent
* The root node contains the set representative

\(S_1 = \{1, 3, 2, 8, 5, 10\}\)
```
  1
 / \
3   2
   /|\
  8 5 10
```

\(S_6 = \{6\}\)

```
6
```


\(S_9 = \{9, 7, 4\}\)

```
  9
 / \
7   4
```

We keep an auxiliary array of size \(n\) that points to the element at \(A[x]\)

In this case, we look at \(A[5]\) to find the node 5 at the tree \(S_1\), then traverse up the tree to the root to find the representative.

If we want to union \(S_1, S_9\), we just attach one tree as the child of the other tree

```
    9
   /|\ 
  1 7 4
 / \
3   2
   /|\
  8 5 10
```

#### Example


Initial:

```
1 2 3 4 5
```

Union(5, 1)

```
  1 2 3 4
 /
5
```
Union (3, 4)

````
  1 2 4
 /     \
5       3
````

### Cost
Cost of find will be \(O(1 +\text{length of the Find path})\)
Cost of union is constant.

Recall that \(\sigma\) is the sequence of \(n-1\) Unions mixed with \(m \geq n\) finds.

What is the cost of \(\sigma\) in this case? Well the worst case degenerates into a linked list, then we have time \(O(mn)\). (Union is constant time)

How can we reduce the cost? We need to reduce the length of the find paths, by reducing the height of the trees are reduced.


#### Heuristic (Weighted Union by size)

The smaller size tree becomes the child of the bigger tree.

The cost of executing \(\sigma\) then becomes \(n + m \log n\), since the cost of find becomes \(\log n\). 

Lemma: With WU, any tree \(T\) of height \(h\) created during \(\sigma\) has at least \(2^h\) nodes. That is \(|T| \geq 2^h\). Prove inductively on \(h\).