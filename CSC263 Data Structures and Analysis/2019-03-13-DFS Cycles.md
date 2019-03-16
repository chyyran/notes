# 2019-03-13
We can use DFS to discover whether or not a graph has cycles/

* Recall a discovery edge is an edge that we have successfully discovered a new node from.
* A tree edge is an edge `(u, v)` where `u` is the parent of `v`
* A forward edge is when `u` is an ancestor of `v`,
* And a back edge is when `u` is a descendant of `v`
* Cross edge is a non-tree edge that is neither a forward nor backward edge


We will use the following claims

1. **`u`** is an ancestor of `v`, iff `d[u] < d[v] < f[v] < f[u]`
2. For any two node `u`, and `v`, we can not have `d[u] < d[v] < f[u] < f[v]`
3. If \((u, v) \in E\), then `d[v] < f[u]`. That is, by the time we finish exploring `u`, we have must have **already discovered `v`**.

### White path theorem
For all graphs \(G\) and all DFS of \(G\), if at some point we see that \(v\) becomes a descendant of \(u\), at the time \(d[u]\) that the DFS discovers \(u\) (that is, \(v\) is not discovered yet), we will find a path that leads from \(u \to v\) that consists entirely of white nodes. This holds true for both directions; that is, when a node \(u\) is discovered, if you see a path that is white that leads to some node \(v\), then \(v\) will become a descendant of \(u\).

Suppose \(v\) is a descendant of \(u\) in a DFS. Let \(u \to u_1 \to u_2 \to ... \to u_j \to u_k \to v\) be the DFS discovery path from \(u\) to \(v\).

At the time when \(u\) is discovered, \(u_1, u_2, ..., v\) are all white! All the other node on that path have not been discovered yet, because \(u_1\) will be discovered by \(u\), \(u_2\) by \(u_1\), and so forth.

Consider \(G\), and any DFS of \(G\). Suppose that at the time \(d[u]\) when \(u\) is discovered and there is a path from \(u\) to \(v\) consisting entirely of white nodes. 

We want to show that for every node \(n\) in the path from \(u \to v\), including \(v\), \(n\) becomes a descendant of \(u\).

Suppose for contradiction that the claim is false; some node in the path from \(u \to v\) does not become a descendant. Let \(z\) be the closest node to \(u\) in the path that does not become a descendant of \(u\). Let \(w\) be the node before \(z\) in the path.

By definition of \(z\), \(w\) becomes a descendant of \(u\), or \(w = u\).

1. \(d[u] < d[z]\) (When \(u\) is discovered, \(z\) is white)
2. \(d[z] < f[w]\) (\(z\) is discovered before we finish exploring \(w)\).
3. \(f[w] \leq f[u]\) (\(w\) is a descendant of \(u\), or \(w = u\))

Hence \(d[u] < d[z] < f[u] \implies d[u] < d[z] < f[z] < f[u]\). But if the exploration interval is inside the exploration of the other node, then we must have that \(z\) is a descendant of \(u\), which is a contradiction!

We can use this theorem to show that for all **directed graphs** \(G\), and all DFS of \(G\), \(G\) has a cycle iff the DFS of \(G\) has a back edge!

Suppose \(G\) has a back edge \((v, u)\). Then \(v\) is a descendant of \(u\). Hence there is a path \(u \rightsquigarrow v\) in the DFS forest. Hence there is a cycle \(u \rightsquigarrow v \to u\)

Suppose \(G\) has a cycle \(C\). Let \(u\) be the first node in \(C\) that the DFS discovers. Let \(v\) be the node before \(u\) in \(C\). At the time \(u\) was discovered, the nodes in the path \(u \rightsquigarrow v\) are all white (the only node that is grey is \(u\)). By the WPT, \(v\) becomes a descendant of \(u\). When \(v\) is explored, the edge \((v, u)\) is explored. Since \(v\) is a descendant of \(u\), \((w, u)\) becomes a back edge. Hence the DFS becomes a back edge.

Hence we can verify that \(G\) has a cycle in linear time.

Does this theorem holds for undirected graphs? What does *back-edge* mean for undirected graphs?

When we do a DFS, one direct will occur first. We will then define that an edge is a back-edge, if on the first time the edge is traversed and labeled a back-edge, then it will remain a back-edge until the search is complete.

How can we prove this? (left to the reader lol)


