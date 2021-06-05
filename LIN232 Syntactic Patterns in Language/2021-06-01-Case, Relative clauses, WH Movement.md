# 2021-06-01 Case, Relative clauses, WH Movement

## Case 
* structural case
  * nominative assigned in Spec of Finite T
  * accusative assigned in Complement of transitive V
  * genitive assigned in Spec of posessive D
* lexical case (Inst, Dat, etc.) usually assigned in Complement of P
* **The case filter**
  * All DPs must be marked with a case
  * if DP doesn't get case, derivation will crash
  * case allows us to describe why things move
* **locality**
  * DP must be close enough to an appropriate case assigning position to be *licensed* and receive case
  * sometimes called *checking* because it refers to features
    * have a feature that needs to be looked at by a case assignment head
  * we're only going to talk about assignment and licensing
* consider following sentences, where do the matrix subjects receive theta roles?
  1. Bolor seems to be a brilliant doctor
    * maybe it's at 'be?' 
  2. Urcilang is likely to win this game of Weiqi
    * maybe its at 'win'
  * 'to' must be T, it looks like an embedded clause
* **raising to subject**
  * Predicates like *seems*, *be likely*
  * embed a non-finite clause
  * [-FIN] T can not assign NOM (manifested by infinitive to)
    * in English
      * has 'to'
      * can't host modals
      * not tensed
      * can't assign NOM
      * doesn't participate in person/number agreement
      * still has EPP
  * embedded subject must keep moving to get NOM
  * all the way up to matrix Spec,TP
* Bolor seems to be a brilliant doctor
  * We don't embed the TP because CPs are impenetreble
  * 
    ```
    [TP
        [DP Bolor]
        [T'
            [T, -pst, NOM to 0.Spec,TP]
            [vP
                [v'
                    [v, active]
                    [VP
                        [V'
                            [V seems]
                            [TP
                                [tDP, to 0.Spec,TP]
                                [T'
                                    [T to, -pst, -nom]
                                    [vP
                                        [tDP, to 1.Spec,TP]
                                        [v'
                                            [v, active]
                                            [VP be a brilliant doctor]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]
    ```
* Urcilang is likely to win this game of Weiqi
  * 
    ```
    [TP
        [DP Urcilang]
        [T'
            [T, +NOM to 0.Spec,TP]
            [vP
                [v'
                    [v, active]
                    [VP
                        [V'
                            [V is]
                            [AdjP
                                [Adj'
                                    [Adj likely]
                                    [TP
                                        [tDP to 0.Spec,TP]
                                        [T'
                                            [T to, -NOM]
                                            [vP
                                                [tDP to 1.Spec,TP]
                                                [VP win this game of Weiqi]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]
    ```
## Relative clauses, WH movement

* Consider these DPs
  * ex
    * The letter I wrote
    * Several linguists I respect
    * The store my roomate bought his computer at
  * ex
    * The letter I wrote wasn't received until August
      * where does 'letter' get its theta-role?
      * wrote wants to assign one, so does 'received'
    * Several linguists I respect won a grant competition together
      * we want  to give theta role in 'respect' but 'won' also needs an agent
      * seems to violate theta-criterion, theta can not be both theme and agent
    * The store my roomate bought his computer at is now out of business
      * 'store' seems have 2 theta roles
* the transitive verbs in embedded CPs require an object to assign case but is still grammatical
  * 'dangling prepositions' lol
  * where did the object go?
  * intuitively its in the matrix DP
* relative clauses have gaps in their embedded CPs
  * [DP The letter [CP I wrote ___]]
  * verbs need to take an argument and V needs to tkae an object
* *operator*
  * silent category written *op*
  * originates in the gap
  * moves up to Spec,CP of embedded clause
  * abstract over the argument in the gap in the relative clause
  * 'variable' in a function f(x)
    * head noun tells us what x is
    * the whole relative clause is about x
  * CP becomes a 'descriptor' function that is about the noun in the DP
    * *saturated* the variable with the head noun
  * moves to Spec,CP to get close enough to the head noun
* overt WH operators
  * The letter *which* I wrote
  * Several linguists *who* I respect
  * The store *where* my roommate bought his computer
* what triggers the movement of the operators?
  * WH-elements are a clue
  * We say that there is a [+WH] feature on embedded C head
  * ex: The sunflowers we planted in the yard
    ```
    [DP
        [D'
            [D the]
            [NP
                [N'
                    [N' [N sunflowers]]
                    [CP
                        [op
                            [C'
                                [C, +WH]
                                [TP
                                    [DP we]
                                    [T'
                                        [T, +pst, +NOM]
                                        [vP
                                            [tDP to 1.Spec,TP]
                                            [VP
                                                [V'
                                                    [V'
                                                        [V planted]
                                                        [tOp, +ACC to 1.Head,VP]
                                                    ]
                                                    [PP in the yard]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]
    ```
   * ex: The teacher who inspired me
     ```
     [DP [D'
        [D the]
        [NP [N'
            [N' [N teacher]]
            [CP
                [DP who]
                [C'
                    [C, +WH]
                    [TP
                        [tDP to 1.Spec,CP]
                        [T'
                            [T, +pst, +NOM to 1.Spec,TP]
                            [vP
                                [tDP to 1.Spec,TP]
                                [v'
                                    [v, active]
                                    [VP inspired me]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]]
     ]]
     ```
* operator vs WH-movement
  * cf sentences
    * The filing cabinet I hoard old papers in
    * The filing cabinet where I hoard old papers (\*in)
  * there is a difference between *op* movement and WH-movement
    * op acts head-like
    * WH-movement can take an entire phrase with it.
## WH-questions
* many languages ask WH-questions by leaving elements in place, and some add extra markers or particles
* in English, WH-element to the front of the sentence and leaves a gap
* so far we have talked about head-to-head movement, Spec movement (A-movement)
* WH-movement is *phrasal* movement since it replaces or moves an entire phrase (A-bar movement)
* String-vacuous -- linear string hasn't changed but there is movement
* You can't just move something
  * Where **have** you been hiding our illegal literature
  * Who **did** the famous linguist compliment
* T-to-C, do-insertion, all still apply in WH-questions
  * need a +Q feature
* ex. Where have you been hiding our illegal literature
  ```
  [CP
    [PP where]
    [C'
      [C+T+V have, +Q, +WH, -Pst]
      [TP
        [DP you]
        [T'
            [tT+V, +NOM to 0.Head,CP]
            [VP_aux
                [V'
                    [tV to 0.Head,TP]
                    [VP_aux 
                        [V' 
                            [V been]
                            [vP
                                [tDP to 0.Spec,TP]
                                [v'
                                    [v, active]
                                    [VP
                                        [V'
                                            [V'
                                                [V hiding, +ACC to 0.Comp,VP]
                                                [DP our illegal literature]
                                            ]
                                            [tWH/tPP, to 0.Spec,CP]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
      ]
    ]
  ]
  ```
* do Do-insertion at the place of originalisation (in embedded TP)
* Subject WH doesnt have T-to-C movement
  * Who complimented my shiny jacket?
  * Who has cruelly stolen my kiwi literature?
    * V-to-T movement still occurs but T-to-C does not
    * cf. Who has not stoken my literature
      * Negation has to be under the T', so we see that 'has' moved up to T
      * no evidence of T-to-C 
* Long-distance WH
  * can also proceed out of some embedded clauses in English
    * Who do you think the famous linguist complimented?
      * Who originates as Adj,Complimented, moves to Think, then to Spec,CP
    * Where did you say I could buy good milk tea?
* If you want to escape CP, you have to stop at Spec,CP