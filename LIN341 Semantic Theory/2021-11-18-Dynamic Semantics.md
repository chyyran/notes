# 2021-11-18 Dynamic Semantics
* File Change Semantics is similar to Discourse Representational Theory
* Presuppositions introduce truth-value gaps
  * If we know the presupposition is false it is hard to assign a truth value 
  * For example
    * The king of Moldolva is powerful (#?)
      * \>\> Moldolva has a King
    * Alex knows that it is raining
      * \>\> It is raining
  * A theory of presupposition should predict truth-value gaps
  * It should also take into account accomodation
    * ex. I'm sorry I'm late, my car broke down.
    * Also should take into account accomodation failure
      * I'm sorry I'm late, my unicorn died.
      * I'm having dinner in New York tonight too
  * Should explain projection/filter
    * Alex knows that Ryan cheated
      * presupposes that Ryan cheated
    * Ryan cheated and Alex knows he did
      * does not presuppose Ryan cheated (only entailment, since we assert the presupposition)
    * If Ryan cheated, Alex knows he did
      * does not presuppose that Ryan cheated
    * Either Ryan didn’t cheat, or Alex knows that he did
      * does not presuppose that Ryan cheated
* Common Ground/Context Change Potential
  * CG is the set of propositions that are mutually believed to be true by discourse participants
  * We assume propositions is a set of possible worlds
    * For example, in our world, Toronto is in Canada
    * There are possible worlds where Toronto is in the USA
  * This allows us to characterize entailment as a subset relation of propositions
    * \(p \models q \implies p \subseteq q\)
      * p entails q iff p is a subset of q
      * Every world in p is a world in q
    * Toronto and Ottawa are in Canada \(\models\) Toronto is in Canada
      * Every world where 'Toronto and Ottawa are in Canada' is true is a world where 'Toronto is in Canada' is true.
  * If we all believe that some set of prepositions are true, then the the common ground is the intersection of all such sets; the set of possible worlds where all the propositions are true.
    * Such a set is not a set of propositions but it itself is a proposition == a set of worlds
    * This is the **context set**.
    * The common ground defines a context set which is the intersection of all propositions in the common ground.
    * When we assert a proposition \(\phi\) such as 'It's going to rain tomorrow', we are assuming that
        1. The proposition \(\phi\) is not in the common ground (otherwise it would be redundant to assert)
        2. We propose to add \(\phi\) to the common ground.
           1. If the assertion succeeds, then it is added
           2. Otherwise, we move on.
        * We **refine the context set through presupposition assertion** 
    * A conversation is a game where participants try to gain a better picture of the actual world by continuously refining the context set, shrinking it to approach the actual world.
  * Presuppositions are constraints on the possibility to add a proposition to the CF. 
    * We can not add a a proposition that does not intersect with the current context set!
    * When one asserts a sentence that expresses proposition \(\phi\) that presupposes proposition P, \(\phi\) can be added to CG/context set only if CG/context set already includes P.
      * For \(\phi >>> P\) to be added to the context set, \(\forall w \in CS. w \in P \equiv CS \subseteq P\)
    * **Accomodation** is when we add P to the context set, then 
* Context Change Potentials
  * When we add a proposition \(\phi\) to the common ground, we are refining the context set.
  * hence define \(+, -\)
    * \(C + \phi = C \cap \phi\)
    * \(C - \phi = C / \phi\)
  * The meaning of a sentence is identified with its Context Change Potential
    * CCPs are instructions to do such refinement of the context set
      * \(C := C \cap \llbracket S\rrbracket\)
  * Presuppositions \(P_S\) of a sentence S are **satisfied** by the context iff \(\forall w \in C. w \in P_S \equiv C \subseteq P_S\)
  * A context C admits \(\varphi\) if and only if \(P_\varphi\) is **satisfied** by C.
* CCPs of some operators
  * \(C + A \text{ and } B = C + A + B\)
    * \(+\) is not reflexive and is left associative: \(C + A + B \neq C + B + A\)
      * [C + Ryan stopped smoking] 
        * A = Ryan used to smoke
        * B = But he stopped
      * This accounts for filtering in cases where we assert the presupposition
  * \(C + \text{If } A \text{ then } B = C - .(C + A) - (C + A + B)\)
    * Gives us update that matches material implication
    * Consider \(A \implies B \equiv F \text{ if } \neg B \text{ else } T\).
    * First the set we expand with is
      * \(C \cap A / ((C \cap A) \cap B)\)
      * Thus the situation where \(A \wedge \neg B\) corresponds to the set \((C + A)\) (worlds where A is true) complement \(C + A + B\) (worlds where A and B are true), is complement with the context 
        * This leaves us with the subset of C where we have not A, and A and B.
      * The update of adding B can be admitted even if C does not admit B as long as A admits B.
  * \(C + \text{not } S = C - (C + S)\)