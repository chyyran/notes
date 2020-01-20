# 2020-01-17 Greedy Algorithms 3
## Minimum Spanning Trees

### Kruskral's Algorithm
Kruskal sorts all edges on the base in non-decreasing order, and then picks the edge with smallest weight. It progressively adds edges, checking if they form a cycle, until we get an MST.

We use a "promising solution" argument to prove optimality.

Let \(X_i\) be the partial solution after the \(i\)th iteration. We want to show \(X_i\) is promising for all \(i\).

Let \(e_i = (u, v)\) be the \(i\)th smallest weight edge.

Case 1: adding \(e_i\) forms a cycle, so \(X_{i+1} = X_i\)
Case 2A: adding \(e_i\) is acyclic, and \(e_{i+1} \in OPT_i\), so \(OPT_{i+1} = OPT_i\)
Case 2B: adding \(e_i\) is acyclic, but \(e_{i+1}\) is not in the optimal solution (the next edge to be added is not optimal). Then, we create a new \(OPT_{i+1}\), considering the cycle \(C\) created by \(e_i\) to \(OPT_i\) (since the optimal solution is a tree, adding a new edge will create a cycle). There must be some edge in the cycle with lesser weight as \(e_i\), that we can replace \(e_i\) with.


### Prim's Algorithm
Pick a node, find the minimum weighted edge coming out of the node, and pick that. Progressively do that without creating cycles. 

## Huffman Encoding
What is a prefix-free code?
* Assign each character a binary code
* Assign more frequent characters shorter codes
* No character codes is a prefix of another character code
* Prefix free codes are a tree
  * What is then the lowest cost tree? A **binary tree** based on the probablities of the symbol the nodes represent.

Consider the following frequency table

|Letter|Code|Frequency|
|------|----|---------|
|A| |10|
|B| |15|
|C| |12|
|D| |3|
|E| |4|
|F| |13|
|\n| |1|


Start with the two lowest frequency symbols, and create a parent node with the weight the sum of the frequencies

```
 4
/ \ 
D \n
```

Progressively do this, removing letters from the list 

```
  18
 /  \
A    8
    / \
   E   4
      / \
      D \n
```

No node has a frequency greater than 18 at this point, so we start a new tree, in this case with C and F


```
  25
 /  \
F    C
```

Then the next remaning nodes are the tree with 18, and B with weight 15. Then, we only have the frequency 25 tree left, and we connect them together.


```
       58
      /  \
     /    \
   25     33 
  /  \   /  \
 F    C B    18
            /  \
           A    8
               / \
              E   4
                 / \
                D  \n
```

Any left branch we have a 0, and any right branch a 1. Notice the two lowest frequency nodes are always siblings, and that the left and right-ness does not matter.

Hence we get the following encoding

|Letter|Code|Frequency|
|------|----|---------|
|A|110|10|
|B|10|15|
|C|01|12|
|D|11110|3|
|E|1110|4|
|F|00|13|
|\n|11111|1|
