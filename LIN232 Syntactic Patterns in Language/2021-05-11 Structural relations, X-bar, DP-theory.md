# 2021-05-11 Structural relations, X-bar, DP-theory

## How do we talk about structure?
* Parts of a tree
  * **node** is any point on a tree
  * **branch** is a line connecting two nodes
  * **label** is the name of the node
  * **domination**
    * node A dominates B iff A is higher up in the tree than B, and you can trace a branch from A to B going only downwards
  * **mother**
    * if node A **immediately dominates** B, it is the mother or parent node
  * **daughter**
    * if node B is **immediately dominated** by node A, it is a daugter or child
  * **sisters**
    * two nodes that share the same mother (sibling nodes)
  * **terminal node**
    * a node that dominates nothing
  * **maximal projection**
    * the top node of a phrase that dominates all contents of the phrase, its label is derived from the head.
## full vs reduced relative clause
* reduced relative clauses do not have a complementizer
  * ex: Tuyaa saw her reflection in the mirror (that) [she bought]
  * this is still in a CP with a null C
## Structural relations
* Consider the pair
  1. Tuyaa saw herself in her mirror
  2. *The mirror from Tuyaa reflected herself
* Antecedent
  * "come before"
  * the NP that gives its meaning to another NP
* Anaphor
  * "a carrying back"
  * An NP that obligatorily gets its reference from another NP.
* **C-command**
  * Node A C-commands node B if every node that dominates A also dominates B and neither A nor B dominate the other
  * Informally: A node C-commands its siblings and their children nodes recursively. it does not c-command its own children
  * Example:
    * ```
         XP
        /  \
       YP  /\
       |  X  ZP
       Y     /\
            Z  AP
                |
                A
      ```
    * Y C-commands nothing
    * YP C-commands X, ZP, Z, AP, A
    * X C-commandsZO, Z, AP, A
    * ZP C-commands X, Z, AP, A
      * ZP C-commands X (mutual/symmetric C-command)
    * Z C-commands AP, A
      * Z asymetrically C-commands A
    * AP C-commands AP
    * A C-commands nothing
* Notice that in 1. the antecedent is Tuyaa and the anaphor is 'herself' (some node labels elided)
  * in 1., [.NP [.N Tuyaa]] c-commands [.VP saw [.NP [.N herself]] in her mirror]
  * in 2., [.NP [.N Tuyaa]] does not c-command [.VP reflected [.NP [.N herself]]]
    * [.NP [.N herself]]] is not c-commanded by [.NP [.N Tuyaa]]]
* rule of thumb: Anaphors must be c-commanded by their antecedents
* relevant here is the maximal projection of the antecedent that is c-commanding the anaphora

## X-bar theory
* anaphora/antecedent theory started movement called "government and binding" (binding theory)
  * G-B era
* what's going on in a sentence like Li Bai drank wine, and Du Fu, tea
  * the verb in the second VP is being elided
  * Li Bai [.VP drank wine], and Du Fu [.VP (drank) tea]
* parts of the VP can 'survive' elipsis
  * Li Bai will drunkenly recite a poem, and Du Fu will __ (recite a poem) sadly
  * not everything survives ellipsis
    * *Li Bai drinks wine all day, but Du Fu does so wine in the evening
  * It looks like there is a difference between upper and lower parts of the phrase
  * ```
         VP
        /  \
       AP   \
       |    / \
       A   /   \
          /\   PP
         V NP  |
           |  P
           N
  
          
    ```
* The complement of a phrase XP is a sister of X (X is a head)
  * immediately dominated by a bar level and is the sister of the head
* An adjunct of a phrase X' is sister and daughter of X'
* A specifier is the daughter of an XP (and sister to X')
  * immediately dominated by the maximal projection
* A bar level can be immediately dominated by either the maximal projection or another bar level
  * **only bar levels can recurse**!
* head is immediately dominated by a bar level
* 
  ```
                       XP
                      /  \
                     /    \
                    /      \
              specifier    X'
                          / \
                         /   \
                        /     \
                       /       \
                    adjunct     X'
                               / \
                              /   \
                             /     \
                            X'   adjunct
                           / \
                          /   \
                         /     \
                      head     complement
  ```

* assume that transitive verbs take one complement
  * this means that here can only be one complement and one specifier per phrase
* anatomy of a TP
  * [.TP [.NP subject] [.T' [.T will] [.VP ]]]
  * see that the NP (subject) is the specifier of the TP
  * the head is the tense head (modals, auxillaries, nulls)
  * the complement is the VP
* you can have as many bar levels as needed to maintai binary branching
* Can we revise our coordination rule XP -> XP conj XP?
  * ex [The ancient [[drunken poets] and [scholars]]]
    * what do we do with ancient?
    * [.NP [.D the ] [.N' [.AP [.A' [.A ancient]]]  [.N' [.AP [.A' [.A drunken]]] [.N poets]]] [.conj and] [.N' [.N poets]]]
* Thus we can say 
  * \(\alpha \to \alpha \text{conj} \alpha\) where \(\alpha\) is any X, X' or XP.
* every phrase needs at least one bar level because the bar level needs to dominate the head
* the specifier of a phrase needs to be the sister of a bar level
