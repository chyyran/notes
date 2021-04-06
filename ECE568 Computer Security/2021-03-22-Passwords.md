# 2021-03-22 Passwords
* people do not pick random passwords
* attacker has lists of commonly used passwords
  * dictionary attacks
* people reuse passwords
  * weak system being compromised may cause stronger systems compromised
  * 80% chance that a leaked password is already somewhere in a database even when hashes
* authentication is not mutual
  * user can not be sure that they are sending their password to the right system
  * phishing emails
* people write down passwords and anyone can log in

* storage
  * don't store in cleartext
  * hashed using on-way hash, only hash is stored
    * use bcrypt for password hashing
      * very slow, computationally expensive
  * user types in password
    * server hashes password
    * compares hash with in database
  * older Unix `crypt` function ignored everything after the first eight characters
  
* Salts
  * assume attacker steals password file and breaks one password
    * attacker finds password `p` given `H(p)`
    * salts prevent attacker cracking all accounts with same `H(p)`
  * salts are used to hide patterns
    * kind of like IVs
  * does not make it _too much more harder_ than the attacker
  * salts are not secret
    * stored in the password file
  * salts help prevent rainbow table attacks
* OTPs
  * OTP changes every time it is used
  * implemented using challenge-response auth
  * party presents a question (challenge)
  * other party provides valid answer (response)
* MFA
  * authenticatio uses something about the user (auth factor)
  * three factors
    * something you know (password)
    * something you have (OTP)
    * something you are (biometrics)
    * something you can do (captchas?)
  * MFA provides better security by making the user show multiple factors
  * smart cards = something you have + something you know (PIN)
* biometrics
  * moves binary to probablistic model
    * people change
  * FRR: false rejection rate
  * FAR: false acceptance rate (1:50000-1:100000)
    * birthday attack problem
  * layer approaches, multiple biometrics are needed for good security
  * harder to steal fingerprints than password
* Turing test
  * something the user can do
  * captchas
    * no human tester is needed
    * have been gettin weaker from advances in ML