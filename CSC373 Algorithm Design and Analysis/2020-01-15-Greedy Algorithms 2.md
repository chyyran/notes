# 2020-01-15

## Interval Colouring Problem
* Given a set of intervals, colour all intervals so that intervals having the same colour do not intersect, and the minimum possible number of colours used.
* > Sort intervals ascending based on the start time
* > Pick the colour with the smallest number used in the past

* We use a "proving approximation", defining a lower bound or upper bound to argue that any solution satisfies the bound.
* Consider the maximum number of intersecting intervals in the input set at any time
  * The number of colours must be at least this large
  * Prove the greedy algorithm based on EST never returns more than this number of colours.
* Let \(k\) be the maximum number of conflicting jobs
* Assume the algorithm used more than \(k\) colour, and it is the first time the algorithm uses \(k+1\) colours on an interval \(j\)
* Since the maximum number of conflicting jobs is \(k\), this contradicts, since that means there is \(k+1\) jobs.

## Single node shortest path problem
* Given a weighted directed graph \(G\) we want to find the shortest node
  * Dijkstra's algorithm
    * Idea: greedily pick the node with the lightest edge that is unvisited
    * Initialize \(S = \{s\}\) (start node), and \(d(s) = 0\)
    * \(\pi(v) = \min_{e = (u, v) : u \in S} d(u) + l_e\) is the minimum of the length of the shortest path from s \(d(u)\) followed by the cost of a single neighbouring edge
      * Recall A*, where \(l_e\) is the heuristic  
    * While \(V / S\) is not empty:
      * (Loop invariant is that \(d(u) = \min s - u. \forall u \in S\))
      * Pick \(u \notin S\) with smallest \(\pi(u)\)
      * \(S = S \cup \{u\}, d(v) = \pi(v)\)
  * Proof of correctness
    * We are trying to prove for each node \(u \in S\), \(d(u)\) is the length of the shortest path to \(u\) from \(s\).
    * Base case is trivial, since \(|S = \{ s \}| = 1, d(s) = 0\)
    * Inductive: Assume \(d(u)\) is the length of the shortest path to \(u\) from \(s\), where \(|S| = k\).
      * Let \(v\) be the next node added to \(S\), hence \((u, v)\) is the final edge
      * A shortest path from \(s\) to \(u\), plus \((u, v)\) is a path \(s\) to \(v\) with cost \(\pi(v)\)
        * Since Djikstras picked the smallest \(\pi\)
        * Also note that \(\pi(v) \geq d(v)\)
      * Consider any other path from \(s\) to \(v\) \(P\). Let \(e = (x, y)\) be the first path in \(P\) that leaves \(S\), and \(P'\) the sub path from \(s\) to \(x\).
        * Since \(\pi(v)\) was chosen, \(\pi(v) \leq \pi(y)\) by necessity.
        * [Show contradiction here on \(d(v)\)]