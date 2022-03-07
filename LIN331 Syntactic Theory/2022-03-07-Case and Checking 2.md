# 2022-03-07 Case and Checking 2

* Topics
  * Case review
  * Evidence for AgrO
  * Necessity of [NOM] in light of EPP
  * Revisit case filter
  * Revisit checking mechanisms

* Case filter
  * \*NP if NP has phonetic content and no Case
  * accounted for distribution of overt NPs
    * positions where overt NPs are possible - Case positions
    * positions where overt NPs are not possible - Caseless
* Nominative checked by [NOM] feature on AgrS+T
  * typical instance: case checking for subj of finite clause
* Accusative checked by [ACC] feature on AgrO of  active transitive vP
  * Case checking for object of transitive verb
* Accusative or dative checked feature on Agr of transitive P
* consequences of absence of case
  * When [NOM] is not available on AgrS+T
    * Subject of a non-finite clause can't be licensed in its clause
    * can be 'rescued' by checking Case with higher position
      * Rescue by Case from complementizer/P
        * Leo hopes [that Lina will visit]
        * \*Leo hopes [Lina to visit]
          * non-finite C
        * Leo hopes [for Lina to visit]
          * complementizer, or P head in for
          * case here is ACC (if we substitute with pronoun would be accusative)
            * Leo hopes for **her** to visit
      * Rescue by Case by complementizer/P
        * \*[Lina to visit] would be great
        * [for Lina to visit] would be great
      * Rescue by NOM on matrix Agr+T
        * It seems [that Leo likes pizza]
        * \*It seems [Leo to like pizza]
        * Leo seems [*t* to like pizza]
          * **raising to subject**
      * Rescue by [Acc] on matrix AgrO
        * Franny believed [that Leo/he liked pizza]
        * \*Franny believed [he to like pizza]
        * Franny believed [Leo/him to like pizza]
          * (*covert*) **raising to object**
          * relation between AgrO on [believed] and [Leo] to check ACC
        * proposals that ACC movement is actually overt, but verb moves past object to preserve linearity
          * to host V to the left of AgrO, we need to assume more functional structure (layers)
  * When [ACC] unavailable on AgrO
    * Passive and unaccusative lack AgrO, so there is no [ACC] case checking
      * internal argument can't remain in object position
      * must check higher case, and we observe raising to subject to license with NOM
    * Passive
      * Leo saw Lina
      * Lina was seen *t* (by Leo)
      * \*It was seen Lina (by Leo)
    * Unaccusative
      * The bus arrived *t*
      * \*It arrived the bus
  * Unavailability of NOM or ACC results in unavailability of corresponding subject or object position
    * observable with raising phenomenon
* Raising to object
  * is only possible with 'exceptional' matrix verbs like *believe*
    * ECM (Exceptional Case Marking) verbs
      * Franny believed Leo to be honest
      * \*Franny tried Leo to be honest
  * evidence from passive that the ACC case of he matrix ECM verb is what licenses the subject of the non-finite clause
    * If matrix ECM is passivized, AgrO is not available and the subject of the non-finite clause can no longer be licensed unless rescued by higher case
* AgrO
  * What is the evidence for AgrO
  * Consider the GB structure for [Franny entertains Kai]
    * [VP [DP Franny] [V' [V entertain (ACC)] [DP Kai]] [PP [P during] [DP his_i vacation]]]
    * We understand that [his] is bound by [Kai] but what is the c-command relation between the object and the PP adjunct
  * Minimalist framework
    * At the relevant part where we binding is computed, we do have c-command between Kai and the pronoun
      * Kai moves up to AgrO to check ACC (at LF)
    ```
          AgrO 
         / \
       AgrO  \      
          <v, v>
           /   \
          v     P
         /\    / \
        /  \ dur. his vacation
       /    \ 
     Franny  \
             /\
            /  \
           v    V
               / \
              /   Kai
             ent.   
    ``` 
* Binding implications of AgrO
  * should be some sort of generalized binding implications where we see the object is binding into an adjunct in that polistion
    * (14) Reciprocal 'each other' being bound by 'the kids'
      * The kids entertained Franny during **each other's** vacation
        * Reciprocal needs to be bound by a plural nominal
      * \*The kid's mother entertain Mary during each other's vacation
        * Reciprocal no longer bound by a plural antecedent so ungrammatical
    * (15) Only AgrO account predicts a representation at LF where *the kids* c-commands the reciprocal anaphor
      * Franny entertained *the kids* during *each other's* vacation
        * *the kids* moves to Spec,AgrO, so thus c-commands *each other's* at LF
* The same reasonings can be extended to ECM constructions
  * ECM and binding
    * The DA proved [the defendants to be guilty] during *each other_i's* trials
      * Reciprocal binding
      * 'proven' guilty, not guilty at each other's trials
    * \*Joan believes [[him_i] to be a genius\ even more fervently than Bob's mother does
      * At LF, *him* gets raised to AgrO, and c-commands R-expr Bob, resulting in Principle C violation
    * The DA proved [none of the defendants to be guilty] during any of the trials
      * Neg head c-commands NPI *any* at LF because it moves to SpecAgrO
* EPP vs strong [NOM]
  * So far we have left open the question of whether we need both EPP and NOM to account for subjects in Spec,Infl
  * We'll use expletive patterns in English to sort this out
  * What is the feature specification of English expletives?
  * *there* facts (17)
    * (a) [TP there_i seems [TP t_i to be [PP a man in the room]]]
    * (b) \*[TP there_i seems [TP t_i to be [PP many people in the room]]]
    * (c) [TP there_i seem [TP t_i to be [PP many people in the room]]]
    * (d) \*[There seem that [TP [many people]_i are [t_i in the room]]]
  * In 17(a), *there* checks EPP of both matrix and embedded T
    * generated in the embedded T to fulfill EPP for embedded TP, then moves up to fulfill EPP for matrix TP
      * assuming that there is no case feature in the embedded clause, then it cant be case features that motivate EPP in the embedded
      * what checks agreement (phi-features) on the matrix T in (17a)? (seems)
        * is it a feature of the expletive?
        * the associate is *a man* or *many people* and the expletive seems to 'sub' in for the subject
        * there are 2 plausible nominals determining agreement of *seems*
          * either *there* or *a man*
          * Looking at 17(b), 17(c), it seems that the subject of the PP is what is checking the phi-feature
          * there does not have *phi*, what is determining agreement is the associate
      * what checks case features?
          * there can't be a case-feature because if it did, 17(d) would be OK ([many people] gets checked by NOM and moves up to embedded subject position)
          * [many people] with +interpretable phi-features could still check T's -intepretable phi-features.
          * *it* in place of *there* would be fine in 17d, so what can say about features on *it*?
            * can satisfy case, EPP, phi
            * *there* only has [**D**] feature to check EPP
            * *it* is fully specified with [D], phi features, and Case.
          * it follows that Case and EPP must be disassociated
      * Nothing forces us to say NOM in English is strong. All movement we have seen so far can be explained via EPP. We can relent and say that Case in English is weak, and EPP is strong.