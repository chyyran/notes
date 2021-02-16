# 2021-02-05 Key Exchange

* Trusted Server
  * Idea:
    * central key server delegates keys to everyone
    * the server T is trusted by every user
    * every user has a unique secret key
    * T knows every user's key
    * scales linearly with users
  * basic exchange procedure
    * Alice sends a request to T
    * T generates a session key (KAB), and encrypts it twice, once with Alice's key, and once with Bob's key, then sends both back to Alice.
      * Remember, T knows all of the keys.
    * Alice decrypts her copy of KAB with her key 
    * Alice sends the other copy of KAB (encrypted with Bob's key)
    * Alice and Bob now have a shared secret
  * vulnerabilities
    * attacker needs to know keys even if they MITM
    * Alice and Bob needs to know their keys beforehand
    * Bob doesn't know that the other party is truly Alice (no authentication)
    * no replay protection
    * requires trusted server (single point of failure)
    * susceptible to DOS
 * examples
    * Needham-Schroeder
      * Alice sends a request to T with a one-time nonce
      * T replies with a session key, a nonce, confirms the recipient (Bob), and a ticket that Bob can open confirming the sender was Alice
      * Alice sends to Bob the encrypted shared secret (session key), and a ticket confirming her identity
      * Bob sends Alice a challenge-request containing his own nonce
      * Alice must send Bob the nonce changed in a certain agreed upon way
    * Kerberos
      * still in use today
      * based on Needham-Schroeder
* Diffie-Hellman
  * Finite Fields
  * Modular arithmetic
  * Attacks
* Public-Key Based Key Exchange
  * Introduction
* Pre-shared keys
  * symmetric ciphers require to parties share a key
  * key must be communicated before decrypt
  * if adversary intercepts key, then we have no security
  * scales poorly
    * population of n people needs a total of n(n-1)/2 keys without key reuse
    * so many keys can be easily intercepted!
