# 2020-02-02 Bellman Ford Algorithm
* Notes based on Vassos Hadzilacos's CSCC373 Lectures in Fall 2019. Lectures 14 and 15.


## Why doesn't Djikstra's work?
* If all nodes are non-negative, adding an edge will never make a path shorter. Thus local optimality is optimal.
* Recall Djikstra's algorithm:
  * Set `dist[source] = 0`
  * Set all other distances to infinity
  * While the min-priority queue of unvisited nodes is not empty
    * Pop `v` from the queue
    * For each neighbour of `v`
      * Set `a = dist[u] + length(u, v)`
      * If `a < dist[v]`
        * `dist[v] = a`
        * Set the parent node of `u` to `v`
* Essentially, Djikstra is a special case of A* where \(g(n)\) is the cost to reach a node, and \(h(n)\) is the heuristic.

* We need the case where we have negative weight edges

## Bellman-Ford algorithm 

* DP Algorithm to give the shortest path for a directed graph.
  * Time \(O(n^3)\) (Adjacency Matrix) or \(O(m n)\) (Adjacency List)
* Input: \(G = (V, E)\), some weight function \(E \to \R\), and \(s \in V\) the starting node.
  * We will get the path to the target node \(t \in V\) for free.
* Output: Weight of the shortest path, and we are able to augment the base algorithm to return the value.
* Need to assume \(G\) has no negative weight cycles.
* If we have a negative length cycle then "shortest path" is meaningless.
  

* Assume \(p\) is the shortest path from \(s\) to \(t\). Then the subpath from \(s\) to \(u\) is also the shortest \(s\) to \(u\) path.
  * Our subproblem is to find the minimum weight \(s\) to \(u\) paths using \(\leq i\) edges from \(0 \leq i \leq n-1\)
    * Why \(n -1\)? If we have a cycle, there may be an infinite length subproblem. Consider if there is a cycle between \(u\) and \(t\), then our subproblem does not get smaller. So we instead focus on the number of edges. See **Claim 1** for choice of \(n-1\).
  * Let \(L[i, u]\) be the minimum weight of an \(s\to u\) path with \(i\) edge. If there is no path, then it is \(\infty\).
  * There are two cases involving \(p\).
    * Shortest \(s \to u\) path with \(\leq i\) edges actually has \(\leq i - 1\) edges.
      * There is a shorter path with less than \(i\) edges that we can take.
    * Shortest \(s \to u\) path with \(\leq i\) edges has exactly \(i\) edges.
      * Having \(i\) edges in the path is the best we can do.
  * So, our recurrence for \(L[i, u]\) is as follows
   
    \[L[i, u] = \min L[i - 1, u] \cup \{L[i-1, v] + wt(v, u) : (v, u) \in E\}\]

  * We take the smallest weight of the either the path with less than \(i - 1\) edges, or we take the path with less than \(i-1\) edges up to \(v\), then the smallest edge from \(v\) to \(u\).
  * This works if \(i > 0\). Otherwise, the base cases are \(L[0, u] = 0\) if \(u = s\), and \(\infty\) if \(u \neq s\), since we can't get from \(s \to u\) with 0 edges.
  * Our shortest path has no cycles, since we have no negative weight cycles. Hence, the longest path from \(s\) to any other node can have \(n-1\) edges.
    * **Claim 1:** If \(G\) has no negative-weight cycles reachable from \(s\), then for every node \(u\) reachable from \(s\), there is a shortest path \(s \to u\) with at most \(n-1\) edges.
    * **Proof 1:** Let \(p\) be a shortest path from \(s \to u\) with the smallest number of edges, Since \(G\) has no negative weight cycles reachable from \(s\), no node \(w\) repeats in \(p\). If it did, then we could have removed the subpath \(w \to w\), and it would decrease the weight of the path, which is shorter and with fewer edges than \(p\). Hence \(p\) has at most \(n - 1\) edges.
* The algorithm follows:
  ```python
  def bellman_ford(g, wt, s):
    L[0, s] = 0
    for u != s in g.nodes:
        L[0, u] = inf
    for i in range(1, n-1):
        for u in g.nodes:
            L[i, u] = L[i - 1, u]
            for v in u.neighbours:
                if L[i, u] > L[i-1, v] + wt(v, u):
                    # found a shorter path
                    L[i, u] = L[i - 1, v] + wt(v, u)
    return L[n-1, u] # weight of the shortest s to u path
  ```
  We can find the shortest path by just keeping track of `u` when updating `L` in the second to last line.
  * Bellman-Ford can also detect negative weight cycles.
    * **Claim 2:** \(G\) does not have a negative weight cycle reachable from \(s\) if and only if \(\forall u. L[n,u] = L[n-1, u]\)
    * **Proof 2:**
      Forward direction is a direct corollary from **Claim 1**. If the graph has no negative weight cycles, there is a shortest \(s \to u\) path with \(n-1\) edges, so allowing \(n\) edges will not decrease the shortest path.
      The other direction is as such: If \(\forall u.L[i, u] = L[i-1, u]\), Then \(\forall u. L[i+1, u] = L[i, u]\). Essentially if at any iteration there is no more minimum path, then it will never change. If there was a negative weight cycle, then the weights would get smaller and smaller. 
    * We simply run it one more time, and check if any weight changed. If so, we have an negative weight cycle.
    * We can easily find a negative weight cycle by adding a new node \(s*\), and attaching exiting edges to every node in \(G\) with weight 0. No new cycle of negative weight would have to be created, and we can determine if there any any negative weight cycles.
   

## Floyd-Warshall
