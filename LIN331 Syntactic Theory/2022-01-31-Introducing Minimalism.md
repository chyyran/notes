# 2022-01-31 Introducing Minimalism

* Instantiation of the theory of P&P
* Inherent tension between accounting for crosslinguistic uniformity
  * how are infants able to acquire language with such little data?
* Pivot away from rich syntactic modeling
* Government and Binding theory
  * incredibly rich and successful theory
  * pivot away from richness
  * goal is to supercede GB
  * SMT: strong minimalist thesis
    * UG reduces to the simplest computational principles which operate in accord with
      * interface conditions
      * conditions of computational efficiency
        * locality constraints
        * ways of deriving a string, no consensus
* Why SMT?
  * Plato's problem
    * the problem of finding an explanation for how a child acquires language
    * how can we know so much?
    * commitment to the best possible answer to this problem
    * richness of GB mechanisms started appearing unviable
  * occam's razor
    * the 'simplest' explanation is the best
  * darwin's problem
    * 'Why only us'
    * why do only humans have language
    * where did language come from? 
    * gradualist approach might lead one to think that there should be comparable systems in related species
    * want to find the most minimal version of UG possible
    * given the lack of natural language in a species, we could make sense of this if the thing that changed for humans was a small but crucial change
## GB architecture
* Y-model
* (Lexicon, [Phrase Structure Rule]) -> D-structure
  * Theta-criterion, projection principle goes through D-S
* Generalized transformation: Transf(Move a, Bind)
* DS -> Surface Structure -> Phonological Form
* SS -> covert transformation -> lexical form
* DS is the output of PSR
  * locus of recursivity (via PSRs)
  * serves as common input to computations that lead to PF/LF
    * ensures form-meaning compatibility
    * PF and LF both derived from same input
  * level where thematic relations are established
* SS: output of transformations on D structure
  * where many filters apply to get rid of unwanted derivations
    * case, binding, trace licensing (ECP), subajency
  * reference point for over/covert movements 
    * accounts for cross-linguistic variations
    * overt movement: movement from DS to SS
    * covert movement: movement from SS to LF (inobservable)
      * has to deal with scope ambiguity
* PL/LF
  * interface levels in GB with different operations
* Projection principles
  * lexical information must be preserved at all levels of derivation
* Transofmrational componets
  * Bind: free indexing of DPs
  * Move: free movement 
* Government
  * grammatical relation invoked by different modules

## Mimimalist architecture
* Aims for the elimination of architecture not motivated by SMT
* Lexicon is transformed by generalized transformations to produce LF
  * somewhere along this sequence, Spell-out is invoked to produce PF
* Only levels of representation are interfaces to external cognitive systems (darwins problem)
  * Sensorimotor: PF
  * Conceptual: LF
* DS and SS are not conceptually motivated so are eliminated.
* The output of syntax must be legible at PF and LF
  * whatever syntax is, it has to satisfy interface conditions optimally
* We got rid of PSRs!
  * effects are subsumed under \(\text{Merge}\).
  * structure building and recursion moved from base to generalized transformations.
* Merge
  * Takes two syntactic objects, and forms a single object
  * \(\text{Merge}(\alpha, \beta) = \{\gamma, \{\alpha, \beta\}\}\)
    * \(\gamma \in \{\alpha, \beta}\)
  * Merge combines lexical items (LI) selected from lexicon and deposited in a lexical array (numeration)
    * starting point for a derivation is not the entire lexicon but a subset
  * Merge is recursive
    * combines syntactic items that are ouput of previous iterations of merge
* Lexical items
  * three kinds of feature bundles
    * Phonological features
      * syntax not care but important at PF
    * Semantic features
      * syntax doesn't care but important at LF
    * Formal features
      * exclusively syntactic
* X-bar schema captured follwing key properties of PSR
  1. sentences are composed of phrases organized in a hierarchical fashion
  2. phrases are recursive
  3. phrases are binary branching
  4. phrases are endocentric with position 
    * in the immediate projection of the head (complement)
    * outside the immediate projection of the head (specifier)
  5. phrases are composed of heads (X^0), intermediate projecctions (X'), and maximal projections (XP)
  * Properties (1-3) are captured by the recursivity of Merge
    * binary nature is intrinsic because of 2-arity
  * To derive 4 and 5, we need to look at Bare Phrase Structure
* Bare Phrase Structure
  * minimalist approach to phrase structure 
  * key properties are reduced to properties of merge and **project** (label)
  * Merge gives us hierarchical strcuture, binary branching, recursivity
  * Project gives us **endocentricity**
  * Consider \(\{\gamma, \{\alpha, \beta\}\}\)
    * What type of object is \(\gamma\)?
      * \(\gamma = \alpha\)
      * \(\gamma = \beta\)
      * \(\gamma = \alpha \cup \beta\)
      * \(\gamma = \alpha \cap \beta\)
      * \(\gamma\) has no relation to neither \(\alpha\) nor \(\beta\).
    * Only the first 2 are compatible with classical empirical tests
      * for example if one of \(\alpha, \beta\) is a V then it must pattern with V.
      * We need a labelling mechanism.
    * **Projection**:
      * The output of \(\text{Merge}(\alpha, \beta)\) is labeled by \(\alpha\) if
        * \(\alpha\) selects \(\beta\) as its senmatic argument, or
        * \(\alpha\) agrees with \(\beta\)
          * \(\beta\) is attracted by \(\alpha\) for the purpose of Spec-head agreement (feature checking)
      * the thing that selects is the thing that labels
  * What does it mean to be labeled by \(\alpha\)?
    * Do we really need a distinction between terminal category nodes and lexical items?
      * What is the status of category labels?
      * What information does the category label N has which "Franny" or "Hassan" don't have?
        * LIs include all syntactic formal features
      * Do we lose anything if we get rid of category labelled trees?
    * category labeled trees are easier to read so we'll keep using that, but our understanding is that the categories aren't actually copied..
### X-bar schemas under BPS
* Complements and specifiers in BPS
  * the complement is the element that merges **first** with the head
  * the specifier is the element that merges **second**
  * bottom-up structure building
* The label of a complex object is not itself a complex object
  * the properties of a label are identical from an atomic item, because they're copied from an atomic item
* How do we conceptualize X-bar between X, X', and XP?
  * Is the difference due to having different intrinsic features?
    * Under this view, the difference is a primitive of the grammar
  * The differences may be **relational**, roughly same way as how a complement differs from a specifier
    * Minimal Projection: a lexical item selected from the numeration
    * Maximal Projection: a syntactic object that doesn't project (non-projecting label)
    * Intermediate Projection: Neither a maximal nor minimal projection
  * are predictions, empirical stakes
    * things do pattern as heads or as phrases! but this property is no longer primitive but abstracted as a relational property
* What happens if X-bar consisted of a single phrase
  * We needed vacuous levels on theory-internal grounds
  * We no longer needs these!
  * derives the claim that complements, adjuncts, and specifiers are maximal
    * by definition they no longer project further, so it counts as maximal
  * complies with the inclusiveness condition
    * requires that LF objects are built from features of lexical items
      * 0-levels, '-levels, P-levels aren't taken a priori!
* Adjuncts
  * How can we distinguish from specifiers?
  * Adjuncts have distinct properties
    * don't enter into argument relations
    * have different requirements from arguments
    * are interpreted as conjuncts semantically
      * i.e. red chair is exists x. Red(x) & Chair(x)
    * come in a wide variety of category types
  * if we just do more merge with them we can't distinguish them from specifiers
  * Consider [hit Frank hard]
    * {?, {{hit, {hit, Frank}}, hard}}
      * If 'hit' projects the same manner, then hard becomes interpreted as a spec.
      * to avoid this problem we assume **pair Merge**
      * this is labeled `<hit, hit>` to indicate that pair Merge has occurred, to indicate no projection has occurred.
      * Maximal projectio indicated by arrow
        ```
                <hit, hit>
                   /\
                  /  \
                 /   hard
            --> hit
                /\
               /  \
             hit  John
        ```
* BPS and little-v
  * little-v important for BPS because it allows for a shift to construe theta-role assignment as being entirely configurational
  * remember GB assunmptions of intransitive verbs (single-argument verbs)
    * unergative verbs: single argument behaves like an external
      * ex. cognate objects "John smiled a beautiful smile"
    * unaccusative verbs: single argument behaves like an internal
      * "John arrived \*an unexpected arrival"
  * traditionally accounted for in terms of position where the only argument is base-generated.
    * Unergative [_VP [DP [_V' V]]]
    * Unaccusative: [_VP V DP]
  * thse GB structures are problematic from a minimalist perspective
  * In BPS, there is no linearization in the order, so these traditional locations look the same
  * the solution is little-v
    * laugh (unergative) introduces an external argument = little-v
      * idea that unergative has an abstract object 
        ```
           v
          / \
         EA  v
            / \
           v   V
              / \
             V   X
        ```
      * without abstract object
        ```
            v
           / \
          EA  v
             / \
            v   V
        ```
    * arrive (unaccusative), we have no basis for introducing little-v
      ```
         V
        / \
       V  IA 
      ``` 
    * allows us to assign uniform configurations to pairs like
      
      a. John sighed
      b. John gave a sigh

      ```

               v
              / \
             EA  v
                / \
               v   V
                  / \
                 V<--X[sigh]   
      ```

      In (b), Merge from X to V is blocked with an overt light verb
      ```

               v
              / \
             EA  v
                / \
               v   V
                  / \
               gave sigh   
      ```
      * Evidence for this: languages which have overt light verb for transitive and unergatives but not unaccusatives, like Basque.

