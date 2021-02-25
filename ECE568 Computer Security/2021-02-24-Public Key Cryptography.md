# 2021-02-24 Public Key Cryptopgraphy

* Authenticates parties to mitigate MITM
* Public key cryptosystems uses a pair of keys
  * asymmetric
  * every user as a pub/priv keypair
  * pub/priv reveals nothing about 
  * Users distribute pubkey, keeping privkey secret
  * Messages encrypted with one key can only be decrypted with the other.
* Pubkey exchange
  * Alice selects a key **x** and encrypts with Bob's pubkey
  * Bob receives encrypted **x'** and decrypts with privkey
  * Alice and Bob now share **x**
  * Problems?
    * Still no authentication
* Popular pubkey algos are RSA and DS
  * RSA based on factoring
  * Digital Signature Algorithm (DSA) based on discrete logs and uses same principle as DH

* Encryption
  * sender encrypts with recipients pubkey
  * only recipient should have privkey so only recipient can decrypt message
* Pubkey Auth (signing)
  * To auth, message is encrypted with the senders privkey
  * Any recipient can decrypt using senders pubkey
  * Only sender could have encrypted the received text
    * + Authentication
    * + Non-repudiation
      * prove that someone did sign it, can not deny action
  * Randomness is important, extremely small chance that we can get key collision

* Public Key Infrastructure
  * What if Mallory arranges for Alice to get Mallory's pubkey, but makes it think it's Bob's key
  * Alice will encrypt messages to Bob with Mallory's key
  * Bob won't be able to decrypt and complain
  * Damage is already done, Mallory can decrypt Alice's messages to Bob
  * PKI is a trusted party that are only trusted to verify identities
    * Assume Alice and Bob trust Trent
    * Assume **everyone** knows Trent's pubkey
    * Bob creates a pubkey and goes to Trent
    * Trent sees Bob and his pubkey, and creates a cert that authenticates Bob, signed with Trent's privkey
    * Bob sends Alice his pubkey along with cert
    * Alice uses Trent's pubkey and cert to authenticate Bob's pubkey
  * Certs cant be faked because no one knows CA's privkeys!
* X.509 certificates
  * PKI allows using crt chain issued by a hierachy of CAs
  * Whats the difference from trusted central server?
    * Trust level -- no key knowledge
    * Not dependent on service, only ca-cert pubkeys
* PGP (Pretty good privacy)
  * use web of trust
  * every user has pub/priv keypair and is capable of signing certs
  * If Alice can authenticate Bob's pubkey, she can sign a cert saying so with her privkey
  * If Charlie can authenticate Alice's pubkey, he can issue a signed cert with his privkey
  * Trust is transitive
    * If you trust Charlie, you can trust Alice, and Bob
    * If you only trust Alice, you can trust Bob, but not Charlie
  * Relies on 6 degrees of separation
  * A little odd now and broke down in modern web
  * People's keys can be leaked and then chain of trust is broken
* Cert Revocation
  * If privkeys are leaked, certs must be revocable
  * Revocation cert (signed by higher CA) is issued
  * Usually created at the time pubkey cert is signed
