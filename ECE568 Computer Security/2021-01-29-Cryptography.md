# 2021-01-29 Cryptography

## Introduction
* Why is it useful?
  * case study: IoT security
  * can easily tamper with the device directly
  * flash memory
    * digest
    * bootloader
    * data
    * app0
    * app1
  * flash memory loaded in plaintext
  * power-on step
    * generate bootloader aes key into efuse
    * generate encryption aes key into efuse
    * uses bootloader key + secure digest to hash bootloader
    * use encryption key to encrypt data partition
    * reboot, verify bootloader signature
    * bootloader includes
      * public codesigning rsa key
    * verify app0 signature
    * pub/priv keypair in data can  generate and make x.509 request
    * app0 verify cloud endpoint with CA keystore
    * cloud can then authenticate data partition via x.509
  * door alarm example
    * security analysis should have some equipment approval number in FCC
    * find radio spectrum
    * 433Mhz is unlicensed band, lots of cheap transmitters
    * universal radio hacker (software defined radio) 
  * rolling keys
  * distributed keys
  * rolling key man in the middle attack for keyfobs
    * slightly below frequency of the transmitter
    * jams the car listening for keypresses
    * modify message on second keypress
  * industrial systems not better
    * SHODAN lol
    * can connect an control industrial control systems, storage units
    * so many products are by default insecure
    * security by obscurity
## Crytography
* Secret writing
  * existed far before computers, over 2000 years ago
* Four important properties
  * Confidentiality
    * secrecy of the data
    * algorithms called ciphers
  * Integrity
    * trustworthiness of the data
    * provided by hashes
  * Authentication
    * knowing where the data came from
    * prove identity or origin
    * signatures, MAC (Message Authentication Codes)
  * Non-repudiation
    * Prevents principal from denying they performed an action
    * achieved with the help of a trusted third party
    * double spending (bitcoin)
## Basic Ciphers
* A cipher is an algorithm tat obfuscates information so it seems random to anyone who does not possess a key
  * if i know the key, i can decrypt, if not i can not
  * trapdoor one-way functions
    * one-way function is easy to compute, inverse is difficult to compute
    * trapdoor means there is a backdoor: given information, inverse becomes easy to compute
    * has not been proven that true one-way functions exist
      * based on functions that are believe to be one-way
      * formal proof of existence entails P != NP
  * good candidates
    * factoring:
      * suppose z = x * y
      * given z, find x and y
    * discrete log:
      * suppose z = (x^y mod m)
      * given z, x, and m, find y = log_x z mod m
* Kerckhoffs' principle
    * security of any encryption system must only depend on secrecy of the key
    * one-way function itself must not be the source of secrecy
    * algorithms are easily disclosed
    * algorithms are hard to change
    * mifare
      * security is terrible
      * "kindergarten crytography"
      * security by obscurity defeated by dutch researchers
* caesar (shift) cipher
  * rot13
  * take each letter, replace it with letter shifted 3 letters to the right
  * decryption is inverse
* Substitution ciphers
  * plaintx letter is replaced with exactly one ciphertext letter
  * key is mapping between letter and ciphertext
  * `A=D, B=E, ...`
  * breaking:
    * every letter always gets encrpted to the same letter
    * frequency analysis
      * most popular letters
      * most common digraphs
      * frequency analysis
      * frequencies are pretty constant across languages written in latin
* Attacks
  * bruteforce attack
    * try all possible keys on ciphertext until output is intelligible
    * very very long
    * with big keysize, number of possible keys is stupid
      * 56-bit key has 2^56 number of possible keys
      * 10^6 tests/sec = 1142 years
  * cryptanalysis
    * do better than bruteforce
    * nature of characteristics of algorithm
    * some knowledge of plaintext characteristics
    * sampeles of plaintext-ciphertext pairs
    * ciptertext only attck:
      * adversary only has ciphertext
    * known-plaintext
      * adversary has some number of plaintext and ciphertext pairs
      * more pairs it takes to break cipher, the stronger it is
    * chosen plaintex/chosen ciphertext
      * adversary can pick a plaintext and get corresponding ciphertext
      * adverary can adaptively select plain or ciphertexts to help break cipher
* Polyalphabetic and periodic ciphers
  * improves substitution ciphers
  * polyalphabetic
    * instead of having one mapping, have a set of n mappings and cycle through them
      * every nth letter uses N letters
      * increases number of mappings
    * breaking:
      * if we know number of mappings, we can still do statistical analysis for small n
      * attack requires more ciphertext, but becomes easier if adversary has some plaintext/ciphertext pairs
    * enigma machine
      * series of rotors produce polyalphabetic cipher with very large n
      * permutation mapping of alphabet that changed with each stroke
      * common key would be starting positions of rotors, placement of rotors
      * temporary wiring circuits would bounce around to light up ciphertext letter
      * gave rise to the modern computer
* One-time pad, vernam ciphers
  * OTP, also called Vernam Cipher after
  * polyalphabetic cipher that never repeats
  * random substitution used for every character
  * infinite number of keys
  * perfect secrecy
  * unusable as a cipher because key has to be same length as the message to be encrypted
    * OTP sequence can not be repeated
  * ciphertext created by computing bitwise XOR of the plaintext an the key at a binary level
    * plaintext bit flipped when keybit is 1
    * remains the same if keybit is 0
  * if key is well chosen we have perfect secrecy
  * disadvantages
    * keylength = message length (key overhead of 100%)
    * each key only usable once
      * must be sent separately (securely) for every message
      * synchronization problem if messages are lost or reordered
      * key reuse reduces security significantly
    * cipher is malleable
      * bitflip in ciphertext flips only one bit in plaintext
      * needs integrity check to avoid tampering
      * malleability
        * say you want to deposit $1 to bank
        * if attacker MITM OTP can change bits in decrypted plaintext
        * attacker can flip deposit amount bit to anything higher than 1
    * need a good source of randomness or the key
  * strengths agianst attack
    * ciphertext-only account
      * theoretically provably secure
      * impossible to break if used properly
    * known-plaintext
      * XOR ciphertext with plaintext to reveal key
      * only need one pair
      * key is isnt supposed to repeat, but if it does cipher is broken
    * chosen-ciphertext
      * weak against known-ct/known-pt, so its weak against chosen-ciphertext/plaintext
## Stream vs Block ciphers
* practical ciphers
  * fixed length keys that are much shorter than message
    * dont depend on message length
  * efficient for encryption and decrypt
    * want things to scale
  * ciphertexts should be computational difficult to decrypt w/o key
    * quantum encryption
    * difficult is a moving target
  * two types
    * symmetric
    * public/private (assymetric key)
* stream ciphers
  * symmetric
  * malleable
  * similar to otp
  * key is used to generate a pseudorandom sequence of bits
  * bits are xor'd with plaintext
  * plaintext encrypted 1 bit at a time
  * synchronization problems: lost bits means message is corrupted
  * used when u have high time sensitivity
* block ciphers
  * symmetric
  * not malleable
  * encrypt blocks of plaintext at a time
  * usually 64-bits at a time
  * plaintext divided into blocks and encrypted separately
  * last block amy need to be padded to make it block length
  * desirable properties (shannon 1949)
    * confusion
      * obscuring relationship betwen plain an cipher text
      * make statistical analysis difficult even if attacker has a lot of p/c pairs
      * encoding should be non linear
        * Ek(M1 + M2) != Ek(M1) + Ek(M2)
        * don't want someone to be able to send an incomplete but comprehensible message
      * each character of ciphertext should depend on the entire key
    * diffusion
      * spreading influence of individual plaintext over much of ciphertext
      * each output bit affected by many input bits
      * flipping a single bit of key or plaintext should change half the output bits
        * probability of bit i flipping is 0.5 for any value of i
      * repetitive plaintext are spread over entire ciphertext
    * design
      * 2 components
      * subtitution cipher
        * replaces characters in plaintext with mapping (confusion)
      * permutation cipher
        * scrambing
        * transposes plaintext characters (diffusion)
      * iterated block cipher repeatedly applies these two ciphers in diff. combinations
      * substitution-permutation network
        * keys are applied by XOR input/output of each stage in the SPN
        * each layer transposes input in some (fixed, possibly known) order
        * each input has some input from other boxes spread across 
        * we can use the same key across each layer
* stream vs block ciphers
  * stream ciphers very simple, very fast
  * block ciphers more common
    * in the past, stream ciphers were proprietary so now we dont use them as much
    * many publicly available and well-studied block ciphers
