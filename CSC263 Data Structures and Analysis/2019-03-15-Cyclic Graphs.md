# 2019-03-15

How can we determine if an undirected graph \(G\) is connected?
1. Pick a node \(v\)
2. Run BFS from \(v\). If the graph is connected, then 
3. Check all distances are less than infinity. If so, then return connected. 

How can we determine if a graph is acyclic? 

While we BFS from a point and discover the node that is already colored, if we ever discovered a previously explored node (not white,and not the parent), then it is cyclic.

What if the graph is unconnected? We can simply modify the algorithm to BFS from all vertices, until none are unexplored.

The runtime of this is \(O(n + m)\), but we can show tighter graphs. Consider if the graph is acyclic. Then we have \(m \leq n-1\), then this algorithm takes time \(O(n)\). But we can assert that this algorithm *always* takes \(O(n)\). If we explore \(n\) edges, then by the time we see the \(n\)th edge, a cycle would have been discovered, and we would have returned early. We can always stop after looking at \(n\) edges.

Every iteration, the number of white nodes decreases, or we stop. By the time we explore the \(n\)th edge, then either we see another white node (which is impossible), or it's grey and block, which means we stop.

Can we prove that any finite, connected, undirected graph has a vertex we can remove that does not disconnect the graph?

A spanning tree is a subgraph of a graph, so that it is a tree, and every vertex is reachable --- the largest subtree of a graph. Every connected graph has a spanning tree that involves all its vertices. 

Given the spanning tree \(S\) of a graph \(G\), can we prove this? We can simply remove a leaf from the spanning tree. If we remove a leaf, it doesn't disconnect the rest of the graph: the remaining vertices are still connected. 

How can we generate spanning tree? If all the neighbours of a vertex are already non-white, then it is a leaf, and you can safely remove the node.