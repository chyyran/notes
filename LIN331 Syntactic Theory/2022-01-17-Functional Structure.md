# 2022-01-17 Functional Structure

* What functional structure do we need to introduce argument of a predicate?
* external arguments and PISH (predicate internal subject hypothesis)
* Internal arguments and vP shells
* external arguments and vP shells
* unaccusative, unergative intransitive verbs
* internal vs external arguments
  * external arguments: introduced external to the projection of the verb
  * internal argum,ents: introduced internal to projection of the verb
  * **Franny** [VP read *many books*]
    * franny is the external argument
    * [many books] is the internal argument
* standard theory
  * internal arguments introduced within projection V but external argument is introduced outside
* g&b
  * both external and internal arguments are introduced inside the projection of V
    * for a language like english, this is an abstraction, because we know the subject does not surface in VP internal position
    * this is because Franny starts off in SpecVP but moves up to SpecIP for case-checking/epp
      * can easily be shown
        * Franny [VP never studied the chapter]
        * \*Never [VP Franny studied the chapter]
          * bad because we have reasons to say franny starts off, DP needs to move up to get case OR because of EPP
    * cann use position of adjunct for true left edge
    * not a trivial thing in many languages
## Predicate internal subject hypothesis
* All theta roles associated with head H are assigned within projections of H
* idiomatic interpretations
  * idiom chunks correspond to syntactic constituents, so idiomaticity can be used as a constituency test
  * find many idioms involving verb and object excluding subject but not ones involving subj and verb excluding object
  * accounted [VP. SU [V' V OB]]
    * can not just pick out the subject and the verb in terms of constituency
  * example
    1. The shit hit the fan
    2. The shit may/should/might/can hit the fan
    3. The shit hit/will hit/is hitting/has hit the fan
    4. The shit did not hit the fan
    5. The shit seemed to hit the fan 
 * all three elements `[the shit] [hit] [the fan]` must be present for the idiomatic interpretation
 * however we're able to preserve the idiomatic interpretation in (2-5)
   * this is unexpected if the structure of the subject and verb is taken as part of the idiom
   * in 6, we have a subordinating predicate 'seem'
 * these are problematic if subject is introduced in infl, but if subject is in SpecVP, that's fine
   * [IP [the shit_1] [I' may/should/might...] [VP t_1 [V' hit the fan ]]]
 * idioms can be larger than VP, and we can not change the material within those structures
   1. A rolling stone gathers no moss (expands beyodn VP)
      * #A rolling stone gathered/might gather/is gathering no moss
      * #A rolling stone seemed to gather no moss.
   2. Is the Pope catholic? (built up in CP!)
      * #Was the Pope catholic?
      * #Mary wonders whether the Pope is catholic.
* coordinate subject extraction
  * extraction out of a single conjunct is not permitted 
  * extraction from all conjuncts in so-called ATB movement is permissible
  * example
    * \*[CP what_i did [IP John eat t_i] and [IP Bill cook hamburgers]]
    * [CP what_i did [IP John eat t_i] and [IP Bill cook t_i ]]
  * same thing is extracted out of both conjuncts
  * now consider the following ATB-extraction
    1. The girls will [write a book] and [be awarded a prize for it]
    2. [IP [the girls]_i will [[VP write a book] and [VP be awarded t_i a prize for it] ]]
      * second [ VP ] is passive, DP that ends up in subject position originates as internal argument predicate
      * [the girls] is the recipient of the verb award, e.g. Franny awarded [the girls] a prize (as complement)
    3. [IP [the girls]_i will [VP t_i write a book] and [VP be awarded t_i a prize for it]]
       * If we introduce the external argument in Infl then there is no relation between the first and second VP 
* binding
  * consider the following evidence
    1. Which stories about [each other] did [they] say [the kids] liked?
    2. ...but listen to [each other], they say [the kids] won't 
  * in (1), [each other] is ambiguous with either the matrix or embedded subject as antecedent.
    * [[each other]] = they
    * [[each other]] = kids
  * in (2), [each other] allows only embedded subject as antecedent 
    * only allows [[each other]] = kids
  * [each other] is a reciprocal anaphor in English
    * disjoint antecedent (more than one individual)
    * [Franny and Teddy] saw [each other]
  * from PISH, base-generated VP structure is
    * 1: [VP [the kids] [V' liked [which stories about each other]]]
    * 2: [VP [the kids] [listen to each other]]
  * final structures
    * [CP [which stories about each other]_i [did [IP they say [CP t_i [IP [the kids]_k [VP t_k liked t_i]]]]]]
      * when you do WH extraction, you need to stop in every Spec,CP along the way
      * the matrix subject [ they ] is the closest binder of the anaphor when the WH-expression is in the intermediate position
      * in base position, its [the kids]
    * [CP [VP t_k listen to each other]_i [IP they say [CP t_i [IP [the kids]_k won't t_i]]]]
      * fronted from compement of won't to Spec,CP
      * notice that [the kids] is moved out from the VP into IP that is dominated closest by [the kids]_k
        * what is being fronted is the VP but [the kids] has already moved out of the VP.
  * binding domain: smallest clause that contains the anaphor
* floating quantifiers
  * Consider the following examples, all the second examples involve floating quantifiers
    * All the men have left the party
      * The men have all left the party
    * The women each seemed to eat a tomato
      * The women seemed to each eat a tomato
    * Both the girls may sing arias in the production
      * The girls may both sing arias in the production
  * Indicates the the DP has moved out of the quantifier phrase
    * [IP [the men]_i [I' have [VP [QP all t_i] left the party]]]
  * low position of QP consistent with it being base-generated in SpecVP
    * DP raises to subject, stranding Q head
## Internal arguments and ditransitive verbs
* What is the structure of a sentence like 'Franny gave a book to Hassan'?
  * One possibility:
    * [VP [DP Franny] [V' [V' [V gave] [DP a book]] [PP to Hassan]]]
    * Neither DP c-commands the other since the DP is hidden within the PP ([DP Hassan] is sister to [P to]).
    * If we make the PP somewhat transparent, we can say that [DP Hassan] asymmetrically c-commands [DP a book] but this is quite dubious to assume
      * indirect object c-commands direct object
  * However we have constructions that say that the first DP should c-command the second one.
    * I presented/showed Franny to herself
      * \*I presented/showed herself to Franny
    * I gave/sent [every check]_i to its_i owner.
      * ??I gave/sent his_i paycheck to [every worker]_i.
    * I sent no presents to any of the children.
      * \*I sent any of the packages to none of the children.
    * Which check did you sent to whom?
      * \*Whom did you send which check to?
        * higher [WH] clause is the one that can be fronted, so we can't use the above structure
  * if we flip the structure we match the pattern but we won't match word order.
    * i.e. [VP [a book] [V' gave [PP to Hassan]]] 
  * what if we assume that the DP is moved up, and then the c-command relation holds?
    * idioms provide evidence against this
    * complement PP and the verb form a constituent in base positions to the exclusion of the direct object
      * Felix [threw] Oscar [to the wolves]
      * issue here is that the direct object is not part of the idiom
      * indicates that PP should be complement to the verb
  * How do we resolve word order in a structure like
    * [IP [I' [VP Franny [V' [DP a book] [V' gave [PP to Hassan]]]]]
      * We need to move `gave` up to Infl but we don't have V-to-T movement in English.
* VP shells
  * Larson (1988) proposed that there is a VP shell
  * second layer that the verb moves up to.
  * [VP [DP Franny] [V' [V gave_i] [VP [DP a book] [V' [V t_i ] [PP to Hassan]]]]]
  * Chomsky built upon 1988 and proposed little-v (light/functional heads) which are phonetically null in English
  * little-v has a V-feature that triggers this movement.
  * little-v playing 2 roles
    * moving the verb
    * introducing the external argument in Spec,vP
  * there is evidence in some languages of phonetically realized little-v
* External arguments
  * should we extend VP-shell analysis to simple transitive construction?
  * yes!
    * [vP [TV violence [v' harms children]]]
    * [vP [TV violence [v' does [NP harm [to children]]]]]
  * consider the following pair
    * Hassan threw the ball to Franny
      * Hassan threw the ball
    * In both examples, Hassan has identical theta roles, and its desireable to say that theta-roles are assigned with the same structure
  * VP-shell structure provides plausible explanation for Burzio's generalization
    * A DP can surface in object position of a verb only if that verb theta-marks its subject
    * verb licenses its object by assigning it [ACC]
    * assumes that light verb *v* can be taken to play both roles of external t-role assignment and ACC case-checking.
      * Franny kicked the ball / The ball was kicked _
        * can't have overt object in passive because tehres no external argument 
        * in passive there's no little-v so we don't theta mark external argument, and dont give case