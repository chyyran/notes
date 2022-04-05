# 2022-04-04 Linearization

* What does a syntactic tree structure represent?
  * Hierarchical dependencies? 
  * Linear dependencies
* Where does lienar order come from?
* Early syntax
  * early PSGs captured very specific, strict linear orders
  * in GB, abandoned for schematized XP/X'/X0
    * tension shows up in linear order from directionality parameter
  * where linear order comes from?
* traditional view
  * languages like japanese an english are structurally the same, with only difference being order of constituents
    * cf. Norbert [vp ate bagels] / 田中が [vp すしを食べた]
  * structure is the same, but captured in linearization parameter outside the tree 
* Minimalist question
  * Why do we have linear order at all?
  * plausible answer
    * linearization is an interface requirement imposed by the AP system (articulatory perceptual system)
    * linearization required in order for AP to be able to read the output from the computational component
    * phrase markers or trees are 2d but output of PF is 1d
    * linearization is a response to a legibility condition
* Kayne (1994)
  * theory of antisymmetry in syntax
    * basis of an algorithm for linearizing hierarchical structures
  * critique of GB story
    * traditional GB-approach based on directionality parameters
      1. Complementizer Rule
         1. X' -> X compl 
         2. X' -> Compl X
      2. Specifier rule
         1. XP -> Spec X'
         2. XP -> X' Spec
    * overgeneration
      * predicts structures not found in natural languages
      * spec rule predicts SpecCP to precede or follow C'
        * which means we should find languages with wh-movement to a right SpecCP
          * very few (if any) such cases
      * V2 patterns
        * standardly analyzed as moving finite V to C, and movement of XP to SpecCP
        * under spec rule, it is a suprise why we don't have anti V2 languages like
          * [[C' [TP ... tV tXP] [V + T + C0] XP]]
          * penultimate verb pattern
    * nothing to say about **correlations** between word orders and other syntactic phenomena
      * why xhould postposition, but not prepositions, show agreement?
        * [PP P DP] vs [PP DP P], but only DP P shows agreement
        * postposition + AGR is good
        * postposition - AGR is bad
        * preopsition + AGR is bad
        * preposition - AGR is good
    * constraints on extraction
      * in basque its possible for the subordinated verb to come on either side
        * [VP V [CP ...]] or [VP [CP ...] V] is all ok.
        * however extraction from [[CP ...] V] seems to strain acceptability
  * the idea that you can get agreement in one order or another or extract from one or not another means these structures are not the same
  * linear correspondence axiom (LCA)
    * A lexical item *a* precedes *b* iff *a* asymmetrically c-commands *b*.
    * linear order can be read off syntactic structure based on asymmetric c-command relations
    * linearization is also an asymmetric relation
    * configurations in symmetric c-command are **not** linearizable.
      * a > b, but c \*> b
        ```
        /\
         /\
        a /\
         c  b
        ```
    * appied to sentences like below accurately predicts the order
      1. Norbert will eat the big bagel
         [TP Norbert_i [T' will [VP t_i [V' eat [DP the [NP big [NP bagel]]]]]]]
         (ignore trace for now)
     * problem here is symmetric c-command between D and NP in BPS, this doesn't show up in GB because NP
   * how does the LCA handle complex subjects and symmetric c-command VPs?
     * ex. The man from Toledo will visit Mary
          [TP [DP the man from Toledo]_i [T' will [VP t_i [V' visit Mary]]]]
     * none of the elements in the complex subject enter into asymmetric c-command with any of the lexical items in the rest of the sentence
       * internally it's ok, but the entire DP is in symmetric c-command with the T'
     * VP and object are also in symmetric c-command
   * To fix problems, proposed refinement of LCA:
     1. A lexical item \(\alpha\) precedes \(\beta\) iff \(\alpha\) asymmetrically c-commands \(\beta\).
     2. An XP dominating \(\alpha\) asymmetrically c-commands \(\beta\)
   * This appears to fix examples like the DP problem
     * D has DP asymmetrically c-command T' (?)
       * shouldn't thinks be conflicting? because T' also asymmetrically c-commands into the left-branching subject
         * this is excluded by the **XP** dominating! 
 * Three possible solutions to the VP problem
  1. null elements
     * idea is that there is a null determiner in DPs. 
       * [V visit [D null Mary]]
       * this would show asymmetric c-command between visit and mary in English
       * ok.. but what about languages with an overt determiner like Portugese?
         * push this down a layer of projection
         * [DP a [XP X Maria]]  
           * there are proposals of functional structure for agreement of phi-features
           * crucially, the lowest projection has to be phonologically null in this claim
           * LCA ignores null heads
             * if we didn't assume this, we would just push the problem down a level
             * perhaps null heads are an 'optimal solution' to the linearization problem..?
  2. movement
     * movement can be used to break symmetry
     * in symmetric cases, one item always moves, leading to asymmetric c-command
     * ex
       * \*an atom split (symmetric)
       * an atom [split into three pieces]
       * a split_i [atom t_i]
     * consequence of this is that objects in English always move overtly
  3. morphological integration
     * given the LCA deals with heads and phrases, if a head gets morphologically integrated into another head, it will be invisible to the LCA and be indirectly ordered by the linearization of the complex item that contains it.
       * I like it
         * [TP I_i [T' T [VP t_i [V' like it]]]]
         * [TP I_i [T' T [VP t_i [V' #like it#]]]]
* LCA and word order
  * in hungarian, to get postposition order, the complement (D) moves out to a position where it will asymmetrically c-command the adposition
  * movement correlates with uPHI agreement
* extraction asymmetry in basque
  * Extraction from [V [V CP]] is ok, with no movement
  * in [[CP ...]_i ... [VP V t_i]]
    * CP has fronted means that there's some position above thats it has moved into Spec of 
    * extraction is not possible from island assumptions
      * Complex things in specifiers are islands (subject island)
* what about anti V2 structures?
  * Wh-word or verbs necessarily comes before any c-commanded X even when fronted to the right because it asymmetrically c-commands everything else
  * things like verbs coming first means it needs to move up high enough
  * if the verbs comes last, everything else has to move high enough
* LCA and copy theory of movement
  * we may not necessarily want to do things one after the other (like ordering PF after LF)
  * we itnroduced idea that the split between overt/covert movement is just how much material moves after F-check
  * T-model of syntax
    * LF and PF happen at the same time, while features all move befrore
* Brief examination of **Move**
  * Move as a primitive challenged
  * Move is a complex procedure
    * a syntatic element is re-**Merged** at target position and leaves behind a **trace**
    * notion of trace is problematic!
      * introduce something into the derivation that is not part of the numeration
  * solution: trace is just a **copy** of the displaced element
    * Move reimplemented as Merge + Copy
    * MoveF 
      * if it's a strong feature, we remerge the entire feature bundle (inc. SemF, PF)
      * if it's a weak feature trigger, remerge just the trigger
* PF linearization
  * if movement is just copy + merge why aren't both copies pronounced?
  * why must both copies be phonologically null?
  * perhaps LCA permits an answer
    * LCA assigns a lexical item one position in the PF-string
    * if both copies are realized, then we get contradictions like items both preceding and following another item
    * one item in the enumeration gets one position
    * every copy but one has to disappear!
      * which copies delete? 
      * higher copy typically gets pronounced because it has more checked features
        * 'more digestible' at the interfaces
        * it does not stipulate that it is the highest one (and therefore reintroduce traces)
        * interesting possibility: if the phonetic realization of the higher copy causes problems at PF, a lower copy can be realized
          * one such case involves wh-fronting in Romanian multiple Wh-movement
          * sometimes the highest copy of the Wh-word is not permissible at PF so the lower one is pronounced
            * 2 adjacent phonologically similar elements bad
            * OCP (obligatory contour principle)
        * morphological fusion
          * 