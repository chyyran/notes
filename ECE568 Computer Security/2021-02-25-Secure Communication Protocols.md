# 2021-02-25 Secure Communication Protocols

* Several steps
  * deciding who will be communicating
    * what will be sent
  * protocol guarantees
    * confidentiality
    * integrity
    * authentication
  * what crypto algos to use?
  * attackers goals and abilities
* attacker goals
  * key recovery
    * most damaging
    * can decrypt all messages
    * create fake messages
  * plain text recovery
    * receive plaintext of encrypted channel
  * message forgery
    * create fake messages
    * selective forgery: choose contents of message
    * existential forgery: can forge a message, but can't control contents
* encryption protocols used to keep things secure
  * if we just use ciphers, there are holes
* threat model
  * passive attacks
    * leaking messages
      * release contents
    * record messages for offline analysis
      * traffic analysis
  * active attacks
    * spoof messages
    * replay messages
    * DOS
  * adaptive attacks
    * learning with each modified message
    * uses knowledge to create a fake, modified message
* common MITM attacks
  * spoofing
    * attacker substitutes some other message for ciphertext
    * prevented by MDC
      * always take hash of plaintext
      * if you take hash of cryptotext, attackers can rehash new crypto
    * cant create brand new messages with MDC
  * replay attack
    * can resend old message from alice to bob
    * replayed message will contain valid MDC/MAC
      * bob cannot detect that they are not authentic
    * prevented by using a nonce
    * take hash of message + none
    * need to include plaintext nonce so Bob can validate
      * no need to send cryptotext nonce
      * if we change nonce, hash will fail
  * reordering attack
    * attacker can buffer messages sent by alice and bob, and send them to bob in different order
    * does CBC protect against reordering?
      * CBC only protects against reordering within message
    * incremental sequential nonce can prevent this
    * bob can check if messages come out of order