# 2019-10-07 Backtracking Search

* Variables
  * \(domain(v) \to [Value]\) Returns a list of values in the variables domain
  * \(domainSize(v) \to Int\) Returns the size of the domain
  * \(assign(v, a) \to Variable\) Assigns a value to the the variable. A variable is unassigned when its value is `None`.
  * \(isAssigned(v) \to Bool\) returns if a value has been assigned
  * \(name(v) \to Str\) The name of the variable
* Constraints
  * \(scope(c) \to [Variable]\) Returns a list of variables in the constraint scope
  * \(arity(c) \to Int\) Returns the size of the scope
  * \(numUnassigned(c) \to Bool\) Number of variables in the scope that are unassigned
  * \(check(c) \to Bool\) True if the values currently assigned in scope statisfy. If numUnassigned is greater than 0, this is always False
  * \(name(c) \to Str\) the name of the constraint

* General step
  * Assign value to a variable
  * check for every constraint with variable in scope if it violates any constraint
    * if any constraint is violate we unassign, otherwise go deep one layer
* We use heuristics to order the variables to minimize constraint checks
  * dynamic ordering can affect performance

## N-Queens Problem
* Want to place \(N\) Queens on any \(N\times N\) chess board so no Queen can attack any other Queen
  * How do we model the problem?
    * \(N\)-variables for \(N\) queens 
    * \(N^2\) values for \(N \times N\) position
    * This has \((N^2)^N\) states.
    * We can exploit some knowledge
  * Better model
    * \(N\) variables for \(N\) queen
    * Value of the \(i^{th}\) queen will go to the \(i^{th}\) row, and our variables are which column each queen goes to. The domain is much smaller in this representation.
    * **Constraints**
      * 2 queens can not put two queens in the same column: \(Q_i \neq Q_j \forall i \neq j\)
      * Diagonal constraints, 2 queens can not be on the same diagonal \(|Q_i - Q_j| \neq |i-j|\).
        * The difference in the values assigned to \(Q_i\) and \(Q_j\) can't be equal to the difference between \(i\) and \(j\).
  * **Constraint Propagation**
    * Want to "look ahead" to look for "obvious" failures to cull paths
      * Some failures we will not be able to detect
    * Propagation needs to be applied to a search at every step
  * **Forward Checking**
    * An extension of backtracking search
    * When a variable is instantiated we check all constrains that have only one uninstantiated variable.
      * For that variable, check all of its values
    * We need to keep track of the domains we have pruned and restore them
      * \(curDomain(v) \to [Value]\) The list of values that still exist for the current variables (currently unpruned)
      * \(curDomainSize(v) \to Int\) The size of current domain
      * \(pruneValue(v, a, R, Rv) \to Variable\) Prunes value \(a\) from variable \(v\), because of the variable \(R\) assigned the value \(Rv\).
      * \(restoreValues(v, a) \to Variable\) restores the values to the Variable's domain that were pruned because of the assignment to \(a\)
    * Forward-Checking gives us a minimum remaining values heuristic that have different domain sizes. We can branch on the variable that has the smallest remaining domain, and we can go deeper in the search, to end with a leaf node.