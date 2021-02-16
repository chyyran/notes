# 2021-02-05 Block Cipher Encryption Modes

* intuitively, SPNs seem easy to reverse but,
  * because it was permutated at each box, we don't know which bit was flipped and not flip without the key
* Common block ciphers
  * DES: Data encryption standard
    * Produced by NSA since the 70s
    * 56-bit key, block length of 64 bits
    * Insecure because of short key length
    * Feistel Network (16 rounds)
      * Each round, input is split into left half and right half
      * halves are switched, and computation modifies half of the input bits with PRNG (using half as switch)
      * result of PRNG is XOR'd with the other half
      * Each round includes computation with a portion of the key (subkey K_n)
      * halfs are then switch, one is always input, one is being transformed (PRNG seed)
        * transformation function does the following:
          * expansion permutations of 32-bit input into 48 bits
          * XOR with 48-bit subkey
          * S-box substitution that compresses 48-bits into 32-bits
          * permutation of 32-bit
        * S-boxes are the only non-linear element in the cipher
      * 8 rounds of transformation for each half block
    * Subkey generation
      * 56-bit key put through key schedule algo
      * split into 2 28-bit halves
      * each half shifted left by 1 or 2 bits depending on round
      * 24 bits selected from each half to make 48-bit subkey
      * number of shifts and bit selections carefully selected
        * constants based on random distribution
    * 3DES
      * Use a longer key length
      * Chain algorithm multiple times
      * 3DES splits a 168-bit key into three 56-bit keys, and runs the algorithm 3 times
        * encrypt with k1
        * decrypt (into garbled text) with k2
        * reencrypt with k3
        * allows interoperation (idempotent if k1=k2=k3)
  * AES: Advanced encryption standard
  * both are iterated block ciphers
* Block cipher encryption modes
  * blocks tend to be pretty short
  * we want to encrypt multiple blocks safely
  * not doing anything leaks information!
  * criteria
    * security
    * performance
    * error propagation 
      * effect of a bit error in ciphertext transmission
    * error recovery
      * can we recover from transmission error?
      * how much to retransmit
      * continue decryption after error?
  * Electronic Codebook (ECB)
    * break message into block-sized chunks
    * pad last block
    * independently encrypt block
    * highly parallelizable
    * poor security
    * patterns are bigger than blocksize!
      * plaintext blocks always encrypt to the same ciphertext blocks
      * can leak macro structure of plaintext data
      * adversary can add, delete, reorder blocks
    * error propagation
      * error will only impact corrupted block
      * plaintext block will be changed randomly
    * recovery
      * error is limited to affected block
      * retransmit effected block
      * skip black blocks during decryption
  * Cipher Block Chaining
    * make every block input dependent on ciphertext of previous block
    * initial value (IV) does not have to be secret, but shouldn't be reused for multiple messages
      * hides patterns between messages
    * chain encrypted blocks as input to next block using XOR
    * won't leak macro patterns
    * block-level malleability
      * not really too useful
    * good security
      * any plaintext change affects all later blocks
    * error propagation
      * corrupt ciphertext affects at most two blocks
    * performance
      * can not be parallelized
      * decryption can be parallelized
  * Cipher Feedback (CFB)
    * encrypt initial value
    * use encrypted IV to encrypt first block
    * can pipeline
    * no padding necessary
  * Output Feedback
    * no padding necessary
    * keep encrypting IV to get stream of values to encrypt blocks with
    * key stream is independent of plaintext
    * cipher ops can be done in advanced
    * easily supports ECC

* CBC is most common for arbitrary
* ECB safe to use for small pieces of data