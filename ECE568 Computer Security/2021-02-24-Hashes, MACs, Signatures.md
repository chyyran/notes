# 2021-02-24 Hashes, MACs, Signatures

* Integrity and authentication
  * Encryption does not provide integrity and authentication
  * Does not ensure that message has not been tampered, nor if it is from who you think it is
* Even without a key, attacker can
  * Insert random data at start and end
  * Replace message with random data
  * Replay messages
  * Reorder blocks if using ECB
  * Flip bits with stream ciphers
  * If data decrypts plausibly, receiver does not know it was tampered
* Cryptographic hashes
  * fundamental tool to provide integrity and authentication
  * used for
    * Modification detection codes (MDC) for integrity
    * Message authentication codes (MAC) for integrity and authentication
    * Digital signatures for integrity, authenticaton, non-repudiation
  * Hash function converts large input into smaller (usually fixed sized) digest 
    * H(m) = h
    * m is a preimage
    * h is a hash value or message digest
    * H is a lossy compression function
  * properties
    * Preimage resistance
      * given a value it is hard to find a preimage 
      * hard to reverse the hash
    * 2nd preimage resistance
      * Given a preimage, it is hard to find another preimage that hashes to the same digest
    * Collision
      * It should be hard to find collisions
      * Hard to find 2 images that hash into the same digest
    * small changes to input preimage results in large changes to digest
  * An *ideal* hash has security dependent entirely on the length of the digest
    * If length of digest is n bits then
      * EV to find another preimage with same digest needs 2^(n-1) guesses
      * Collisions to find any 2 preimages has EV 2^(n/2)
        * often called a *birthday attack*
        * easier to find collisions if you don't care about the colliding value
* MDC Modification Detection Codes
  * Can be used to provide integrity
  * Publish hash, and message
  * Allows us to verify that the message has not be tampered with
  * Send message insecurity, hash securely
  * Does not protect message confidentiality
  * Requires humans to check, usually even if we bother humans dont really check the entire digest
  * + encryption provides confidentiality, integrity, and authentication
  * receiver can verify source and integrity of the message by checking MDC matches message
  * commonly uses
    * SHA1
      * weak, probably broken
      * 160-hash
      * Created by NIST with help from NSA
      * Hashes 512 at a time
      * each block passed through 4 rounds of operations
      * Round uses 20 ops to update 160bit state
      * After block is processed, output state is used as input to hash next block
    * SHA2 (SHA256)
      * successor to SHA1
      * 256-hash
      * strong, not so much widely used but changing
    * MD5
      * broken
      * 128-bit hash
      * Created at RSA by Ron Rivest
      * Similar to SHA1, uses 4 rounds, 16 ops /round
* Message Authentication Codes (MAC)
  * Appends a key to the message
  * Provides integrity and authentication
  * h = H(k, M), where *k* is a secret key and *M* a message
  * hash function takes key as separate input, and output becomes dependent on both key and message
  * receiver knows that whoever generated MAC must also know key, providing authentication
  * do key exchange, then hash H(k + M)
  * messages can be sent insecurely since we have already dealt with key exchange
  * message is not encrypted, **so no confidentiality**
  * often constructed from symmetric ciphers
  * CBC-MAC
    * similar to block ciphers except single hash value is produced at the end
    * hash size same as block size of block cipher
    * an attacker can trick receiver into thinking later extended blocks are part of the message, since key is not fed back into ciphers (extension)
* keyed-hash or HMAC
  * Prevents extension problem of MACs
  * concatenates secret key with the message and using hash
  * starts with key *k* and message M
  * calculate inner hash with well known constant value C
    * XOR key with C to create 'inner key' k_i
    * concatenate k_i with M, and hash to get inner hash I
  * XOR key with different constant value C' to create outer key k_o
  * Hash k_o concatenated with I to get HMAC
  * inner hash masks ability to extend output
  * not much more work than regular MAC
  * HMAC = H(K XOR opad + H((K xor ipad) + M))
    * ipad = 0x5c repeated to n bits
    * opad = 0x36 repeated to n bits
  * HMAC-SHA256 very prevelant
  * H(K+M) not secure, non nested hashes allow attackers to add arbitrry info at the end of message
