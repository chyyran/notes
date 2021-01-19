# 2020-11-16 CTL Examples

* Mutual Exclusion
  * We have 2 processes, `crit1`, and `crit2`.
  * We want to ensure the principle of mutual exclusion to a single resource
    * `crit1` and `crit2` can not hold the resource at the same time.
  * \(\forall \square(\neg (crit_1 \wedge crit_2))\)
    * On every path, always such that either crit_1 has it or crit_2 has it. 
* Every possible reachable state satisfies \(a\)
  * \(\forall \square a\)
    * All paths that start from \(s\) satisfy \(\square a\).
    * The entire tree is labeled \(a\)
* In every reachable state of the system, it is possible to return to a start state of the system
  * \(\forall \square(\exists \Diamond \text{start})\)
  * \(\forall \square\) is very useful to state invariants
  * \(\exists \Diamond\) is very useful to state possibilities, i.e. *reachability*
  * It is an invariant that the start state is always reachable.
* Each red light phase is preceded by a yellow light phase
  * \(\forall . \bigcirc \text{red} \implies \text{yellow}\)?
    * Does not syntax check
  * \(\forall \square . \not \exists \neg \text{yellow} \cup \text{red}\)
    * This is not restrictive enough?
  * \(\forall \square . \text{yellow} \vee \forall \bigcirc \neg \text{red}\)
    * This is the correct answer
    * Ignore the degenerate case \(\neg \text{red}\)
    * Either it is yellow, or the next value is not red.
    * Equivalent to \(\forall \square . \exists \bigcirc \text{red} \implies \text{yellow}\)
* Each process has access to the critical section infinitely often
  * \(\forall \square . \forall \Diamond \text{crit}\)
    * For every execution path, every branch from the path has access to the critical section eventually
    * Similar philosophy as inner clause being reachability, and outer clause being an invariant
    * No matter what choice of path you take, there is a point in the future you can regain the critical section
    * "Infinitely often" can be phrased as \(\forall \Diamond\)
      * No matter where I am, there is always a point in the future where I am satisfied
      * From the sat point, there is always a point in the future where I am also satisfied 
    * LTL version will be \(\square \Diamond \text{crit}\)
  * For multiple process we just take the conjunction
    * \(\forall \square . \forall \Diamond \text{crit}_1 \wedge \forall \square . \forall \Diamond \text{crit}_1 \wedge ...\)
    * \(\bigwedge_{i \in I} \forall \square . \Diamond \text{crit}_i\)
* If the lightbulb is yellow, then it is possible for it to turn either green or red in the future
  * \(\forall \square . \text{yellow} \implies (\exists \Diamond \text{green}) \vee (\exists \Diamond .  \text{red})\)
    * We want to use \(\bigcirc\) to create a buffer between the yellow and the two colours
    * This is correct if we have mutual exclusion
  * \(\forall \square . \text{yellow} \implies (\exists \bigcirc \exists \Diamond \text{green}) \vee (\exists \bigcirc \exists \Diamond \text{red})\)
    * This is the correct answer
  * \(\forall \square. \text{yellow} \implies . \exists \bigcirc \exists \Diamond . \text{green} \vee \text{red}\)
    * Eventually and next distributes over disjunctions, and because this is the case this is technically correct and equivalent.
    * When approaching the question we want to think like the above clause as well.