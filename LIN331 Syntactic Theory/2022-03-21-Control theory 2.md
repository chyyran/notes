# 2022-03-21 Control theory 2

* raising: understood but missing subject associated with both matrix subject and subordinate
* control: understood but missing subject has semantic integration in both positions
* semantic integration: being in a position to get theta-roles
* multiple tests differientiating raising and ontrol
  * selectional requirements
  * expletive possibility
  * idiom chunks
  * scope reconstruction
  * equivalence under passive
* There are more types of control
  * SUBJ vs OBJ control
  * Obligatory vs non-obligatory control
  * Adjunct clauses
* Control and syntactic theory
  * GB approach
  * Minimalist approach (Chomsky, Lasnik 1993)
  * Movement theory of control (Hornstein 1989)
* Subject vs object control
  * so far we have seen PRO being controlled by the subject of the matrix clause (subject control)
  * it is possible for the matrix object to control
    * Franny persuaded Hassan_i [PRO_i to sing opera]
  * Subject control looks very similar to raising to subject
  * object control superficially looks very similar to ECM
    * can be shown to be different with tests
      1. Selectional requirements
         1. Franny expects [the streets to come alive at night] ECM
         2. \*Franny persuaded the streets [PRO to come alive at night] control 
      2. Expletives
         1. Franny proved it [that Hassan had visited] (ECM)
         2. Franny expects [it to be snowing there] (ECM)
         3. \*Franny persuaded it [that Hassan should visit] (control)
         4. \*Franny convinced it [PRO to be snowing there]
            * persuade assigns a theta-role to its object! We can't assign a theta role to an expletive that already has an existing theta role.
            * Explitives are only admissible in a non-thematic position where no theta role is assigned.
      3. Idiom checks
        1. F. expects [the cat to be out of the bag by now] (ECM)
        2. #F. persuaded the cat [PRO to be out of the bag] (control)  
           * This only has the literal interpretation
      4. Scope reconstruction
         1. Poirot proved [two suspects to have killed the duchess] (ECM)
            * ambiguity for interpretation of "two suspects"
            * two suspects > proved: 2 specific suspects known to have killed the duchess
            * proved > two suspects: conclusively determined that the killing was done by 2 (unknown) people  
         2. Poirot asked two scoundrels [PRO to kill the duchess] (control)
            * only one interpretation here: Poirot asked 2 specific people to kill the duchess
       5. Equivalence under passive
          1. I expected [a specialist to examine Franny] (ECM)
             1. I expected [Franny to be examined by a specialist] (same truth condition)
          2. I persuaded a specialist [PRO to examine F] (control)
             1. I persuaded F. [PRO to be examined by a specialist] (different truth condition)
* Examples
  * Franny allowed the kids to play
    * Franny allowed [a specialist to examine Hassan/Hassan to be examined by a specialist]
    * kids are playing: object control or ECM
    * Franny allowed [Kai to eat the pie]/ Franny allowed [the pie to be eaten by Kai]
    * object: [the kids are allowed]
    * Franny allowed the shit to hit the fan/Franny allowed the cat out of the bag
    * in ECM environments the reading of allowed changes
  * Hassan expects to win the race
    * in this case, the downstairs subject determines the referent of the upstairs subject
    * a predicate can have more than 1 signature
    * subject control expects
    * Hassan expects [PRO to win the race]
    * expletive test: Hassan expects it [to win the race]
  * The kids are certain to like brussel sprouts
  * Kai promised Franny to return early
  * The kids pleaded with Franny to buy them candy
* Canonical properties of control structures
  * PRO must have an antecedent
    * \*It was expected [PRO to shave himself]
    * Hassan expected [PRO to shave himself]
      * expect here is a subject control verb not ECM
  * The antecedent must be local
    * \*Hassan thinks that it was expected [PRO to shave himself]
    * not in the clause immediately subordinating the PRO clause
    * currently local defined loosely
  * The antecedent must c-command PRO
    * \*[Hassan's barber] expected [PRO to shave himself]
  * PRO can not have aplit antecedents
    * \*Bert_i told Ernie_j PRO_{i+j} to wash themselves/each other
  * PRO only permits a **sloppy** interpretation under ellipsis
    * Hassan expects [PRO to win] and Franny does too = [Franny to win]
      * copying antecedent material, might expect the PRO we copied to be understood as Hassan but the interpretation is Franny
      * we don't get strict interpretations here where PRO refers to Hassan
* Obligatory vs non-obligatory control
  * control structures that conform to above canonical patterns are 'obligatory control' structures
  * not all control structures do, these are non-obligatory control structures (NOC)
  * Obligatory: local c-commanding antecedent
  * NOC: not obligatory to have a local c-commanding antecedent
  * NOC structures..
    * PRO need not have an antecedent
      * It was believed that [PRO shaving] was important
    * The antecedent need not be local
      * Hassan thinks that it is believed [PRO shaving himself] is important
        * Can't be raising here because subject for believed is expletive
        * Missing subject in lower clause is [Hassan] via control
    * The antecedent need not c-command PRO
      * [Hassan's barber] believed that [PRO shaving himself] is important
        * PRO is not being controlled by [Hassan's barber], but [Hassan]
    * Split antecedents are ok
      * Bert_i told Ernie_j that [[PRO_i+j washing themselves/eaxxh other] would be fun]
    * Strict reading under ellipsis permitted
      * Hassan thinks that [PRO getting his resume] in order is crucial and Franny [does too/ also thinks that [PRO getting his resume] in order is crucial]
        * = Franny can think Hassan needs to ge this resume in order
        * Hassan is the controller of the elided pro []
    * if it violates any of the canonical properties its non-obligatory
* Adjunct clause control
  * The vase_i broke [after PRO_i being hit with a ball]
  * This book_i was written [in order PRO_i to be read]
  * Franny_i talked to Larry_j [before PRO_{i/\*j} leaving the room]
    * has to be franny that leaves the rooms
* Control and syntactic theory
  * in GB, distribution and interpretation of PRO was thought to be determined by a combination of **binding theory** and a **control module**
  * The major concern was to differentiate distribution of PRO from traces of NP movement
  * Both traces and PRO are caseless and phonetically null
    * we always see PRO as the subject of a non-finite clause which is a caseless position
    * traces are formed by NPs moving to **seek** a case licensing position 
  * chain: an NP and any traces coindexed with it
    * traces are produced by movement but PRO is base-generated
    * traces are by definition the **tail** of a **chain**
    * PRO can **head** its own chain
  * traces and PRO have very different distributions
    * traces can occur in any theta-position and other caseless positions like SpecIP of a non-finite clause
    * PRO is restricted to subject position of a non-finite domain
  * GB explanation for this: traces must be properly governed, and PRO must not be governed
    * government is a local relation between 2 syntactic elements where one immediately dominates the other
    * for alpha to govern beta, they have to be sisters, in mutual c-command, and alpha projects the dominating node.
    * governing category
      * \(\alpha\) is a governing category for \(\beta\) iff
        * \(\alpha\) is the minimal XP that dominates \(\beta\)
        * \(\alpha\) is governor for \(\beta\)
    * governors
      * lexical heads (V, P, N)
      * finite Infl
    * it is only in non-finite Spec, IP that PRO is not governed
    * to account for PRO having a restricted dstribution it was proposed that it was a pronominal anaphor: [+anaphor],[+pronoun]
      * if big PRO is both anaphor and pronoun an impossible situation arises in binding theory
        * Principle A: an anaphor must be bound in its *governing category*
        * Principle B: A pronoun must **not** be bound in its *governing category*
      * PRO theory: PRO must **not** be governed
        * Since being simultaenously bound and free within a given domain (governing category) is impossible, the solution is that PRO must not appear in a governing category => PRO must not be governed
      * above reasoning also explains why PRO is phonetically null
        * the ungoverned environment has no case, and since you need case to be overt, you get the requirement that PRO has to be phonetically null
* Minimalist account for PRO
  * relationship between PRO and Case opened the door for a minimalist account of PRO that can be implemented as Case feature-checking
  * Chomsky and Lasnik (1993) proposed that PRO is not caseless but has a special null Case
    * accounts for contrasts which are problematic if PRO is understood in terms of government
      * We never expected [PRO to be found t]
        * If PRO raises to escape being governed by V, why can't it raise below to escape government by P?
        * Previously taken to be evidence for the govenrment approach
          * Matrix [expect] as subject control
          * Be-found is passive, and PRO is 'the one that's found' (IA)
            * big PRO in the passive as the findee, it makes sense for big PRO to be based generated as object of find
            * why is big PRO raising? Under GB, can't stay in IA because it's governed by [found]
      * \*We never expected [PRO to appear to t [that Sally left]]
        * alternative: PRO raises above because it needs to check [NULL] case with non-finite AgrS
        * but here, PRO is already in a case domain (PP) and can't raise
        * PRO should be understood as complement of the PP [to appear to X]; the one that appears to me that...
        * P is going to govern PRO so it has to escape and move but this is word salad
      * case approach to PRO also explains why overt D/NPs cannot appear as subjects of non-fiite clause
        * non-finite Infl only has [NULL] and only PRO can match that
  * Hornstein (1999)
    * [NULL] is stipulative
    * PRO depends on assumptions about theta theory that under MP are questionable
      * in GB, theta-roles can only be assigned in D-structure
        * minimalism inherited this in assumption that thera-roles are assigned **first Merge position**
          * We've been tacitly using this, i.e. why big PRO is base-generated as object of [found]
          * base position that determines thematic relation assumption
        * restrictions on theta-role assignment are **not conceptually necessary**
        * why can't theta roles be features?
          * if theta-roles can be assigned/checked by movement, there would be little reason to distinguish PRO in OC constructions from movement
            * we can just say that we get a PRO the same way we do raising
            * only difference is when it's control you raise into a theta-position, and not control is non-thematic
    * Traces vs PRO and theta-theory
      * under GB, raising structures get one theta role and gets raised; in control the thing that controls gets a new theta role
      * In horstein's analysis, the only difference is that what is moved gets a new theta role to check
      * in GB, this was inadmissible because of the theta-criterion
        * every chain must have exactly 1 theta role at the tail at both D and S structure
        * this forced a distinction between control and raising
    * Hornstein's questions
      * How well motivated are these assumptions
      * WHat goes wrong if movement goes from one theta position to another
      * Why distinguish traces from PRO?
      * Do the differences warrant all this machinery?
    * Proposal
      * OC PRO is identical to NP-trace
      * NOC PRO is just little pro
        * all the weird patterns in NOC PRO fall into place when you just assume they are *pro*
          * pronouns don't have to have an antecedent
      * Assumptions 
        1. theta-roles are features on verbs
           1. treates theta-roles as morphological features
        2. ~~Greed is Enlightened Self Interest~~
        3. A D/NP receives a theta-role by checking theta-feature of a VP or PredP that it merges with
           1. mechanizes theta-role assignment
        4. There is no upper bound on the number of theta-roles a chain can have
           1. logically required by movement pproach
        5. Sideward movement is permitted 
           1. comes into play in the analysis of adjustc OC
           2. movement can be to a place that does not c-command the original position
      * requirement of c-commanding local antecedent is expected if PRO is just an NP trace
      * locality requirements follow from normal raising locality differencess
      * requirement of split antecedents follows because antecedents cannot have moved from same position
      * sloppy reading accounted for, OC patterns just like raising constructions
      * idiom chunks ruled out because expletives and part of an idiom can not get theta feature
        * EXPL can't get theta-features
        * idiom chunks can't give canonical theta assignment
      * John hopes [PRO to leave] (subject control)
        * [IP John [VP <John> [hopes [IP <John> to [VP leave]]]]] 
        1. *John* merges with *leave* checking theta-feature
        2. *John* raises to embedded Spec,IP to check [D], **not a Case position** so *John* is not licensed
        3. *John* raises to Spec,vP of *hope* and checkes theta-feature. *John* now has two theta-roles (leaver and hoper)
        4. *John* raises final time to Spec,IP to check [D] and [NOM]