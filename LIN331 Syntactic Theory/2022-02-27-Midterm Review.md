# 2022-02-27 Midterm Review

## Functional structure I: vP shells

* What is the original motivation for vP shells? What empirical problem do they resolve? How do they resolve it?
  * The original motivation for vP shells was to explain the structure of double-argument verbs by proposing that there is a second layer that the main verb moves up to to explain the correct linearization of double-argument constructions in English given PISH.
* How does little vP relate to the predicate-internal subject hypothesis (PISH)?
  * PISH says that the theta roles associated with a head are assigned within the projection of H. This would imply that the theta roles assigned by the main verb must originate within the projection of the main VP. Without little-vP, there would be no place for the main verb to move in double-argument constructions resulting in an incorrect linearization given PISH.
* What does little vP contribute to a theory of argument structure? Think about it how it impacts the representation of both internal arguments and external arguments across different verb classes (transitive, ditransitive, unaccusative, unergative)
  * Little-vP provides us a plausible explanation for Burzio's generalization if we assume that the light verb can play the role of external theta-role assignment and accusative case checking. This means that we can take theta-role assignment to be structural; by assuming a little-vP analysis for transitive constructions we can construct minimal pairs of single/double object constructions where DP theta-role assignment between each pair are identical because they occupy the same positions in structure.

## Functional structure II: Verb positions

* Why is it said that a verb's position is depends on its inflectional class? What is the evidence for this?
  * We have evidence for this in English with auxilliary verbs. **Inflected** auxilliary verbs in English can not follow polarity items, whereas uninflected auxilliaries have to be to the right and adjacent of the polarity item. Aux verbs have a different position depending on whether or not they are inflected. This is confirmed by processes that affect vP, which strand the verb if it is inflected for agreement or tense (by moving the finite auxiliary outside of the VP into Infl/T).
* Why might verbs move? How is the stray affix filter an answer to this question?
  * The stray affix filter says that the affix must coexist with a stem under a common head to be pronounced. Inflectional morphology is generated within Infl, and not part of the verb, so in order for this morphology to be pronounced, a verb is motivated to move up to 'combine' with the affix in Infl to pronounce the inflectional morphology.
* What kinds of restrictions do we observe on verb movement? How do the word criterion and the head movement constraint restrict verb movement?
  * The word criterion prevents movement to Infl when there is already a full word (not an affix) there. It prevents a head that immediately dominates an XP from hosting more or less than exactly one word.
  * The head movement constraints prevents verbs from moving across heads. This means that we can't "skip" over a verb to move to Infl and explains that the verb that moves to Infl is always the 'closest' one.
* How does verb position relate to hypotheses about functional structure in the clause?
  * The richness of verb positions in languages suggests that verb movement and its restrictions are not a simple parameterized setting as hypothesized in older frameworks. Verb movement is varied and dependent on a multitude of factors, and these differences can be found within languages, suggesting that it is not a single parameter that governs valid positions of verbs.
* What is the motivation for Pollock's decomposition of Infl into Tense and Agr projections?
  * Pollock studied verb movement in French, particularly differences in French auxilliarty verbs. He wanted to explain the differences in finite and non-finite verbs with regards to whether or not they can preceded adverbs or negation. Particularly, etre can also precede adverbs, and optionally can precede negation, which is not true for non-finite main verbs which can not precede negation. He explained this by positing the decomposition of Infl into Tense and Agr.
* What do we mean by strong vs weak positions?
  * A strong position allows a verb to sit in it, but a weak position does not. Inflectional heads with rich morphology are strong, and those without are weak. 
* How does Pollockian functional structure contribute to our understanding of the typology of verb positions?
  * Pollockian functional structure allows us to explain why certain verbs, or certain classes of verbs under a finite or non-finite environment, can move and sit between certain positions in the sentence. It explains for example in French, why finite verbs can precede adverbs and negation (as both Agr and T are both strong, it can move all the way up to Agr), whereas it is not the case for non-finite main verbs, that project a weak T, and thus the verb stays in Agr.
* How do main verbs and auxiliary verbs differ with respect to verb positions, and how can this be captured in a Pollockian approach to functional structure? Consider that the answer to this question can be different for different languages.
  * For example in English, we can say that finite aux verbs have both strong Agr and strong T, but main verbs have weak T and thus can not move to T in English.
* How do finite and non-finite clauses differ with respect to verb positions and how can this be captured in a Pollockian approach to functional structure? Consider that the answer to this question can be different for different languages.
  * For example in French, why finite verbs can precede adverbs and negation (as both Agr and T are both strong, it can move all the way up to Agr), whereas it is not the case for non-finite main verbs, that project a weak T, and thus the verb stays in Agr. This difference can be different in different languages, for example in some languages finite clauses could project weak T but strong Agr.
* What are V2 patterns and how do they relate to Pollockian functional structure?
  * V2 patterns are where the verb has to be the 2nd thing in the parse of a clause. 
  * Where the verb can be hosted in V2 could indicate the strength or weakness of a T or C head.

## Introducing minimalism

* What are the main architectural differences between GB architecture and minimalist architecture?
  * The main architectural differences between GB and Minimalism is to eliminate architecture not motivated by the Strong Minimalist Thesis. We get rid of D-structure and S-structure, and posit that the only levels of representation are the interfaces to external cognitive systems: PF and LF. Observable effects of PSRs are subsumed under Merge, and structure building and recursion is moved from being taken a priori to generalized transformations.
* What is Merge? What are its properties? What general properties of phrase structure can be derived from Merge?
  * Merge takes two syntactic objects and forms a single object. It is recursive, and the syntactic items in combines are the outputs of previous iterations of merge, starting from the subset of a lexicon. Merge captures recursivity, binary branching, and hierarchy by its definition (binary branching is captured by the 2-arity of Merge). Endocentricity, and phrase properties require a labelling algorithm called Project.
* What is Bare Phrase Structure? What are the main differences between Bare Phrase Structure and X-Bar rules?
  * Bare Phrase Structure is the minimalist approach to Phrase Structure. The main differences are that X-bar relations like X^0, X' and XP are no longer taken as intrinsics, but instead are defined relationally. Empty/vacuous structure is no longer taken as intrinsic and can be eliminated.
* Why is an operation like Project necessary in Bare Phrase Structure?
  * Project gives us endocentricity in BPS. It tells us that the output of Merge is labeled by the thing that selects it.
* How are maximal/minimal/intermediate projections understood in Bare Phrase Structure?
  * A maximal projection is a syntactic object that does not project. 
  * A minimal projection is a lexical item selected from the enumeration.
  * An intermediate projection is neither a maximal nor minimal projection
* How are complements and specifiers understood in Bare Phrase Structure?
  * The complement is the element that merges first with the head
  * The specifier is the element that merges second with the head
  * This assumes bottom-up structure building
* Why are adjuncts a problem in Bare Phrase Structure?
  * Adjuncts have empirically distinct properties from other phrases, such as not entering argument relations, and being interpreted semantically as conjuncts. However if we just do more Merge with them, they can not be distinguished from specifiers. To fix this, we have to assume that adjuncts are merged via **pair Merge** which labels nodes `<X, X>` to indicate that no projection has occurred.
* Why is little-v important in Bare Phrase Structure?
  * Little-v is important in BPS to allow theta-role assignment to be construed as entirely configurational.
  * In BPS, there is no linearization assumption, so the traditional account of unergative vs unaccusative verbs look the same. To fix this, the solution is to introduce a little-v layer in unergative structures where the external argument is base-generated, and in unaccusative structures, we have no basis to introduce little-v.
  
## Case theory
* What is feature-checking? 
  * Feature checking is a generalized transformation where the licensing of inflectional morphology can arise by matching and checking features on verbs with features on heads under the appropriate conditions. Verbs and heads come with feature bundles from the lexicon. Unchecked features are illegible at the interfaces, so a derivation is valid if and only if all features are checked.
* How does feature-checking relate to movement?
  * Feature-checking motivates movement. Checking with strong features correlates with Move, and checking with a weak feature correlates with a lack of overt movement for main verbs.
* How does feature-checking account for syntactic relations that seem to hold without movement, (e.g. licensing inflection)?
  * Syntactic relations that seem to hope without movement are said to be checked with a weak feature F. Movement is triggered, but not overtly and is deferred to after spell-out.
* What is the difference between checking strong vs weak features? 
  * Strong features trigger overt movement, and weak features trigger covert movement. Overt movement is apparently at PF, whereas covert movement is not observable and occurs after the PF interface.
* What is morphological case?
  * Morphological case is case that can be observed in PF as pronounced morphologically.
* What is abstract Case?
  * Abstract case is the structural component of case, regardless of whether it is morphologically expressed to account for the distribution of overt DPs.
* How does abstract Case determine/restrict the syntactic positions that DPs can appear in?
  * Overt DPs must be marked with abstract case. Positions where DPs are unable to be case marked result in ungrammatical cosntructions, thus DPs can only be hosted in positions that can receive case.
* How is Case theory implemented in a feature-checking model? In other words...
  * Case is correlated with features in a feature checking model. Abstract case is modelled as features that are checked by feature bundles of heads and verbs. For example, in Nominative case, T+AgrS have a combined feature bundle that can check with the subject position of a VP, motivating its move to specifier position of T+AgrS. For accusative case, V+AgrO checks features with SpecAgrOP, and the object moves to Spec,AgrOP as a reflex.
* What functional positions have Case features to check?
  * T+AgrS check the vP internal subject for NOM
  * v+AgrO checks features with SpecAgrOP for ACC
  * All case features are checked under a Spec-head relation
* What DP positions are licensed by Case checking? 
  * Subject and object DP positions are licensed by case checking
* What is AgrOP and what role does it play in Case checking?
  * AgrO allows a unified account for case with spec-head relations. It is motivated by languages that exhibit object agreement.
* How does feature-checking relate to parameterization (i.e. in Principles and Parameters theory)
  * Parameters can be characterized in terms of the feature bundles that a head or lexical item can carry, as well as the strength of those features. For example, in prepositional case, we have covert movement of PP-case due to a weak feature, leading to prepositions rather than postpositions. 
  * In Hungarian, prepositions are only possible with Ps that do not allow overt agreement. Post-positions have overt agreement with postpositions that indicate overt movement to AgrP. 
 
## Subject positions

* What is the EPP?
  * The EPP is a principle that says that every clause must have a syntactic subject.
* How is the EPP related to subject positions?
  * The EPP is characterized by strong D* feature on AgrS, so that the subject is always lifted out of VP, and moved into AgrSP to have the appearance that every clause has a DP in subject position
* Why do VS word orders raise questions about subject positions and the universality of the EPP?
  * VS word order seems to violate the subject is in the AgrSP position.
  * Do VS word order languages either lack EPP requirement, or have a weak EPP feature?
  * A&A say that EPP in VS order is strong but being satisfied in a different way.
* How is the EPP satisfied in languages with expletives?
  * In a language with expletives, EPP can be satisfied via Merge XP
  * Overt expletive DP must be introduced to merge with AgrSP
* How is the EPP satisfied in languages that lack expletives?
  * In a langauage without expletives, EPP is satisfied via Merge X^0
  * The verb moves to AgrS^0 to satisfy the EPP
* What is the basis for saying that a language lacks expletives?
  * A&A argue that languages lack expletives (and not have a null-expletive) on the basis of Definiteness Restriction effects.
  * In some languages, a strong universally quantified DP can not be a subject in VS order. Expletives have [D] features and thus require an NP complements. NSLs lack expletives, and therefore subjects in VS are not [D] complements and no DR arises.
* What are null subject languages and how do they relate to the above questions?
  * Null subject languages are languages that allow finite clauses to lack an overt subjects.
  * Null subject languages correlate with free inversion (VS word order)
  * NSLs have inflected verbs with [D] feature. EPP is satsfied via Merge X^0 of the verb in such languages.

### Harley reading (see week 2 materials for page ranges)

* Harley writes that the 'split-vP' syntactic architecture (i.e. vP shell hypothesis) has taken over most of the functions of theta theory in the old Government and Binding framework. What does she mean by this?
  * The vP-shell hypothesis explains the assignment of theta roles not via the theta criterion but rather the position in structure of the verb and its arguments within the phrase.
* The vP shell hypothesis account for the central facts of argument structure inso far as it creates dedicated syntactic positions for the core thematic roles. You should be able to discuss this.
  * For example, the vP shell hypothesis allows the argument in SpecVP to be assigned the theme theta-role. The agent theta-role is assigned in the external argument position of Spec,vP, and goal is assigned to DPs in prepositional adjuncts.
* Why is it said that the vP shell hypothesis 'severs' the external argument from the verb?
  * The vP shell hypothesis hosts the external argument in the specifier of little-v, external to the phrase projection of the main verb. 
* How is bare phrase structure problematic for the representation of unaccusative vs unergative intransitive verbs? What solution does the vP shell hypothesis offer to this problem?
  * Unergative verbs are intransitives with a single external argument, and unaccusatives are intransitives with a single internal argument, which takes on subject position by raising from VP-internal.
  * In GB, the external argument is base-generated in SpecVP, whereas the internal argument is base-generated in CompVP, sister to V0. The unaccusative/unergative distrinction could be syntactically represented.
  * In BPS however, we eliminate non-branching nodes, and thus unergatives and unaccusatives look the same. To fix this, the solution is to introduce a little-v layer in unergative structures where the external argument is base-generated, and in unaccusative structures, we have no basis to introduce little-v, so the internal argument is generated complement to the V head.
  
## Berwick and Chomsky reading (Chapter 1 up to and including p. 16)

* What problem does language pose for evolutionary explanation? What is 'Darwin's/Wallace's problem'?
  * Why do only humans have language? A gradualist/darwinian approach would predict that there would be comparable systems to UG in related species, but we don't see examples of this. To make sense of this, we have to posit that what changed for humans was a small, but crucial change.
* What is the Principles and Parameters framework and how does it relate to the question of language evolution?
  * The principles and parameters framework was an array of systematic constraints on UG. The constraints on movement was parameterized via finite switches to capture linguistic differences across language. The idea is that we can restrict the parameters to the smallest possible set of parameters that could have evolved.
* What are the three "basic, largely uncontroversial principles about human language" that Berwick and Chomsky suggest can be inferred from the past 60 years of research into generative grammar? What do these tell us about "the minimal properties any adequate syntactic theory must encompass..."?
  * The basic principles are
    1. "Human language syntax is hierarchical, and is blind to considerations of linear order, with linear ordering constraints reserved for externalization"
    2. "The particular hierarchical structures associated with sentences affects their interpretation"
    3. "There is no upper bound on the depth of relevant hierarchical structure"
  * The implications, given all three properties are true, are
    * (1) implies that any adequate linguistic theory must have some way to construct arrays of hierachically structured expressions
    * (2) implies that structure (in part) fixes interpretation at the level of meaning
    * (3) implies that such expressions are potentially infinite.   
* What is the significance of the example sentences birds that fly instinctively swim and instinctively birds that fly swim? How does this relate to the three "basic, largely uncontroversial principles about human language" (see the immediately above bullet)
  * While the first sentence is ambiguous (*instinctively* can modify both *fly* or *swim*), the second sentence forces the interpretation of *instinctively* modifying *swim*, even though *instinctively* is closer to *fly* than *swim*. This is because structurally, *instinctively* is closer to *swim* than to *fly*: *Swim* is embedded one level deep from *instinctively* and *fly* is one level deeper than that; this shows that structure, not linear order is what matters in syntax.
* What is the "divide and conquer" strategy described by Berwick and Chomsky and how does it carve the evolutionary problem of language into three parts?
  * The three basic parts are
    1. An internal computational system that builds hierarchical, structured expressions with valid interpretations at the interfaces
    2. A sensorimotor system for externalization (speech, PF)
    3. A conceptual system for inference and interpretation (thought, LF) 

## Alexiadou and Anagnostopoulou reading 
* What is the Spec,AgrSP parameter in A&A 1998 and how does it relate to EPP patterns
  * The SpecAgrSP paramater has to do with whether or not the language projects a Spec AgrSP position or not. 
  * Languages that project AgrSP have EPP satisfied by MergeXP, and languages that do not project AgrSP have EPP satisfied by MergeX^0. This reduces the AgrSP parameter to the NSL parameter.
* What is the Spec,TP parameter in A&A 1998 and how does it relate to subject positions and EPP patterns?
  * The SpecTP parameter has to do with whether or not the language projects a SpecTP position and is independent of the SpecAgrSP parameter. 
  * If a language projects SpecTP, then the subject in VS order can be VP external. It allows the subject to be hoisted out of VP into SpecTP. If the language does not project SpecTP, the only position available is VP internal.
* How do A&A 1998's proposals relate to parameterization (i.e Principles and Parameters theory)?
  * A&A 1998's proposals show that word order is not a simple parameter but is instead split into SpecTP and SpecAgrP parameters.
  * SpecAgrP parameters control whether EPP is satisfied via MergeXP or MergeX0, and reduces to the Null-Subject Language parameter
  * SpecTP controls whether the subject in VS order can be VP external.

 