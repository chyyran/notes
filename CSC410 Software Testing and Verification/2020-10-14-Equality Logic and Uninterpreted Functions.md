# 2020-10-14 Equality Logic and Uninterpreted Functions

* Next level up from propositional logic
* Equality logic
  * an equality logic formula defined by following grammar
    * Formula: Formula ^ Formula | ~Formula | (Formula) | Atom
    * Atom: Term = Term
    * Term: Ident | Const
  * We can finally talk about equality of integers and real constants
    * Equality logic has exactly the same expressive power as propositional logic
    * In a formula we can only have finite Atoms, so we can dedicate a propositional variable for each Atom to gain a reduction to propositional logic
    * SAT-reducible => NP-complete
  * More natural and convenient with equality logic 
* Equality logic + uninterpreted functions
  * Grammar: 
    * Formula: Formula ^ Formula | ~Formula | (Formula) | Atom
    * Atom: Term = Term | Predicate-Symbol (Term-List)
    * Term: Ident | Function-Symbol (Term-List)
  * Example:
    * \(F(x) = F(G(y)) \vee x + 1 = y\)
    * strictly speaking we can't add the '+1' but it's fine for now
  * We don't know what the meaning of \(F\) or \(G\) is, but we can guarantee their uniqueness.
    * Functional consistency: same function means same output on same input: \(\forall x. F(x) = G(x) \iff F = G, \forall x, y. x = y \iff F(x) = F(y)\)
  * SAT is reduced to that of equality logic
* Translation validation:
  * \(z = (x_1 + y_1) * (x_2 + y_2)\)
  * Compiler translates to \(u_1 = x_1 + y_1; u_2 = x_2 + y_2; z = u_1 * u_2\)
  * Can we prove this correct?
    * EUF formula: \(u_1 = x_1 + y_1 \wedge u_2 = x_2 + y_2 \wedge z = u_1 * u_2 \implies z = (x_1 + y_1) * (x_2 + y_2)\)
    * We can make \(+\) and \(*\) uninterpreted
      * \(u_1 = F(x_1, y_1) \wedge u_2 = F(x_2, y_2) \wedge z = G(u_1, u_2) \implies z = G(F(x_1, y_1), F(x_2, y_2))\)
    * If this formula is satisfiable, then the translation is valid.
    * Ackerman's reduction: assign each result of function to propositional variables
      * \(F(x_1, y_1)\) becomes \(f_1\), \(G(u_1, u_2)\) becomes \(g_1\), etc.
      * Now we get an equality logic formula that can be reduced to a SAT formula.
  