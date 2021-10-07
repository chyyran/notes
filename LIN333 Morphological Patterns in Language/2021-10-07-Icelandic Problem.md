# 2021-10-07 Icelandic Problem

Consider the dataset in `IcelandProblem.pdf`

* We want to see which of the three phonological rules are across the board (ATB) or morphologically sensitive (MS)
* Are the affixes cyclic or non-cyclic?

* We can work one data bundle at time, and formulate hypothesis within the limited dataset.
  * *hamar/hamarinn/hamri* (hammer, the hammer, hammer [DAT])
    * In both *hamar* and *hamarinn* the base is *hamar*
    * The alternation *hamar/hamri* suggests a rule is being applied
      * Does the rule insert the *a* or delete the *a*?
        * Since our grammar does not have an insertion rule we can assume *syncope* 
      * Syncope suggests that the UR is *hamar*
        * *hamar* -> *hamari* -> *hamri*
      * Then *-i* is a cyclic suffix
  * *akur/akurinn/akri/ökrum* (acre, the acre, acre [DAT], acre [DAT.PL])
    * We have two alternations (*akur*, *akri*, and *ökrum*)
    * We know from *hamar* that *-inn* is non-cyclic
    * *ökrum* is clearly derived from umlaut in it's environment
      * This suggests that the underlying vowel is *a*
    * The second alternation *akri* is more difficult
      * Our rule inventory suggests that *akur* arises out of epenthesis, or *akri* arises from syncope
      * If *akur* is from epenthesis, then the UR could be *akr*, and then epenthesis is an ATB rule since *akur* is monomorphemic.
      * If *akri* arises from Syncope, then the UR is *akur + i* then syncope deletes the *u*.
    * We need to account for the umlaut rule (if UR is *akur*)
      * If umlaut is ATB then we would expect it for both *akur* and *akurinn* but it does not, which suggests it is MS
        * If it is MS, then it does not apply in *akur*, and *akurinn* is non-cyclic so it does not apply
    * If UR is *akr* how do we explain umlaut
      * Then umlaut would come before epenthesis, and umlaut is MS so it does not apply to monomorphemic *akur*
      * This fails to derive *akurinn* because *-inn* is non-cyclic, and then epenthesis which only applies word-final, and this would predict *\*akrinn*
    * This suggests umlaut is MS, and the UR is *akur*
      * umlaut being MS suggests *-um* is a cyclic affix.
  * *dagur/dagurinn/dagi/dögum* (day [NOM], the day [NOM], day [DAT], day [DAT.PL])
    * Alternations *dagur/dagi/dögum*
    * There is only one way to derive *dögum*
      * *dag + -um* (umlaut), *dögum*
    * Similarly, *dagi* is derived as *dag + -i* (no rules apply because there is no environment)
    * What is the UR for nominative? Is it *-ur* or *-r*?
      * Notice that *u* does not trigger umlaut, and it should if it is 
        * MS
        * has UR *-ur*
      * If the nominative has UR *-ur*, then it **must be non-cyclic** since umlaut would have otherwise applied
        * If it was cyclic then it would predict *\*dögur/\*dögurinn*
      * If [NOM] has just *-r* in underlying representation, then it **must be cyclic**
        * If [NOM] is non-cyclic but has UR *-r*, then it's getting epenthesis, which then must be ATB
        * ATB epenthesis incorrectly predicts that we **do not get epenthesis** in *dagurinn* (predicting *\*dagrinn* instead).
        * Thus cyclic [NOM] *-r* necessarily forces cyclic epenthesis
  * *lakni/laknir* (doctor, doctor [NOM])
    * This resolves our solution of the UR of [NOM]
    * Since we don't see *u* in the nominative affix, then it must be cyclic *-r*.
      * If non-cyclic *-ur* was the correct form we need a rule that would delete the *u*.
    * This also forces epenthesis to a MS rule
  * *jak/jökul/jökli* (ice, glacier, glacier [DAT])
    * Fairly straightforward here, the suffix *-ul* must be cyclic to trigger umlaut.
    * *-i* triggers syncope, deleting the *u*. Umlaut becomes apparent overapplication but the environment was present in the earlier environment
    * UR is *jak*
  * *ragin/ragna* (gods, gods [GEN.PL])
    * *-a* is cyclic to trigger syncope, deleting the *i*.
    * UR is *ragin*

1. List all the affixes, what the UR is, and cyclic/non-cyclic, and meaning
  * *-i* cyclic [DAT]
  * *-inn* non-cyclic [the]
  * *-um* cyclic [DAT.PL]
  * *-r* cyclic [NOM]
  * *-ul* cyclic
  * *-a* [GEN.PL]

2. Determine whether rules are ATB or MS
   * Syncope is MS
   * Umlaut is MS
   * Epetnthesis is MS