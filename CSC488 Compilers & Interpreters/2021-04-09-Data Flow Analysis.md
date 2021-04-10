# 2021-04-09 Data Flow Analysis

 * program analysis flow
 * subdivide program to BB or statements
 * try to compute some properties at certai point
 * analyze control structure of program to determine interrelationship of the blocks
 * represent cfg as directed graph
   * each node in graph is a BB or statement
   * each edge is a node-node transfer of control
 * each node is analyzed to determine some property of interest
   * eg. expr computations
 * can be pplied
   * intraprocedurally (focused on single routine)
   * interprocedurally (focused within a set of routines)
   * globally (entire program)
 * represented as a set (bitvec)
 * terms
   * Basic Block
   * Def'n point (point where some properties are established)
   * use point (point where property is used)
   * kill point (point where property is rendered invalid)
   * forward flow (what can happen **before** a point)
   * backwards flow (what can happen **after** a point)
   * **may** analysis
     * any path 
     * what property holds on **any** path leading to or from given BB
     * ex: uninit, live vars
   * **must** analysis
     * property holds on **all paths**
       * availability of expr
   * predecessors(b: BB)
     * set of BBs that are immediate predecessors of b in the CFG
   * successors(b:BB)
     * set of BBs that are immediate successors of b in the CFG
* generic data flow analysis
  * *In(b)*: props that hold on entry to BB
  * *Out(b)*: props that hold on exit from BB
  * *Gen(b)*: props generated in BB
  * *Killed(b)*: props invalidated in BB
  * precise rules for each set have to be specified for each problem
  * Gen and Killed are known, we want to figure out In and Out 
* types of problems
  * forward flow problems
    * data flows from first to lst block
    * *out* sets are computed from *in* set within BBs
    * *in* sets are coputer from *out* sets across BBs
* ex: available expression analysis
  * Expression E is available at point P in the program graph G is every path leading to P contains a definition of E that is not subsequently killed
  * can be use for optimization, and we can directly load result into a virtreg in all paths
    * used to implement common subexpr elimination
  * In: set of exprs E available on entry to BB
  * Kill: set of exprs E killed in BB
  * Gen: set of exprs defined in BB and not subsequently killed
  * Out: set of exprs available at exit from BB
  * In(Init) is emptyset
    * at the start there are no available exprs
  * expr is available at the end of B if it is defined in B and not subsequently killed in B, OR available on entry to B and not killed within B
    * \(Out(B) = Gen(B) \cup (In(B) - Kill(B))\)
  * expression is available on entry to basic block if it is available on all paths leading into the block
    * \(In(B) = \bigcap_{p \in Preds(B)} Out(p)\)
  * **if we change a variable**, the expr is killed
  * loops will have chicken and egg problems for cyclical dependencies
    * we can just keep running until we reach a fixpoint
* live variable analysis
  * for every def/use of var V, LVA answers if the value of V computed here and used further in the program
  * useful for optimizations
  * path in graph G is V-clear if it contains no assignments to V
  * a var V is live at point P in G if there is a V-clear path from P to a use of V
    * there is a path from P to somewhere that V is used and does not redefine V during the path
  * In(B): vars live on entrance to block B
  * Out(B): vars live on exit from B
  * def(B) = Kill(B) = vars redefined in B **before** var is used
  * use(B) = Gen(B) = vars whose values are used before being assigned to
  * Out(Final) =  emptyset
  * var V is live at entrance to B if it is used in B before definition in B, or live at exit to B and not defined within B
    * \(In(B) = Gen(B) \cup (Out(B) - Kill(B))\)
  * var  is live out of B if it is live going into any of B's successors
    * \(Out(B) = \bigcup_{S \in Succs(B)} In(S)\)
  * 