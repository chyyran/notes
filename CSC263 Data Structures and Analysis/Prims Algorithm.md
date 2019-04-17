# Prim's algorithm
```
T <- single vertex v in G
while |T| < n
    let e be the min weight edge leaving T
    T <- T + e
return T
```
This algorithm finds an MST for an undirected weighted graph.

How do we find \(e\)?


* Partial tree T contains some of the vertices in the graph
* Look at all the edges that are leaving the tree
  * one endpoint in the tree, one endpoint not in the tree
* If we cut all the edges, theres no way for a vertex from T to get to the rest of the graph.
* Spanning tree is supposed to keep those guys connected.
* If youre a minimum weight spanning tree, you need to take the min weight edge.
* If T' is the MST, then T has an edge in the cut.

```
+---+   +---+
| T |===| G |
|   |   |   |
|   |===|   |
|   |   |   |
|   |---|   |
+---+   +---+
```

The MST must have picked the lightest edge `---` in the cut. 

How can we find the minimum weight edge?

If the edge weights are unique, then there is a unique MST. Then the final tree, the edge in T are in every MST of G.

All of the edges in our tree are a part of every MST. Suppose for contradiction that T' has some edge not in T, but it has all the edges of T. But T was a spanning tree, and if you add an edge to a spanning tree it has a cycle.


Suppose \(T_1\) and \(T_2\) be 2 MSTs. \(E_1\) and \(E_2\) their edges. Consider \((E_1- E_2)\) and \((E_2 - E_1)\) Trying to look at the edges that are not in both \(E_1\) and \(E_2\). Let \(e\) be the cheapest edge. WLOG, assume \(e \in E_1 \notin E_2\) \(T_2 + e\) has a cycle \(C\). Claim that \(C\) ha an edge \(f \neq E_1\). \(C\) is a cycle, and we know that \(T_1\) does not form a cycle. Thus there must be some edge in \(C\) that is not in \(E_1\), but by definition \(f \neq e, f \in E_2\) Hence, \(f \in (E_2 - E_1)\), because \(f\) is exactly one of the trees. \(e\) was the cheapest edge, and we have unique weights, so \(|f| > |e|\). 

We claim that \(T_2 + e - f\) is a tree. Essentially, \(T_2\) contained the cycle if we had \(e\). But if we remove \(f\) then we break the cycle, and reduce the weight, but if \(T_2\) was an MST, thats a contradiction.