# 2020-02-10 Max Flow Min Cut theorem
* Notes based on Vassos Hadzilacos's CSCC373 Lectures in Fall 2019. Lectures 16 and 17.

* A *flow network* \(\mathcal{F} = (G = (V, E), s, t, c)\) is a directed graph \(G\), a start node \(s\), and a target node \(t\), with capacities on each edge denoted \(c : (u, v) \to \R^+\). For our purposes, we will restrict \(c\) to integers.
  * It is possible to construct a flow \(f\) such that the algorithm converges to a number that is not even the max flow.
* A *flow* is a function \(f : (u, v) \to R^+\) that satisfies the following two properties
  * The capacity property \(\forall e \in E, 0 \leq f(e) \leq c(e)\), or that "the flow in an edge can not exceed its capacity"
  * The conservation property \(\forall v \in V - \{s, t\}, \sum_{e \in in(v)} f(e) = \sum_{e \in out(v)} f(e)\), or "all flow going into a node must come out of the node" (except the source and target node.
    * \(in(v)\) is simply defined as \(\{(u, v) : (u, v) \in E\}\)
    * likewise, \(out(v)\) is simply defined as \(\{(v, u) : (v, u) \in E\}\)