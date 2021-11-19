# 2021-11-18 Inflectional Class

* If we treat inflectional affixes as the head of a WST then important information from the nonhead fails to be transmitted to the whole.
  * Category, argument structure, etc.
* We could posit that the features of the non-head are duplicated in the inflectional morpheme
  * But we would have to accept a huge amount of redundancy!
  * Need a different morpheme for every possible argument structure configuration
  * We can use radical substitution linking so the whole feature structure of the non-head but this undermines the notion of headedness
* We could posit inflectional morphemes as modifiers
  * This fails to capture the important connection between inflectional morpheme and syntactic distribution
  * The assumption is that the syntax only sees the features of the highest node
* We adopt the hypothesis that **inflectional morphemes are assigned by the syntax**, to the entire word.
  * Inflectional features are not introduced by inflectional affixes themselves
  * Instead the feature is assigned to the highest node from the dominating node in phrasal structure
  * The value of the tense morpheme is derived by the feature!
  * Inflectional affixes introduce **unvalued features** that received value which is assigned syntactically
    * For example, [_pst] -> [+pst] (realized as -d, for example.)
  * The form of an affix is indeterminate until the feature is assigned
  * We need a way to map inflectional features (like +pst) to their forms.
## Vocabulary Insertion
* We say that inflectional affixes receive their forms (**exponents**) via **vocabulary insertion**
   * Takes as a input an abstract feature bundle on a terminal node in WST, and assigns it to a vocabulary item in the language's **vocabulary list**
     * `[Feature] -> OneOf [VocabularyItem]`
   * Vocabulary items map feature bundles to phonemic exponents.
     * In this class vocabulary items are mapped high to low priority.
* **Subset principle**
  * Matching does not require identity of feature bundle
  * The exponent is matched if the item matches all or a subset of features in the bundle
  * Where several vocabulary items match, the item with the most matching features is chosen.
  * Insertion does not take place if the vocabulary item contains features not present in the bundle
  * The list is disjunctively ordered
    * If one rule applies, no other rules applied
    * each of the rule is inspected in turn until one applies.
    * There is a default hypothesis that the list is ordered such that richer items are listed above less rich items
      * However there are situations where these two criteria are in conflict and the discussion is still ongoing
      * **Intrinsic/extrinsic ordering**
* Underspecification
  * Insertion contexts can be underspecified
  * This can result in the same form being a suitable match for multiple environments
  * Underspecification will cause the subset principle to play out differently and allows us to specify a single vocabulary item for multiple possible contexts
  * **Syncretism**
    * Where a single vocabulary item is an exponent for more than one feature combination
  * Syncretism allows one vocabulary item for multiple environments
  * This is different from homophony where two vocabulary items have the same form
  * Syncretism reflects **natural classes** determined by a feature common to all insertion contexts.
  * A totally underspecified form is ordered last and is known as the **elsewhere** form.
  * 