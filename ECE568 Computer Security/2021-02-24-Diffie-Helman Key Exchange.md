# 2021-02-24 Diffie-Hellman Key Exchange

* e2e encryption
  * keys are shared without a trusted service provider
  * service provider is kept in the dark
* Diffie-Helman
  * allow 2 parties to share a short common secret over an unsecure channel
  * based on an assumption that mod is hard to compute 
  * use mod arithmetic in a finite field
    * limited set of n elements where n > 1
      * Z = {0, 1, 2, ..., n-1}
      * every element x has an additive inverse, x + x' = 0
      * every element other than 0 has a multiplicative inverse, x * x' = 1
* mod arithmetic
  * a mod n = remainder(a/n)
  * any value a, value is between 0 and n
  * no negative numbers or fractions in a finite field
  * mod arithmetic is lossy.
  * 4 + **3** mod 7 = 0
  * 4 * **2** mod 7 = 1
  * modulus has to be prime for mod arithmetic to work in a finite field
    * if mod us composite, some numbers will not have a multiplicative inverse
  * exponentiation is easy
  * log is very hard
    * 4^3 mod 7 = 64 mod 7 = 1
    * log_4 1 mod 7 = **3**
    * discrete log of log_3 5 mod 7?
      * complexity of finding log grows with size of modulus
      * NP-hard
      * one way function
* DH algorithm
  * Alice selects *n* a large prime number modulus, and a specially selected number *g*, a generator of the field *n* between 1 and n-1.
  * *g* is a generator of field *n*, for *y* between 1 and n-1, there is *x* such that g^x mod n = y
    * g^0, g^1, ..., g^(n-1) yield numbers from 1 to n-1
  * Alice selects some random *x* and computes P = g^x mod n
  * Alice sends P, *g*, and *n* to Bob, *x* is secret.
  * Bob selects some random *y*, and computes *Q*= g^y mod n
  * Bob sends Q back to Alice, *y* is kept secret
  * Alice computes Q^x mod n = g^(xy) mod n
  * Bob also computes P^y mod n = g^(xy) mod n
  * Alice and Bob now share the same secret!
* Even if there is an eavesdropper Eve, without x and y, they only know P, Q, g, and n.
  * Eve has to solve a discrete log to discover g^(xy) mod n
  * Vulnerable to MITM
    * Eve can pretend to be Bob
    * Alice does not know whether Bob is who he says he i
    * Eve can establish shared secret with each, decrypt, and recrypt to pass it along.
    * DH does not authenticate parties.