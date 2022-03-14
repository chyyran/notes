# 2022-03-14 Case and Checking Cont'd

* Case Filter
  * \*NP if NP has phonetic content and has no case
    * case positions are defined by feature checking
  * what was the initial motivation for introducing checking within Case system?
    * account for case information being legible (complete) at the interfaces
    * syntax all the way down to LF
    * case information has to be complete at PF because morphology depends on case
    * has to be complete at LF for binding restrictions, licensing
    * case feature enters derivation already present
      * no matter when Spell-Out occurs, case information is already available
      * assuming check happens, then that will license case features for visibility condition at LF
  * We can use the checking mechanism to account for contrasts like
    1. [she [AgrS+T [was seen t]]] 
       1. [she] enters with [NOM]
    2. [her [AgrS+T [was seen t]]]
       1. [her] enters with [ACC] but don't check
    3. \*[John expects [she [to [t win]]]]
       1. she enters with [NOM] and is unable to check
    4. [John expects [her [to [t win]]]
       1. her enters with [ACC]
  * Empirical advantage: looks like checking mechanism paves the way more consistent account of binding
  * also used to account for crosslinguistic variations on Wh-constructions without relying on X-bar parameters
    * word order differences accounted using feature strength with strong-features being 'indigestible' at PF
* interpretability
  * Why does checking exist at all?
  * if DPs come in the derivation with their case, why do they need to be checked?
    * minimalist answer is interpretability at LF and PF
      * feature-checking serves interface conditions if understood as a mechanism for ensuring interpretability of syntax at the interfaces
  * lexical items in syntax consists of
    * PhonF
      * interpretable at PF but not LF
    * SemF
      * intepretable at LF not PF
    * FF
      * are these interpretable?
  * can be interpretable `[F]` or uinterpretable `[uF]`
  * uninterpretable features are the things that make syntax happens
    * uninterpretable features can not reach the interfaces
    * **activity** assumption: `[uF]` are the active triggers for feature-checking and movement
    * **deactivation** assumption `[uF]` must be deactivated by feature checking 
      * interpretable `[F]` is not deactivated
        * if we have `[F]` on a head, it can persist through to the interfaces
      * deactivation of `[uF]` makes feature invisible at LF but we need this information at PF in the syntax-morphology interface
    * in target-goal pairs, target is `[uF]`
  * what features are interpretable?
    * a feature is interpretable if it contributes to semantic intepretation
    * deactivation of [uF] vs non-deactivation of [F] have observable consequences in syntactic patterns
    * some features clearly contribute to semantic interpretation so it makes sense to say it is
      * ex. [tense] on T contributes to interpretation and should be designated as interpretable
      * what about EPP? [D] does not contriubte to intepretation so we designate it [uD(*)]
    * deactivation assumption predicts distributional differences between [F] and [uF]
      * uninterpretable features are deactivated when checked and are not available after check
      * intepretable features are NOT deactivated and remain available after feature checking
      * EPP feature checking will deactivate [uD] but not [D]
        * the idea that we can check EPP multiple times is consistent with the idea that [D] on DPs is interpretable
      * By contrast since [uD] needs deactivation after checking, it is no longer available for subsequent checking with potential goals
        * once it has been checked it is no longer available for subsequent checking with potetial goals
          * There are three cats in the yard
          * \*There three cats are in the yard
    * Another case of this is agreement (ex. Portuguese)
      1. **o** gat**o** bonit**o**
         1. o: MASC.SG 
         2. gato: cat.MASC.SC
      2. **a** gat**a** bonit**a** 
         1. a. FEM.SG
      * agreement reflects feature checking for phi-features
      * seems clear that information conveyed by gender, number, person on **nominals** is necessary at LF for interpretation
        * truth conditions depend on these features!
      * does LF need to interpret these features multiple times?
        * [\(\phi\)] is interpretable at LF only at one place: the nominal that bears the relevant properties
        * elsewhere, agreement reflects feature checking with [u\(\phi\)], which is deactivated after checking
      * can interpretiable [\(\phi\)] be checked multiple times?
        * consider raising to subject
        * in English, we don't see morphological evidence as there is no agreement in non-finite clauses
        * in Portuguese, there are inflected morphology
          * **As** alun**as** parace**m** ter sido contrad**as**
            * the.FEM.PL student.FEM.PL seem.3.PL have been hired.FEM.PL
            * 'The (female) students seem to have been hired'
              * raised subject controlling agreement multiple times
* Case features
  * what kind of interpretations do case features receive at LF?
  * we have to assume that the target is [uF] so
    * AgrS has [uNOM]
    * AgrO has [uACC]
    * this predicts that only one DP can check Case with an Agr head
    * ex
      * Mary gave a book to John 
        * 'a book' checks ACC
      * \*Mary gave a book John
        * 'a book' and 'John' check ACC
  * What about case on a DP?
    * dominant idea is that it is also uninterpretable
    * if it was interpretable we would expect for it to check multiple times
      1. Franny seems to know Hassan
         [I Franny [I -s [v seem- [I t to [t know Hassan]]]]]
      2. \*Franny seems that know Hassan
         [I Franny [I -s [v seem- [C that [I t -s [t know Hassan]]]]]]
         * Franny can check EPP of both matrix and embedded T for both 1 and 2
         * phi-features can also be checked multiple times
         * only way to rule out 2 is case
           * in 2, seems like Franny is checking case twice
* Summary
  * [uF] is illegible at the interfaces, and feature-checking is the response to this
  * [uF] is deactivated by feature-checking
  * [F] is not deactivated by feature-checking
  * In target-goal pairs, target is always [uF]
  * The goal can be either [uF] or [F]
* Do we need the case filter?
  * something needs to force case on NPs
    * possibly at the enumeration
  * if we assume case on NPs, we can us general statement of interpretable features
    * \*X if X has [uF] at the interfaces