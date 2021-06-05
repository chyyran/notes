# 2021-06-03 WH-movement

* The way case is assigned is particular to the phrase
* no V-to-T movement in embedded clauses
## WH-islands
* WH-words have to move to Spec,CP of the embedded clause, before moving to Spec,CP of the matrix clause 
* WH-DPs will move the entire DP as WH
  * WH-head determines behaviour of the entire phrase
* WH-movement is not completely free
  1. \*Who did Sartre hate the statement that made?
     1. Sartre hated [DP the statement [CP that Camus made]]
     * If you add a relative clause to a DP it is a complex DP  
     * If we try to turn it into a WH item we want to move it up to Matrix Spec,CP, it's blocked
  2. \*What did you wonder who wrote
     1. 
  3. \*Who did Camus actually respect de Beauvoir and?
     1. 
  4. \*What did whether Sarte drank at *Les Deus Magots* is not disputed 
     1. 
* WH-island is a location in syntax that an element can't be moved out of
### Different types of islands
* Complex DP islands
  * Consider 'You agree with the claim that which bird is best'
    * [DP which bird] ends up moved to embedded Spec,TP and can't be moved to Spec,CP
  * Rule: `*wh [...[DP ...t ...] ...]`
* Filled Spec,CP islands
  * Consider 'Santosh asked who bought WHAT?'
    * [DP who] moves from Spec,vP to Spec,TP, and ends up in Spec,CP
    * the WH-item WHAT can't move to Spec,CP because it is already filled
  * Rule: `*wh_i [...[CP wh_k...[ ...t_i] ...] ...]`
  * These are bad because the second WH-item can't stop in Spec,CP
* Subject Islands
  * Consider 'That you're allergic to WHAT shouldn't surprise me?'
    * [That you're allergic to WHAT] is an entire subject and the WH-movement can not be moved out
    * If a CP serves as a the subject in matrix Spec,TP WH item can't be moved further out
    * Rule: `* wh ...[TP [CP...t...] T ...]`
* Coordinate Structure Island
  * Consider 'My uncles put cacao and WHAT in their coffee'
    * DP with coordination blocks movement of WH-item 
    * Rule: `*wh ...[XP [XP ...t...] conj [XP...] ]`
#### Echo questions
* Echo questions can still be constructud from these island sentences
  * Sartre hated the statement that WHO made?
  * Camus did actually respect de Beauvoir and WHO?
* Notice that the WH-item did not move from where they originated
### Wanna-contraction
* English speakers almost always want to contract want to -> wanna **except when there is an embedded WH-subject that moves**
  * In 2, colour becomes the subject!
    1. Which colour do you wanna paint the walls?
    2. *Which colour do you wanna appear on the border
  * good evidence that there is a trace in Spec,TP of embedded clause intervening between want and to
    * [Which colour] do you want [to appear on the border]
    * [Which colour] do you [want to paint the walls]
## Minimal Link Condition
* Move to the closest potential landing site first (Rizzi 1990)
  * This applies for all movement
* MLC can explain some restrictions on DP movement
  * Camus_i seems [t_i to enjoy espresso]
    * we have two possible gaps: [__ seems [that __ is likely [Camus to enjoy espresso]]]
    * [that] is -Q +FIN so it can attract CP
      * It seems [that Camus is likely to enjoy espresso]
    * *Camus_i seems [that t_i is likely [t_i to enjoy espresso]]
      * We can't just move straight to clause-initial because it's already getting nominative case from Spec,TP
  * Sartre_i is likely [t_i to be nauseous]
* When there are multiple case positions available, movement must move to the closest one first
## Domains, phrases, and bindings
* Movement proceeds cyclically through what?
* big things in syntax like CPs form domains
  * 'chunks' of syntax
  * think about these chunks in terms of 'phases'
* We don't generate a sentence immediately in our head atomically
  * we process subparts of sentences that are sent to phonology module one by one 
### Anaphora
* Consider the following sentences
  * *Bolor_i knew that herself_i was an award winning figure skater
    * 'herself' is c-commanded by Bolor
    * we need something more than c-command to describe why 'herself' is ungramamtical
    * 'herself' needs to be in the same domain as Bolor, but herself is embedded in the CP created by 'that'
  * Rabe_i suddenly remembered what Hasan_k whispered to himself_{*i/k} so many years ago
    * 'himself' is fine to refer to Hasan since Hasan is in the same domain and c-commands 'himself'
    * Rabe is in a higher CP so it can't **bind** 'himself'
* Terms like *myself, herself, yourself, each other, nous-memes, etc.* are anaphors
  * a term that gets its meaning from another sentence
  * an anaphor must be bound within its own binding domain
* Antecedent
  * a nominal that gives its meaning to another nominal
* R-expression
  * a nominal that gets its meaning by referrring to entities in the world (e.g. names)
* Pronoun
  * a nominal that *may* (but does not need to) get its meaning from another word
* Binding principles
  * A binds B iff A C-commands B and A & B are *co-indexed*
  * Binding principle A
    * An anaphor must be bound within its own binding domain
  * Binding Principle B
    * A pronoun must be free (not bound) in its binding domain
    * Can be bound by something outside of its binding domain
  * Binding Principle C
    * An R-expression must always be free
