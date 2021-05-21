# 2021-05-20 Auxillaries and movement 2

* Posessive DPs like 'My Computer' should have a Genitive (GEN) feature on the D-head
* Case tells us where to put nominals
* Example: She might have been working with my supervisor
  ```
  [TP
    [.DP She (1)]
    [T'
        [T might +past]
        [VP_aux
            [V'
                [V have]
                [VP_aux
                    [V'
                        [V been]
                        [VP
                            [t_DP to 1.D]
                            [.V'
                                [V' working]
                                [PP
                                    [P'
                                        [P with]
                                        [DP
                                            [D'
                                                [D my (GEN)]
                                                [NP supervisor]
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
## Other types of movement
### V-to-T movement
* Consider the following French sentences
  1. Elle regarde fréquemment la tele
     She watches frequently the TV
  2. Elle devrait lire des livres plus souvent
     She should read of.the books more often
  3. *Elle devrait lire plus souvent des livres
     She should read more often of.the books
* 'fréquemment' AP appears in between VP and the object NP
* We can not do the same as in 3... devrait is translated as a modal but is a main verb in French
  * Modal verbs in T is a quirk of Germanic and Sinitic languages
  * In Romance langauges, most modal verbs are full verbs
    * Fully inflected
  * Notice that lire is in infinitive form
* Finiteness is associated with verbal inflection, hosting tense, and main clauses
  * Associated with the ability to hose modal verbs in Germanic and Sinitic languages
* In finite clauses, we can put adverbs in between the verb and the object
* Devrait complement is a nonfinite clause, so we can not put an adverb
* In French finite clauses, the V head moves to T
  * we can write it as T+V and put the tense feature on it
* This is called head movement, or head-to-head movement
  * A head that moves takes all of its content and features with it.

* Il boit souvent du the
  He drinks often of.the tea
  ```
  [TP
    [DP Il (0)]
    [T'
        [T+V -pst,boit (1)]
        [VP
            [tDP to 0.D]
            [V'
                [AdvP souvent]
                [V'
                    [tV to 1]
                    [DP du the]
                ]
            ]
        ]
    ]
  ]
  ```
* Also presents in auxillaries
  Ils sont deja partis
  They are already left
  ```
  [TP
    [DP Ils (0)]
    [T'
        [T+V_aux +pst, sont (1)]
        [VP_aux
            [V'
                [tV to 1]
                [VP
                    [tDP to 0.D]
                    [V'
                        [AdvP deja]
                        [VP partis]
                    ]
                ]
            ]
        ]
    ]
  ]
  ```
* Also presents in negation
  Nous n'avons pas lave les fenetres
  We not-have NEG washed the windows

  We are not going to worry about the ne clitic, and just assume it is a negative form of the verb

  ```
  [TP
    [DP Nous (0)]
    [T'
        [T+V +pst,n'avons (1)]
        [NegP
            [Neg'
                [Neg pas]
                [VP_aux
                    [V'
                        [tV to 1]
                        [VP
                            [tDP 0.D]
                            [V' 
                                [V lave]
                                [DP les fenetres] 
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]
  ]
  ```
* We have so far been putting English negation in the wrong place. We need to negate the entire verbal domain, not just the main verb
  * This has to do with the scope of negation
  * Justin has not studied Urdu
    ```
    [TP
      [DP Justin (0)]
      [T'
        [T+V_aux +pst,has (1)]
        [NegP 
            [Neg'
                [Neg not]
                [VP_aux 
                    [V'
                        [tV to 1]
                        [VP
                            [tDP to 0.N]
                            [V'
                                [V studied]
                                [DP Urdu]
                            ]
                        ]
                    ]
                ]
            ]
        ]
      ]
    ]
    ```
* In French, all verbs move to T, and in English, only auxillaries do under normal circumstances
  * But why?
* Tense features like +pst, -pst can be **weak or strong**
* In French, these features are strong, they must always ben realized by an overt head, and the solution is to move the cloest verbal materal
* In English, these features are weak. If they are close enough to select a fully fledged VP, they are happy
  * If a full VP is not close enough to the complement, something verbal has to move there to host the features
## Movement and the Grammar
* Hypothesis of language
  * Mental lexicon stored in the brain
    * Difficult to investigate empirically since we only have access to spoken language (e-language)
  * Lexical items are combined using X-bar rules
  * X-bar rules give us Deep Structure (D-structure)
    * Also called Underlying Structure
    * Constrained by theta criterion
    * Semantically interpreted
      * Oftentimes we interpret meaning wrt where things go in the D-structure
    * Also get case assignment and licensing here
  * After transformration, movement, into **Surface structure**
    * Sent to Phonology module
      * Phonology deals with strings of morphemes and does not make reference to structure (debated)
  * Movement happens because we need phonological material to host features
### D-structure vs S-structure
* My advisor researched Mongolian
* D-structure
  * ```
    [TP
        [T'
            [T +pst]
            [VP_aux
                [V'
                    [V had]
                    [VP 
                        [DP
                            [D'
                                [D my, GEN]
                                [NP advisor]
                            ]
                        ]
                        [V'
                            [V researched]
                            [DP mongolian]
                        ]
                    ]
                ]
            ]
        ]
    ]
    ``` 
## More types of movement
* Consider the pair of sentences
  1. You have listened to six syntax lectures
  2. Have you listened to six syntax lectures?
* We have subject-auxillary inversion in polarity (yes/no) questions
* How do we derive 2 from 1? Where does the 'Have' go? 
  * CP is higher than TP
  * first we do head-to-head movement, then we do Spec,CP movement
  * Some complementizers have a +Q feature
* Function of the CP is to connects the clause to the discourse
* Function of TP is to situate clauses in time
* We can shift big chunks of the clause to the front for discourse purposes
  * It is six syntax lectures you have listened
  * Six syntax lectures you have listened to
## English Polarity Questions
* Have you listened to six syntax lectures
  * D-structure
  ```
  [CP
    [C'
        [C +Q]
        [TP
            [T'
                [T +pst]
                [VP_aux
                    [V'
                        [V have]
                        [VP
                            [DP you]
                            [V' listened to six syntax lectures]
                        ]
                    ]
                ]
            ]
        ]
    ]
  ]
  ```
 * S-structure
  ```
  [CP
    [T+V +pst,have (0)]
    [C'
        [C +Q]
        [TP
            [DP you (1)]
            [T'
                [tT+V to 0 (0)]
                [VP_aux
                    [V'
                        [tV to 1]
                        [VP
                            [tDP to 1]
                            [V' listened to six syntax lectures]
                        ]
                    ]
                ]
            ]
        ]
    ]
  ]
  ```
* Could she have opened the door?
  * D-structure
    ```
    [CP
        [C'
            [C +Q]
            [TP
                [T'
                    [T +pst,could]
                    [VP_aux
                        [V'
                            [V have]
                            [VP
                                [DP she]
                                [V' opened the door]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]
    ```
  * S-structure
    ```
    [CP
        [T Could,+pst (0)]
        [C'
            [C +Q]
            [TP
                [DP she (1)]
                [T'
                    [tT to 0]
                    [VP_aux
                        [V'
                            [V have] //V_aux has not moved because T already has the modal verb Could
                            [VP
                                [tDP to 1]
                                [V' opened the door]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]
    ```

## Do-insertion/Do-support
* Consider this pair
  * She enjoys Igbo poetry
  * Does she enjoy Igbo poetry
* In English, when you need to move T to Spec,CP, a semntically void verb "do" is inserted
  * enjoy is a main verb and refuses to move to Spec,CP
  * Happens at the end of D-structure, right before S-structure transformation
  * "Last resort"
  * arrow marked 'DO-insertion' and insert 'do' in T
* We also need to insert a 'do' in negation without an auxillary
  1. We finished our gardening before the rainstorm
  2. We *did not* finish our gardening before the rainstorm 
  * The NegP is not close enough to T to host the tense features, but the main verb does not want to move
  * need to insert 'do' to support the tense features
## Types of C-heads
* What types of C-heads do we have?
  * I know **that** you are a brilliant student
    * +FIN
    * -Q
  * I know you **()** are a brilliant student
    * +FIN
    * -Q
  * He asked **for** us to review the slides
    * -FIN
    * -Q
  * He asked **()** us to review the slides
    * -FIN
    * -Q
  * I wondered **if** they would come to my party
    * +FIN
    * -Q
  * I wondered **whether** they would come to my party
    * +FIN
    * +Q
* Different main verbs select different types of CP complements
  * that [-Q, +FIN]
  * () [-Q, +FIN] / [-Q, -FIN]
  * for [-Q, -FIN]
  * if/whether [+Q, +FIN]
