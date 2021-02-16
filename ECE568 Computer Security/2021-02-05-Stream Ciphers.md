# 2021-02-05 Stream Ciphers

* realtime data
* video encoding

## Introduction
* low latency
* operate a bit or byte at a time
* ciphertext as long as plaintext
* no modes!
  * can encrypt arbitrarily long messages
  * **no protection from malleability**
  * may not hide info very well
* keystream (OTP) is a PRNG sequence generated from a short key
* two types
  * synchronous stream ciphers
  * self-synchronizing stream ciphers
* performance
  * better than block ciphers in general
  * keystream for synchronous ciphers can be precomputed before message arrives
    * enc/dec is just XOR
* difficult to use safely
  * WEP used RC4 but IV was too short
  * repeating IV more damaging than a block cipher using CBC


## Synchronous stream ciphers

* keystream is independent of message text
* state is modified by function `f` and key
* each step uses feedback where `f` takes current state to produce new state
* PRNG function `g` takes state info and key as seed
  * state needs to change, using feedback loop from `f`
* decryption uses key to produce same keystream, and XORs keystream with ciphertext 
* initial state is IV
* keystream reuse
  * key or IV must be changed for new message
  * xor plain + ciphertext gives us the key 
* error properties
  * bit errors only affect corresponding plaintext
* error recovery
  * if a section of ciphertext is lost, ciphertext stream and keystream desync
  * recovery is then impossible
  
## Self-synchronizing ciphers
* keystream depends on plaintext
* state is a shift register
* each ciphertext bit created is shifted onto shift register, and fed back into PRNG generator `g`
* each ciphertext bit has an effect on the next `sizeof(shiftreg)` bits
* easy random access for decryption
  * read `sizeof(shiftreg)` bits before target position into shift register
  * begin decryption since ciphertext bits were shiftreg IV!
* keystream reuse
  * we can insert some random data at the beginning
* adversary can **replay** previously sent ciphertext and cipher will resync
* error propagation
  * bit errors will affect `sizeof(shiftreg)` bits
    * after that, corrupt bit will get shifted out
* error recovery
  * recovery after `sizeof(shiftreg)` bits have been decrypted


## Implementations

* RC4 ('Ron's code')
  * most commonly used stream cipher
  * publicly known, but needs license from RSA
  * keylength is generally 5-16 bytes
  * simple algorithm
    * KSA: 
      * Create array S[0...255] (every value of 8 bits, 256 cards)
      * `j = 0`
      * `for i from 0 - 255` (shuffle cards)
        * `j = j + S[i] _ key [i mod len(key)] mod 256`
        * `swap(S[i], S[j])`
    * PRNG:
      * `i, j = 0`
      * `i := i + 1 mod 256`
      * `j = (j + S[i]) mod 256`
      * `swap(S[i], S[j])`
      * `yield S[(S[i] + S[j]) mod 256]`
* SEAL
  * owned by IBM
  * optimized for software performance
  * can generate arbitrary portions of keystream without starting from beginning

  