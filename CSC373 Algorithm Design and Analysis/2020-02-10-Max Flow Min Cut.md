# 2020-02-10 Max Flow Min Cut theorem
* Notes based on Vassos Hadzilacos's CSCC373 Lectures in Fall 2019. Lectures 16 and 17.

* A *flow network* \(\mathcal{F} = (G = (V, E), s, t, c)\) is a directed graph \(G\), a start node \(s\), and a target node \(t\), with capacities on each edge denoted \(c : (u, v) \to \R^+\). For our purposes, we will restrict \(c\) to integers.
  * It is possible to construct a flow \(f\) such that the algorithm converges to a number that is not even the max flow.
* A *flow* is a function \(f : (u, v) \to R^+\) that satisfies the following two properties
  * The capacity property \(\forall e \in E, 0 \leq f(e) \leq c(e)\), or that "the flow in an edge can not exceed its capacity"
  * The conservation property \(\forall v \in V - \{s, t\}, \sum_{e \in in(v)} f(e) = \sum_{e \in out(v)} f(e)\), or "all flow going into a node must come out of the node" (except the source and target node.
    * \(in(v)\) is simply defined as \(\{(u, v) : (u, v) \in E\}\)
    * likewise, \(out(v)\) is simply defined as \(\{(v, u) : (v, u) \in E\}\)
* The value of a flow \(V(f)\), or \(|f|\) is the sum of the flows out of the source node.
  * \(\sum_{e\in out(s)} f(e)\). Because of conservation, this is equal to the sum of flows into the sink/target/
* The maximum flow problem takes
  * Input: A Flow network \(\mathcal{F} = (G, s, t, c)\)
  * Output: A flow \(f\) of maximum value: \(\forall f', V(f) \geq V(f')\)
* This is closely related to the min cut problem
  * Given a flow network \(\mathcal{F}\), a cut is a of a partition of the nodes of \(\mathcal{F}\), where one side contains the source \(s\), and the other contains the target node \(t\). 
    * \(S, T \subseteq V, st. s \in S, t \in T, S \cap T = \emptyset, S \cup T = V\)
  * Then the capacity of a cut \((S, T)\) is the sum of the capacities of all the nodes going from \(S\) to \(T\). 
    * \(C(S, T) = \sum_{u \in S, v \in T} c(u, v)\)
    * The direction is important! We are only interested in nodes that go from \(S\) to \(T\)
  * Then the min cut problem is to find a cut \(S, T\) of \(\mathcal{F}\) of minimum capacity. That is, \(\forall (S', T') of \mathcal{F}, c(S, T) \leq c(S', T')\)
    * We want to find the cheapest place to cut the graph into \(S\) and \(T\).
  * This is **equivalent to the maximum flow problem**
* We can use a notion of *pushing back flow* to maximize the flow network. This is called an *augmenting step*. Intuitively we do the following
  * Find a simple \(s \to t\) **undirected** path
  * Increase the flow on each edge \(e\) traversed forward by \(b\)
    * This corresponds to utilizing unused capacity
  * Decrease the flow on each edge \(e\) traversed backward by \(b\)
    * Corresponds to "redirecting" flow
  * This gets us a *better* flow! Why?
    * When we increase the flow, \(b \leq c(e) - f(e)\), where \(c(e) - f(e)\) is the unused capacity of the edge. 
    * We can't redirect more than the flow that goes through the edge: \(b \leq f(e)\)
* How do we compute the augmenting step?
* The residual graph \(G_f'\) with regards to the flow \(f'\), is a graph with the same nodes in \(G\) of \(\mathcal{F}\). Any residual capacity on each edge in \(f'\) has a **forward edge** in \(G_f'\) with the residual capacity as the value. Any **used** capacity in \(f'\) has a **backward edge** with value the used capacity.
  * Given a flow \(f\) in flow network \(\mathcal{F} = (G, s, t, c)\), and \(G = (V, E)\), the residual graph \(G_f\) with residual capacities \(c_f\), \(G_f = (V, E_f)\) where
    * For each edge \((u, v)\) such that \(f(u, v) < c(u, v)\), we put an edge \((u, v)\) with residual capacity \(c_f(u, v) = c(u, v) - f(u, v)\) in \(E_f\). These are the **forward edges**
   * For each edge \((u, v)\) such that \(f(u, v) > 0\), we put an edge \((v, u)\) with residual capacity \(c_f(v, u) = f(u, v)\) in \(E_f\). These are the **backward edges.**
     * Backward in the sense that it points in the opposite direction of the graph that gave rise to it. 
   * All residual capacities are **strictly positive! \(> 0\)**
   * An \(s \to t\) path in a residual graph is an opportunity to improve flow!
     * We can improve the flow by the minimum of the residual capacities along the edges of the \(s \to t\) path.
     * The residual graph tells us where we can add or push back flow.
     * For every edge that's a forward edge, we add the minimum capacity of the edges on the residual graph and subtract that amount from the backward edges.
     * **This is the augmenting step!!**
 * \(augment(f, p)\), where \(f\) is the flow, and \(p\) is some simple \(s \to t\) path on \(G_f\)
   * \(b\) is the minimum residual capacity of all the edges on \(p\)
   * for each edge \((u, v) on p\)
     * if \((u, v)\) is a forward edge, then \(f(u, v) = f(u,v) + b\)
     * else \(f(v, u) = f(v, u) - b\)
   * return \(f\)
 * Then we rebuild \(G_f\) with the returned flow.
 * Proof that \(f\) is an **improved flow**
 * Lemma 1: If \(f\) is a flow an \(p\) is a simple \(s \to t\) path in \(G_f\), then \(f' = augment(f, p)\) is a better flow.
   * **better**: We've increased the flow on every forward edge and the first edge we increase is a forward edge, so we're increasing the capacity of the flow through one edge out of \(s\)
   * **flow**: We need to prove conservation and capacity
     * capacity
       * if \((u, v)\) is a forward edge, then \(f'(u, v) = f(u, v) = b\), and \(b\) is the minimum of all residual capacities.
         * \(b\) can be at most the residual capacity of \((u, v)\). That is \(b \leq c_f(u, v) = c(u, v) - f(u, v)\). We have not exceeded the capacity of the edge.
       * if \((u, v)\) is a backwards edge, then the flow on the real edge \(f'(v, u) = f(v, u) - b\). Then \(b\) is non-negative, because \(b\) is at most \(c_f(u, v)\), which on the backwards edge is defined to be \(f(v, u)\), the flow from \(v \to u\) on the actual graph.
     * conservation
       * Consider a simple path \(p\) in \(G_f\). On each edge in \(p\), some of them we subtract, and some of them we added \(b\).
       * At some vertex \(v\) in \(p\), we have the following cases
         * \(F \to F\): Both edges of \(v\) in the residual graph are forward edges
           * In the actual graph \(G\), this means that there is some path \(S' \to v \to T'\). Then both edges going through \(v\) had their capacity increased by the same \(b\).
         * \(F \to B\): The edge into \(v\) is a forward edge, and the edge out of \(v\) is a backwards edge
           * Then in \(G\), there is some path \(S' \to v \leftarrow T'\). On the left edge going into \(v\), we **added** \(b\) capacity, and the right edge we **subtracted** \(b\). There is not net change in the flow. Since we had conservation before, we still have conservation.
         * \(B \to F\): The edge into \(v\) is a backwards edge, and the edge out of \(v\) is a forwards edge
           * In \(G\), \(S' \leftarrow v \to T'\). On the left edge we **subtract** \(b\), and on the right we **add** \(b\). This is analogous to the above case.
         * \(B \to B\): The edge into \(v\) is a backwards edge, and the edge out of \(v\) is a backwards edge
           * In \(G\), \(S' \leftarrow v \leftarrow T'\). Both edges are decreased by the same amount \(b\), so conservation is preserved.
     * This augmenting step is repeated from the trivial flow with no flow anywhere, and we keep finding paths from \(S \to T\), and augment along the path, repeating this step until no paths can be found. This means that there is no longer a way to maximize the flow.
  * This is the **Ford-Fulkerson max flow algorithm**
    * Setup: for each edge \((u, v)\) of \(G\) do \(f(u, v) = 0\) 
    * Construct \(G_f\) residual graph
    * While \(G_f\) has a simple \(s \to t\) path do
      * \(p\) = any simple \(s \to t\) path in \(G_f\)
      * \(f\) = \(augment(f, p)\)
    * Update \(G_f\)
    * Return \(f\)
  * Updating \(G_f\) is linear in \(m + n\), and augment does linear work in up to\(n\) edges. Generally if we assume all nodes are reachable from \(s\), then one iteration takes \(O(m)\).
  * Proof of Ford-Fulkerson Termination
    * Remember that all capacities are integers. If we have irrational capacities, the flow can be infinitely improved, and this loop will never terminate! The converging number isn't even the maximum flow!
      * Then, \(f(u, v)\) is always an integer. It begins as an integer, and \(augment\) increases or decreases capacities by \(b\), which is a minimum of a set of integers.
      * \(C = \sum_{e \in out(S)} c(e) \leq V(\text{max flow})\)
        * That is, the sum of all the capacities going out of the source, is at most the value of the maximum flow. The most flow we can do is to saturate all the edges going out of the source
      * The flow we get after every augmentation, is strictly greater. Every iteration improves \(V(f)\) by at least one. 
      * It is then obvious then after at most \(C\) iterations, we need to stop.
    * Hence, Ford-fulkerson is pseudopolynomial in \(O(mC)\).
      * We can improve this by picking out paths cleverly
        * If we pick the "widest", or the one with the largest \(b\) (pick the path that improves the flow as much as possible)
          * This can be done with Djikstra's in \(O(n \log m)\)
          * Instead of choosing the shortest path, choose the "minimum widest path"
          * \(widthto(x) \max_{\text{nodes of current node}} \{widthto(v), width(e)\}\)
          * Where \(v\) is some neighbouring node of \(x\)
          * Then we have \(O(m \log C)\) iterations, so FF becomes \(O(m^2 \log C)\)
        * If we pick the path with the fewest edges, we get \(O(mn)\) iterations, which gives us an \(O(m^2 n)\) algorithms.
  * Proof of Ford-Fulkerson Correctness
    * The algorithm for minimum cut "falls out" of this proof!
    * Consider this **lemma 2**: For all flows \(f\), for all cuts \(S, T\) of \(F\), the value of the flow \(f\) is equal to the value of the sums of the flows going from \(S \to T\), minus the values of the sums of the flows going from \(T \to S\)
      * Let's define \(out(S) = \bigcup_{u \in S} out(u)\), and \(in(S)\) analogously
      * Then, the lemma is \(\forall \text{ flow } f \forall \text{ cut } (S, T) \text{ of } F, V(f) = \sum_{out(S) \cap in(T)} f(e) - \sum_{out(T) \cap in(S)}\)
      * The proof of this is just rearranging sums.
      * Recall by definition \(V(f) = \sum_{u \in S} [\sum_{e \in out(u)} f(e) - \sum_{e \in in(u)}f(e)]\)
        * Consider \(u = s\), then the stuff in the bracket is exactly the value of the flow. If \(u \neq s\), the stuff in the brackets are 0, by the conservation property.
      * We can rewrite this s \(V(f) = \sum_{u \in S} \sum_{e \in out(u)} f(e) - \sum_{u \in S} \sum_{e \in in(u)}f(e)\)
        * The first part is the set of edges out of S, otherwise \(\sum_{e \in out(S)} f(e)\). The second part is \(\sum_{e \in (S)} f(e)\)
      * If we split the set of edges into those that are internal to \(S\), and those that go from \(S \to T\), we can rewrite
      * \(V(f) = \sum_{out(S) \cap in(T)} f(e) + \sum_{out(S) \cap in(S)} f(e) - \sum_{in(S) \cap out(T)} - \sum_{in(S) \cap out(S)} f(e) = \sum_{out(S) \cap in(T)} f(e) - \sum_{in(S) \cap out(T)}\)
        * Essentially the edges within \(S\) that are going in and out within \(S\), are counted twice and cancel each other out from conservation.
    * **Cor 3** \(\forall f \forall (S, T) V(f) \leq c(S, T)\)
      * For any flow, and for any cut, the value of the flow is at least the capacity of the cut.
      * By the definitions, we have easily that \(V(f) \leq \sum_{e \in out(S) \cap in(T)} = c(S, T)\)
    * **Cor 4** \(\forall f \forall (S, T)\), if \(V(f) = c(S, T)\), then \(f\) is a max flow, and \((S, T)\) is a min cut. This is trivial
    * With this, we continue by replacement argument
    * Let \(f*\) be a flow computed by FF. \(S*\) is the set of nodes reachable from \(s\) in \(G_f*\), and \(T* = V - S*\)
    * We have  \(s \in S*\), and \(t \notin S*\), since we stopped FF when we had a graph where \(s\) is not reachable from \(t\). Therefore, \((S*, T*)\) is a cut.
      * We need to show that (A): \(\forall e \in out(S*)\cap in(T*), f*(e) = c(e)\), and  (B): \(\forall out(T*)\cap in(S*), f*(e) = 0\)
      * (A) can be shown by contradiction:
        * assume \(f(u, v) < c(u, v)\), where \(u in S*\), and \(v in T*\). Then \(G_f*\) contains a forward edge \((u, v)\), which would mean \(v\) is reachable from \(s\), and \(v \in S*\).
      * (B) is similar. Assume \(f*(u', v') > 0\). Then \(G_f*\) contains a backwards edge \((v',u')\), and \(u'\) reachable from \(s\). Hence \(u' \in S*\), which is a contradiction.
    * Now we have an algorithm for minimum cut as well! We just run FF to find a flow \(f\), and then in the residual graph \(G_f\), all the nodes reachable from \(s\) forms a cut \((S, T = V - S)\), that is a minimum cut.
   