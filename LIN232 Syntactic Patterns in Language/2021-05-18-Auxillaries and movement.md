# 2021-05-18 Auxillaries and movement

* How much room do we have in the clause in our current thewory of X-bar
* Consider periphrastic tenses
  * I will have read my whole library by the time the pandemic is over
    * intuition tells us main verb is read but where does 'have' go?
    * T alreeady taken by have
    *  the entire tense 'will have read' is a future perfect tense
  * They must not be listening carefully if they think we can only draw English trees
    * where does be go?
    * present perspective
* periphrastic tenses: tenses formed by multiple auxilaries
* we need an extra vp layer to handle extra auxillary verbs
  * T' -> T VP-aux
  * VP-aux -> V' [V VP]
* Layered VP approach works for passive constructions too
  * The sunflowers were planted
  * [T' [T +pst] [VP_aux [V' [V were] [VP ...]]]]
* English auxllaries
  | Name                | Meaning                                     | Subcat    |
  | ------------------- | ------------------------------------------- | --------- |
  | be_cop              | Copular                                     | Main verb |
  | be_prog (+ing)      | Progressive                                 | Aux       |
  | be_pass (were/been) | Passive                                     | Aux       |
  | have_poss           | Possession                                  | Main verb |
  | have_perf           | Perfective                                  | Aux       |
  | do_main             | Accomplishment/performance                  | Main verb |
  | do_aux              | Tensal support before negation (do-support) | Aux       |
* Example
  * You must have been listening attentively
  * 
    ```
    [TP
        [DP You]
        [T'
            [T +past]
            [VP_aux
                [V'
                    [V have]
                    [VP_aux
                        [V'
                            [V been]
                            [VP listening attentively]
                        ]
                    ]
                ]
            ]
        ]
    ]
    ```
* NegP 
  * From now on we rewrite negations as the following PSR
  * NegP -> Neg' [Neg VP_aux]
## Thematic Roles
* So far we have not differentiated arguments from one another in a sentence
* But there is a difference
  * Terry drove my car into a lake
    * Terry here is an agent (do-er)
  * Terry is afraid of syntacticians
    * Terry is a experiener
  * Syntactically Terry is both the subject
* Agents
  * An initiator of an action, doer with high volianity
  * 'Virgilio played a beautiful song on the Jarana'
    * Virgilio is the doer
* Experiencers
  * Arguments that can perceive, feel, or hold attitudes towards events
  * 'Gavin saw me fail to park the U-haul'
  * 'Bears scare Clare'
    * Clare is experiencing fear
* Themes/patients
  * An argument that is the recipient of an action that causes it to be moved, affected, experienced, perceived, or undergo a change
  * 'I was hit by a ball'
    * Theme is 'I' who was hit by a ball
  * 'Tuyaa bought an air conditioner'
    * Theme is the air conditioner that was bought
* Goals
  * A place or entity toward which motion takes place
  * 'Rulema and I went to Ulaanbaatar together'
    * Ulaanbaatar is the goal
* Recipient
  * A subtype of goal that is involved in a change of posession
  * I gave Radu a tin of tea
    * 'Radu' is the recipient
* Source
  * The origin of motion
  * The Kiwi came out from the forest
    * 'the forest' is the source 
* Location
  * The place where an event or action occurs is the location
  * The University of Toronto is in Toronto
    * 'Toronto' is the location
* Instrument
  * An object or tool with which an action is performed
  * 'This key will open my shed'
  * 'The rock broke the window'
    * The rock 
  * She wrote the most beautiful calligraphy with a fine qalam
    * with-PP introduction
* Beneficiaries
  * A person or entity for whom an action is done or done for the benefit of
  * 'I will edit a paper for Rulema'
    * for-PP introduction
  * 'He knit my mother a scarf'
    * Can be rewritten as 'He knit a scarf for my mother'
* Now we can talk about how syntactic constructions like passives
  * Theme becomes the subject
  * ex:
    * We ate all the watermelon
      * We: agent (subj)
      * the watermelon: theme
    * All  the watermelon was eaten
  * Passivization demotes the argument that bears the agent role and promotes the theme to syntactic subject position
### Theta-roles
* A single argument may have more than one thematic role
  * Ifem gave a letter to Dai Juan
    * Ifem is both the agent and the source
* A verb only assigns one *theta role* per argument
  * ?Ifem wrote a letter to Ifem
    * Ifem can only count as a single syntactic role in the sentence
* **Theta criterion**
  * Each argument is assigned one and only one theta role by a verb
  * Each theta-role is assigned to one and only one argument
* Application
  * Dai Juan put the letter in my bag
    * 'Dai Juan' is the agent
    * 'the letter' is the theme
    * 'my bag' is the goal
  * *put the letter in my bag
  * *Dai Juan put the letter
  * *Dai Juan put the letter the book into my bag
    * Too many themes
  * *The book put the letter into my bag
  * *Dai Juan put the letter in my bag

## Subjects and movement
* Some languages allow null arguments
  * 下雨 'It's raining'
  * The argument is null
  * In English, we need the argument to be expletive: 'It is raining' 
  * Mandarin allows null pronouns (pro-drop)
* English provides evidence for 'Expletive' pronouns
  * 'it' shows up in subject positions, because they usually get theta roles in object positions
    * 'I love it' (theme)
    * 'Let's put a sticker on it' (goal/location)
* **Extended projection principle**
  * All clauses must have subjects
    * The specifier of TP must be filled by a DP or CP
  * Lexical information is expressed at all levels 
  * **There are certain phrases that must fill their specifier position**
* Quantifier float
  * Consider:
    * All the cherry trees might have bloomed early this year
    * The cherry tries might have all bloomed early this year
  * What is 'all' doing so deep in the tree? We've left a piece of the subject down in the treee
  * This is a quirk of Germanic languages
* VP-internal subject hypothesis
  * Subject of a sentence originates in the VP, then moves to Spec,TP to satisfy the EPP
  * We draw movement using arrows, in this case (t_VP to DP_subj) (lowercase-t means 'trace')
* Integrating with auxillaries
  * Where does our subject start?
  * [DP The farmers] [V_aux had] [V worked] [... together to improve their conditions]
  * We can test with quantifier float from earlier
    * The farmers had all worked together to improve their conditions
    * ?The farmers all had worked together to improve their conditions
    * The subject is the subject of the main verb