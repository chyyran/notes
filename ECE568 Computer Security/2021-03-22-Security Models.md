# 2021-03-22 Security Models

* Security policies
  * governs how a system handles information
  * mainly used in regulated environments
  * based on **security models** that are rigorous enough to stand up to proofs of security
    * models check if system is designed securely
    * system is secure if there are no bugs
  * policies implemented as Mandatory Access Control (MAC) policies
    * work with or trump user-specified DAC (discretionary access control) policies
* Types of policies
  * confidentiality
    * defines who is authorized to access info
    * military uses
  * integrity
    * trustworthiness or reliability of information
    * prevents corruption
  * confidentiality and integrity are at odds with one another

* Bell-La Padula (BLP) model
  * used to build confidentiality policies
  * two types of elements
    * **subjects** are the participants
    * **objects** are the data that is protected
  * **classification levels**, from highest to lowest
    * eg. Top Secret {TS}, Secret {S}, Classified {C}, Unclassified {UC}
  * **categories**
    * eg. FBI, NSA, POTUS
  * tries to set up what subjects can act on what objecs
  * each object associated with a security level
    * security level is classification level + set of categorie
    * eg. {TS, {NSA, POTUS}}
  * each subject has a clearance up to a givven classification level, and maximum security level defined as {clearance, categories}
    * subject may be assigned {S, {NSA}}
  * A set of caetgories forms a lattice (partially ordered set) with a hierachy
  * creates a structure that tries to prevent leakae of info
  * idea is data exists at diff levels
    * can read from clearance level below you level
    * can **write up** on clearance above you
* Biba model
  * **write down**, read up (from more trusted sources)
  * trying to maintain integrity of main data
  * opposite from BLP model
  * simple integrity property
    * **s** permitted to read object **o** iff integrity level of **s** is lower than that of **o** (i(s) leq i(o))
      * no read down
  * \*-integrity property
    * **s** permitted to write **o** if integrity level of **o** is *lower* than that of **s** (i(o) leq i(s))
      * no write up
  * **s1** can execute **s2** iff i(s2) leq i(s1)