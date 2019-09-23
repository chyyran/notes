# 2019-09-18 Heuristic Search

* Order `OPEN` according to some search criteria
  * In uninformed search, we don't have any information about the domain
  * Often we have some other knowledge about the merit of a node.
  * Want to eliminate nodes that don't have merit
* Different ways to measure the merit
  * Are we concerned about the cost of the solution?
  * Are we concerned about minimizing computation?
    * If we have a large search space, we may only care about getting *a* solution, instead of an optimal solution.
* Want to develop a domain specific heuristic function \(h(n)\) (`h :: State -> Cost`)
  * \(h(n)\) guesses the cost of getting to the goal from the node \(n\)
  * \(h(n)\) is only a function of `n.state()`. If `n.state() == n2.state()`, then `h(n) == h(n2)`.
  * If \(h(n_1) < h(n_2)\), then we guess that it's cheaper to get to the goal from \(n_1\) than from \(n_2\).
  * We require that \(h(n) = 0\) for every \(n\) whose final state satisfies the goal.
* We use \(h(n)\) in a greedy best-first search to rank the nodes on OPEN.
  * Always expand node with lowest \(h\) value, ignoring the cost
  * This method ignores the cost of getting to \(n\), s it can be lead astray exploring nodes that cost a lot but seem to be close to the goal
* Greedy search can be very efficient, but requires a good heuristic
* Incomplete if it fails to find a solution
  * does not imply a solution does not exist
* The solution returned by a greedy search can be very far from optimal &mdash; not easy to control greedy search so that it finds close to optimal solutions.
  * If we add some randomness to the greedy search, we can *sometimes* get cheaper solutions.

## A* Search
* \(h(n)\) is the heuristic of `n.state()`, and \(g(n)\) is a function of the path: the sum of the costs of actions on the path. `g :: Node -> 
* Define \(f(n) = h(n) + g(n)\) 
* A* always takes the node with the smallest \(f\) value.
  * We keep expanding the cheapest node in the search. If the successors costs too much, we jump to a different node.
* Suppose we have multiple nodes with the lowest \(f\) value? Which one to pick?
  * If we have *admissible heuristics*, this can give an exponential speedup
  * We break ties by choosing the one as the lowest \(h\) value.
  * Since \(f = g + h\), if \(f_1 = f_2\), then \(g_1 + h_1 = g_2 + h_2 \iff g_1 > g_2 \iff h_1 < h_2\). Since \(h_1\) is smaller, we guess that it is closer to the goal and will prefer to expand \(n_1\).
    * Intuitively, \(g\) is the cost already incurred, and \(h\) is "how far away the goal is".

* Properties of A*
> **Proposition	1**. For every path \(n = <s_0,...,s_k>\)	in	the	search space, at any time in the running of	A* either:
> 
> 1. \(<s_0,...,s_k>\) has been expanded
> 2. Some prefix \(<s_0,...,s_i>\) is on `OPEN`.

Proof omitted (see slides)

* If there are infinite states, then A* will not terminate if there are no solutions
* If there are finite states, and we do cycle checking, we will exhaust the search space and return that there are no solutions.

### Completeness of A*
> **Theorem 1** A* always finds a solution if one exists, if 
>   1. Every state has a finite number of successors (finite branch factor)
>   2. Every action has a finite cost \(\geq \epsilon > 0\)
>   3. \(h(n)\) is finite for every path \(n\) that can be extended to reach a goal state.


## Constructing Heuristics
