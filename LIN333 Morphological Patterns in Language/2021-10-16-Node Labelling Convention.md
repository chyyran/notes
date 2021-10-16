# 2021-10-16 Node Labelling Convention

* We will need two kinds of concatentation to allow expressing argument structure in enriched WSTs
* Two processes for determining properties of derived words
  * Node labeling
  * Feature percolation
* Two kinds of concatentation
  * Head-complement structures
  * Modifier structures
* So far we have only stipulated the category of the ndoe projected by concatenation
  For example
  ```
       V 
      / \
    Aff  V
    |    |
   un-  lock
  ```
* We never theoretically justified this percolation of category
* New WST rules
  * The **terminal node** in the WST is the lexical entry for a morpheme
  * Include category features, and extend to other relevant features
  * Make explicit which terminal node is responsible for the new node created
* **Node labelling convention**
  * Concatenation is headed
  * **The features of a node are provided by the lexical category it immediately dominates**
  * The node being labelled is the target node
  * example
    ````
            N (0)
           / \
      (1) V   \
         / \   \
        /(2)N   \
       en   |   ment [N,->0] 
    [V,->1] joy [N,->2,Root] 
    ````
  * Notice the intermediate labeled node
    * A root automatically projects a target node that is labelled before affixation
    * We need asymmetry to express headedness
* **Feature percolation**
  * Not always the case that affixation triggers NLC
  * Category-preserving affixes are **modifiers** and have no category features.
  * Similar to adjunction in syntax, where adjunction is invisible to the projection of phrase-level category labels
  * Example
    * non-invasive (A), non-smoker (N)
  * In WST, **modifying affixes** like *non-* lack the appropriate features to trigger NLC
    * features of the immediate lower node **percolate** up, giving us the **Backup Percolation Convention** (PC)
    * If the lexical category immediately dominated by the target node has no relevant features to the NLC, then the target node may acquire features of an immediately lower node.
  * example
    ````
            N (0)
           / \
          /   \
         /     \
     non [null] \
                 \
                 N (1) [->0 PC]
                 |
                fiction [N,->1 NLC]
    ````
* These two kinds of feature labelling correspond to two kinds of concatenation structures
  * **Modification structures**
    * The affix is a modifier
    * No features to contribute
    * Features of the stem percolate via **PC**
  * **Head-complement structures**
    * The affix is a head
    * Contributes features to the whole constituent via **NLC**
    * Rule of thumb: Anything that changes a feature (category, gender) is a head-complement structure
* **Head-rule**
  * With compounds we can not invoke NLC or PC because compounds have symmetrical structure
  * We thus invoke the **head rule** of the language. 
  * The features of the (L/R)-hand member of a compound determine the features of the whole
  * In English, the head rule is parameterized right.