# 2022-01-24 Functional Structure 2

* vp shell
  * introduced idea that verbs that have external arguments require additional structure
  * little-v lightverb
  * 
    ```
         VP
         /\
       EA /\
         v  VP
            /\
           DP/\
             v PP 
    ``` 
  * word order is resolved by movement of lower v to matrix VP 
* main concern
  * verb originates in vP but doesn't stay there
  * position depends on inflectional class
* overview
  1. Verb movement in English
  2. Verb second (V2) word order in Germanic
  3. Pollockian Revolution
  4. Parameterizing verb movement
* aux verbs
  * position depends on inflectional class
  * aux verbs can not follow polarity items (not, so, too) if inflected with tense/subj agrteement
    * ex
      1. Andre has not been eating
      2. Andre is not eating
      3. \*Andre not has been eating
      4. \*Andre not is eating
      5. Andre has too/so been eating
      6. Andre is too/so eating
      7. \*Andre too/so has been eating
      8. \*Andrew too/so is eating
   * if we try to invert the polarity items it doesn't work
     * you can create an acceptable interpretation but it is a cleft or a corrected
   * uninflected auxiliaries can follow PIs
     1. Andre must not have eaten.
     2. Andre must not be eating
     3. Andrew will too/so have eaten
     4. Andre will too/so be eting
  * uninflected auxiliaries must be adjacent to PIs
     1. \*Andre not must have eaten
     2. \*Andre not must be eating
     3. ?Andre must have not eaten (not clausal negation as Andre)
     4. ?Andre must be not eating
     5. \*Andre too/so will have eaten
     6. \*Andre too/so will be eating
     7. \*Andre will have too/so eaten
     8. \*Andre will be too/so eating
  * when uninflected verb is to th right it must be adjacent
    * modal can not be in between the PI and the aux verb  
      * examples 3 and 4 are grammatical but not in the exact sentence
      * consider tag sentence
        1. Andre has eaten, hasn't he?
           * reversal of the tag
           * Andre hasn't eaten, has he?
           * unflipped has rhetorical force, different pragmatics
        2. \*Andre must not have eaten
           * \*Andre must have not eaten, hasn't he?
  * VP deletion
    * exm
      1. Sam is eating pickles because Mike is _
      2. Sam should be eating pickles because Mike should _
      3. \*Sam is eating pickle sbecause Mike _
    * if VP deletion is capable of eliding any VP then 3 indicates that *be* is not within a VP or vP.
    * same with topicalization
* can be explained if finite aux has moved outside of VP
  * takes head of VP into Infl/T (v-to-t)
  * informal rule
    * Take verb head \(\alpha\) and merge to left of \(I^0\)
  * why move?
    * motivated because inflectional morphology generated in Infl, not part of the verb
    * process that is doing verb stem with inflection
    * stray affix filter
      * affix must coexist with its stem under common \(X^0\) to be pronounced
    * need to prevent verb movement to infl when there is already a word, i.e. modal
      * \*Franny be must reading that book.
    * Word criterion
      * Let \(\alpha\) be an \(X^0\) immediately dominated by XP. Everything \(\alpha\) dominates must form one word.
      * intuition is that if we were to move *be* into \(I^0\) when its already occupied, then I has 2 words
* sidebar
  * trees with aux verbs
  * we're going to assume auxs are little-v
  * aux morphology (-en, -ing)
    * ends up incorporating onto main verb
  * assume more vP shell layers for multiple aux shells
  * the little v already there is substituting for the main verb position
  * can we always move V into little V?
    * main verbs don't seem to undergo verb movement to infl on the surface
      * \*Andrew likes not/too/so apple
      * dummy aux *do* has to be generated
        * Andrew does not like apples
    * there needs to be a way for the stray affix filter to motivate insertion of affixes from infl downward to V
      * needs to be another process
        * Andrew likes apples
        * some way for the inflection to get onto like without like raising
      * lowering
* movement to C in English
  * verbs surface in head of CP
  * we see this in questions
    * Y/N: 
      * **Have** you eaten pickles?
        * cf. "You have eaten pickles"
      * **Should** you eat pickles?
    * Wh-questions
      * **Which** pickles have you eaten?
      * **What** should you eat
  * aux verb here moves up to Infl, then moves up to C (Infl-to-C)
    * what moves to C has to come from 
    * evidence movement is from \(I^0\): main verbs are excluded
      * dummy aux *do* must be used
    * we can't T-to-C for main verbs
      * \*Eat you pickles?
      * \*Which pickles eat you?
      * Do you eat pickles?
      * Which pickles do you eat?
    * complementarity with complementizers
      * if C-head is already occupied it can't move
      * Have you eaten?
      * \*I remember (that) have you eaten 
        * in embedded environments we can't get the fronted word order
      * Which pickles have you eaten?
      * I remember that which pickles have you eaten
  * informal rule
    * \(I^0\)-to-\(C^0\) movement
      * Remove an \(I^0\) \(\alpha\), merge \(\alpha\) to left of \(C^0\).
* Why prevents I-to-C movement in embedded contexts?
  * In Y/N questions in English, we need a special complementizer *whether*.
    * Word criterion blocks this movement, if the complementizer and modal/inflected in INfl can not form one word
  * In Wh-questions, reasoning is less clear
    * we can argue that there is no evidence for a C-head at all
    * that could be why you can't move into it..
    * will set aside for now.
* locality restructions
  * V that moves to I is always the closest one
  * extends to patterns in other languages
  * Head movement constriant (Travis 1984)
    * No \(X^0\) may move past a \(Y^0\) that c-commands it.
    * can't skip over a verb to move to Infl, same for movement to C
* Verb-second word order
  * In German, the position of the finite verb depends on whether it is an embedded clause.
    * In embedded clauses, the finite verb comes last.
    * example
      1. ...daS Hans das Buch kauft.
        * that John the book buys.
      2. ...daS Hans das Buch gekauft hat.
        * that John the book bought has.
      3. ...daS Hans das Buch gekauft haben muS
         * that John the book bought have must
    * How can we model this with X-bar paramters?
      * X' -> X YP? X' -> YP X
      * this is head final
      * quick fragment for 1.
        * [daS [IP [vP [DP Hans] [VP [V' [DP das Buch] [V kauft] ]] v] I0]]
  * In German root clauses, we find a different word order, inflected verb appears immediately after subj
    * Hans kauft das Buch
      * John buys the book
    * Hans hat das Buch gekauft
      * John has the book bought
    * something other than main/aux distinction is responsible
    * we already saw a difference, such as I-to-C in english restricted to root clauses
    * proposal: in German, finite verbs in root clauses move to C via Infl, in embedded clauses they do not.
      * V to I to C movement 
      * subject moves to Spec,C in german
        * if it stayed we would expect subject to be to the right of finite verb
    * ordering does not give us L-to-R, but give us structure
    * how do we know that the order is to C and not to I?
      * any topicalized phrase can immediately precede finite verb in root contexts
      * when another phrase comes before the verb, subject typically immediately follows finite verb
      * still need finite verb movement into Head,C to capture resulting order
      * ex. *dash Buch hat Hans gekauft*
    * why is it caled V2?
      * descriptive label where the verb has to be the 2nd thing in the parse
      * first thing doesn't matter but the verb has to the the second thing
* further evidence for V in C
  * some variation, V2 word-order found in embedded clauses only when there is no overt complementaizer\
    * allows embedded complementizers to drop in some environments
      * Franny said (that) Hassan read the book
    * cf. German
      * Er sagt, daS die Kinder diesen Film gesehen haben
        He says [that the kids this film seen have]
      * Er sagt, diesen Film haben die Kinder gesehen
        He says [this film have the kids seen]
    * second example has V2, only possible when there is no overt complementizer
      * C not available when there is an overt complementizer
* movement of XP to Spec,CP not permitted if the word in C is a complementizer rather than a moved V
  * won't explain this, mystery so far
* german vs english
  * similarities
    * V-to-I movement
    * Movemeent of subj to Spec,IP
    * I-to-C movement in root clauses
    * Head movement constraint is obeyed
  * diffs
    * V-to-I movement just for aux just in English but in german main verbs also move
    * something allows subjects/other XPs to move past C (assume topicalization)
    * I-to-C movement in root clauses is generalized in German (only interrogative in English)
    * Directionality of X-bar head (don't really care about that here)

## Pollockian Revolution
* Consequences for functional structure and ideas about how to handle movement patterns and syntax
* word order patterns
  * french finite vs non-finite verbs
  * adverbs vs negation
  * main vs aux verbs
* we need a new functional position in Inflectional domain
  * so far assumed only IP/TP but we need more
* finite verbs in french only appear before negation
  * Jean n'a pas lu livres (John hasn't read books)
  * \*Jean ne pas a lu livres
  * the *pas* is in Neg, *ne* is just a clitic and we can ignore it.
* French allows main verbs in this position when they are finite.
  * Jean n'aime pas Marie
    * John ne'love not Mary
  * \*Jean ne pas aime Marie
* Accounts for another difference: finite main verbs in French but not english can be separated by material like adverbs
  * Jean embrasse souvent Marie
    * \*John kisses often Marie
  * can't have the inflected verb separated from object by inflected material
* this can be explained by V-to-Infl movement.
* consider what happens in French non-finite clauses
* Non-finite V relaive to adverbs
  * **Comprendre**  *a peine* l'talien apres cinq ans d'etude
    * understand barely the-Italian after five years of study
    * this looks fine, we are separating the infinite verb with object via adverbial
  * Things look different for negation.
    * ne *pas* **sembler** heureux est une condition pour ecrire de romans
      * ne not seem happy is a condition for writing
      * "To not seem happy is a (pre)condition for writing novels"
    * \*ne **sembler** *pas*  heureux est une condition pour ecrire de romans
    * this is similar to english, but only for non-finite constructions!!
* pollock positied two positions for the verbs to occur in inflectional domain
  * 'Exploded infl'
  * IP -> TP AgrP
    * [TP [T] [NegP [Neg] [AgrP [Agr] [VP]]]]
  * verb movement: in principle you can move to Agr, and then T
* french aux verbs behave differently
  * May optionally appear in front of negation, special property of etre
  * Ne pas etre/N'etre pas all work.
* Generalizations
  * Finite verbs in French precede adverbs and negation
  * Nonfinite main verbs in French precede adverbs but not negation
  * Nonfinite etre in French precede adverbs and optionally precedes negation
* Questions
  * How do verbs distribute themselves over 2 head positions?
  * Why can main verbs not move to T in non-finite clauses?
  * Why are main verbs unable to occupy this position even in finite vlauses in English?
* Pollock's proposals
  * Differences in the positions verbs can occupy correlates with inflectional/morphological properties
    * Verbs in finite clauses bear tense inflection (T)
    * Verbs in non-finite clauses **do not** bear tense inflection
    * Tense morphology in English not as rich as tense morphology in French
    * Subject agreement in English not as rich as in French
    * Subject agreement in French non-fiunite clauses is throughouly absent, cf. in French finite clauses!
    * idea of rich vs poor inflection
      * Inflectional heads with rich morphology are **strong**, and non-rich are **weak**
      * Strong heads allow verbs to sit, but weak heads does not
    * French finite verbs are projected to a strong Agr and strong T
    * In non-finite, agr is strong but T is weak
* verb movement
  * not a paramerterized setting
  * same differences can be found within languages