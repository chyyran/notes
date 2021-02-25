# 2021-02-24 RSA Algorithm

* Popular pubkey algo
* Published by Ron **R**ivest, Adi **S**hamir, and Len **A**dleman t MIT in 1977
* Founded RSA Corp which licenses crypto protocols
* RSA patent expired in 2000
* GHCQ may have invented a similar algo as early as 1973
  
* Algo
  * Pick to **large** prime numbers *p* and *q*
  * Let *n* = p * q
    * Bitwidth of *n* defines the keysize.
    * We can publicly share *n*, no fast way to factor and retrieve *p* and *q*
  * Euler's theorem makes it convenient to base pub/privkey pair off a value phi
    * \(\varphi = (p-1)(q-1)\)
    * Pick a random value *e* coprime to \(\varphi\) to be our pubkey
    * \(a\) and \(b\) are coprime if 1 is the only positive integer that evenly divides both of them.
  * Someone can use our pubkey (*e*) to encrypt a plaintext M into a cryptotext C
    * C = M^e mod n
      * |M| (size of message) **has to be smaller** than *n* or we will get wraparound and RSA does not work
  * *e* (public), *n* (modulus), and C (cryptotext) can be public.
    * p, q, and \(\varphi\) must be secret
  * We need an inverse of the pubkey to derive our privkey.
    * Derive a private key *d* such that (e * d) = 1 mod \(\varphi\)
    * *d* can be computed quickly via the Extended Euclidean Method
    * No one else can calculate *d* because they do not know \(\varphi\)
  * Decryption: We can recover M from C using *d*
    * M = C^d mod n = (M^e mod n)^d mod n = M ^(e * d) mod n
    * Since (e * d = 1) mod \(\varphi\)
    * (e * d) = \(k \varphi + 1\) for some int k
    * M^(kp + 1) mod n = M^kp * M mod n = (M^kp mod n) * (M mod n)
    * By Euler' theorem we have \(a^\varphi = 1 mod n) so...
    * (M^kp mod n) * (M mod n) = 1 * M mod n = M if (M < n)
* Footguns
  * Message is signed by encrypting message with senders private key
  * Very poor resistance to spoofing because encryption uses exponentiation
  * `encrypt(K * M)` = (K * M)^d = `encrypt(K)` * `encrypt(M)`
  * Adversary can trick signer to sign messages signer has never seen
    * If victim wont sign M, but adversary picks K s.t. victim signs KM, and K, then a signature on M can be recovered
  * We can transform encrypted data without decryption
  