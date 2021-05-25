# 2021-05-25 Little v, voice, case theory

## T-to-C Review
* *Have you taken a semantics course*
* This should be done as head-to-head movement, not to Spec,CP
* 
  ```
  [CP
    [C'
        [T+V+C, have +Q, +past]
        [TP
            [DP you]
            [T'
                [tT+V to C ]
                [VP_aux 
                    [V'
                        [tV to T]
                        [VP taken a semantics course]
                    ]
                ]
            ]
        ]
    ]
  ]
  ``` 


## Little v
* Consider the following sentences
1.  * Garth kicked the bucket
    * Garth kicked rocks
    * Garth kicked a rock
    * Garth kicked a habit
    * Garth kicked a ball
2.  * Genevieve grinned
    * Her dog grinned
    * I grinned
    * My friend's uncle who runs a Kiwi farm grinned
* Changing the object of a predicate changes its meaning, but changing the subject never does
    * Notice that 'kicked the bucket' and 'kicked rocks' have idiomatic meaning
    * 'kicked a rock' is literal
* Idioms are either entire sentence or verb-object. There aren't really subject-verb idios (Morantz, Kratzer)
  * We need to sever the 'external argument' (subject) from the VP
* Little v hypothesis schema
  ```
  [TP
    [T'
      [T]
      [VP_aux
        [V'
          [V_aux
            [vP
              [tDP_subj]
              [v'
                [v_active]
                [VP
                    [V'
                    [V]
                    [DP_obj]
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
* Eric accidentally broke the window
  ```
  [TP
    [DP Eric]
    [T'
      [T, +pst]
      [vP
        [tDP to Spec,TP]
        [v'
            [v_active null]
            [VP
                [V'
                    [AP accidentally]
                    [V'
                        [V broke]
                        [DP the window]
                    ]
                ]
            ]
        ]
      ]
    ]
  ]
  ```
* The little v is responsible for selecting the predicate
### Unaccusatives
* What thematic roles do the subjects in the following sentences?
  * Examples
    * The window broke
    * The lake froze
    * The box floated
  * The subjects here are not agents (themes) but the verbs are active verbs
* Unaccutatives are intransitive verbs that do not introduce an agent, and the only argument is a theme/patient.
  * little-v projection is not capable of introducing an external argument
  * the object of the verb must move to spec,TP to satisfy extended projection principle
* formally
  * v_active introduces agents or experiencers
  * V often introduces themes
    * **Theme comes from the specifier of the verb**
* We say that the theme theta role originates in the VP
* One test for unaccusative verbs is whetehr or not they can appear with agent-oriented adverbs
  * *The window accidentally broke
  * *The log intentionally floated
  * *The lake angrily froze
* Little-v can not host agent oriented adverbs
* tree for The lake froze
  ```
  [TP
    [DP the lake]
    [T'
      [T, +pst]
      [VP
        [v'
          [v_active null]
          [VP
            [V'
              [V froze]
              [tDP to Spec,TP]
            ]
          ]
        ]
      ]
    ]
  ]
  ```
* Unergatives are the opposite type of intransitive verbs, and only take an agent
  * The only theta-role assigned is by little-v
## Voice Alternations
* Voice is a category that affects the number of arguments a verb can take 
  * The relations the objects have to the predicate
  * Syntactic position 
* Passive sentences are derived from active counterparts
  * We planted eight sunflowers (active)
  * Eight sunflowers were planted (passive)
    * Theme was moved to Spec,TP
    * Auxillary verb 'were' is realized in Head,v
      * different from other VP-aux
    * passive v can not host an external argument
    * 
      ```
      [TP
        [DP Eight sunflowers]
        [T'
          [T, +pst]
          [vP
            [v'
              [v_passive were]
              [VP
                [V'
                  [V planted]
                  [tDP to Spec,TP]
                ]
              ]
            ]
          ]
        ]
      ]
      ```
    * agent-oriented adverbs can be used with passives unlike unaccusatives
    * compare with *Eight sunflowers had been planted*
      * been is now in v_passive
      * 
        ```
        [TP
          [DP Eight sunflowers]
          [T'
            [T, +pst]
            [VP_aux
              [V'
                [V_aux had]
                [vP
                  [v'
                    [v_passive been]
                    [VP
                      [V'
                        [V planted]
                        [tDP to Spec,TP]
                      ]
                    ]
                  ]
                ]
              ]
            ]
          ]
        ]
        ```
* Some languages represent passive voice with morphological suffixes
* Siguwa ide-gde-gsen 
  The watermelon was eaten
  ```
  [TP
    [DP Siguwa]
    [T'
      [vP
        [v'
          [VP
            [V'
              [tDP to Spec,TP]
              [V ide-]
            ]
          ]
          [v_passive -gde]
        ]
      ]
      [T -gsen, +pst]
    ]
  ]
  ```
* We see an example of the *causitive* voice in Mongolian
  Tere namaig Siguwa ide-gule-gsen
  3SG  1SG.ACC watermelon eat-CAUS-PST
  'They made me eat watermelon'
  ```
  [TP
    [DP Tere]
    [T'
      [vP
        [tDP to Spec,TP]
        [v'
            [vP
              [DP namaig]
              [v'
                [VP
                  [V'
                    [DP Siguwa]
                    [V ide]
                  ]
                ]
                [v_active null]
              ]
            ]
            [v_cause, -gule]
        ]
      ]
      [T -gsen, +past]
    ]
  ]
  ``` 
## Case theory
* Can we formalize where these arguments of verbs appear
* Previous we said EPP required 'It' to be inserted in weather verbs
  * If we have a v_pass that can't host a subject, what prevents us from using expletive it?
  * *It was planted the sunflowers
* Case describes the ability to host or *license* arguments
  * Originally used to describe morphological distinction to differentiate arguments
  * In generative syntax it describes what is allowed to host what
  * **case is assigned always**, regardless of morphological markers
  * case is tied to the ability to have or not have arguments
* A single head assigns case to an argument
  * In nominative-accusative languages
    * T assignes NOM
    * V assigns ACC 
  * Some languages have ergative-absolutive alignment, we will only look at NOM-ACC languages in this class
  * Variations in ability to do so gives us alternations in argument structure
* Transitives require that T can assign NOM and V can assign ACC
  * T assigns NOM to its specifier
  * Eric broke the window
    ```
    [TP
      [DP Eric]
      [T'
        [T, +past, NOM assigned to Spec,TP]
        [vP
          [tDP to Spec,TP]
          [v'
            [v_active null]
            [VP
              [V'
                [V broke, ACC assigned to Complement,VP]
                [DP the window]
              ]
            ]
          ]
        ]
      ]
    ]
    ```
* In unaccusatives, T is able to assign NOM but V is unable to assign ACC, so the object must move to receive case
  * The ice cracked
    ```
    [TP
      [DP The ice]
      [T'
        [T, +past, NOM assigned to Spec,TP]
        [vP
          [v'
            [v_active null]
            [VP
              [V'
                [V cracked]
                [tDP to Spec,TP]
              ]
            ]
          ]
        ]
      ]
    ]
    ```
* In passives, the v_pass selects a VP that cannot assign ACC
  * The watermelon was eaten
    ```
    [TP
      [DP The watermelon]
      [T'
        [T, +pst, NOM assigned to Spec,TP]
        [vP
          [v'
            [v_pass was]
            [VP 
              [V'
                [V eaten]
                [tDP to Spec,TP]
              ]
            ]
          ]
        ]
      ]
    ]
    ``` 
* This is similar to posessives, where genitive case is assigned by D to Spec,DP.
* case filter
  * All DPs must be marked with case
  * if case cannot be assigned the utterance will crash
* Two categories
  * Structural case
    * Nominative
      * Assigned to Spec of finite T
    * Accusative
      * Assigned to complement of transitive V
    * Genitive
      * Assigned to spec of posessive D
  * Lexical case
    * can be invented by a language, assigned to complement of P
    * Instrumental, Dative, Comitative, Ablative, Privative