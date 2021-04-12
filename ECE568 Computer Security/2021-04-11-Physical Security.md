# 2021-04-11 Physical Security

* background
  * why locks?
  * "do not let the bolt move until someone presents a valid token (key)"
  * negative goals makes security hard
  * before locks we had limited options for protecting wealth
    * hiding
    * encasing
    * guarding
    * physical or human barrier
  * early locks were pretty functional and simple (like early computer systems)
  * first locks were around 1451
* history of development
  * earliest exmples were wooden
  * advances came out of persia and china from 9th to 16th
* disclosure
  * physical security differs from computer securty
    * **upgrades are hard**
      * production lines need to be retooled
      * consumers have to replace locks, expensive
    * consequences
      * loss of property
      * loss of lives
  * culture of secrecy
    * locksmiths, manufacturers protect secrets
    * many of lessons of design failures not known
    * many new lock companies make mistakes fixed over 100 years ago
    * hard to educate consumers about risks if the tech isn't understood
    * **hard to design good security systems**
    * 1850-1880 exceptions
      * public interest in locks and security flourished
      * quickly returned to secrecy in 1900s
      * "Please destroy this book completely to protect yourself and our craft" -- The Art of Manipulation
        * complete opposite to computer security 
* culture clash
  * digital:
    * open disclosure
    * standards
    * rapid upgrades
  * physical:
    * trade secrets
    * proprietary
    * upgrades are hard
* physical security lessons
  * key/pw strength
    * no keys will stay secure forever as attackers have easier access to better tools
    * physical keys have a similar complexity growth
      * high security systems now need multiple keys
        * multi factor authentication
        * have/are/do
* design vs impl
  * majority of vulns come from impl decisions rather than design decisions
  * we can design very secure systems but implementation will have mistakes or need tradeoffs
  * most lock designs are secure in theory but its not cost effective to build perfect tolerances
    * this allows pins to be picked
    * attacking security systems one at a time
* validating user input
  * what goes wrong when a user provides an unexpected input?
  * overlifting attack
  * chubb lever lock would jam the lock if overlifted
    * parallel to buffer overflow and stack canaries
* replay attacks
  * keys are unencrypted
  * long validity periods
  * weak distribution
  * if someone can get the key and duplicate it, there is a replay attack
  * key blanks are easily available and manufacturers stamp key code
    * traditional solution: Patent blanks
      * only manufacturer can 'legally sell' blanks
      * felony in the US to duplicate postal keys
    * 'secret encryption algo'
      * Kerckhoffs: security of the system must not depend on the scarcity of key blanks
  * most of US railway infrastructure protected by 15 keys
  * epoxy based key casting
  * 3d milling key blanks
  * 3d printing
* how to you detected a forged key?
  * moveable elements in key blank
  * similar to nonces ala needham-schroeder (live test)
  * undercuts, folded blanks
  * complex keycuts
* side channel attacks
  * safe locks
    * motion of ships would cause safes to unlock themselves
  * physical side channels
    * impressioning
    * filing away where a blank key is marked will eventually lead to a working key
* priv escalation
  * master key system
    * single keys that operate groups of locks
    * vuln where someone with lower privilege key can create a higher privilege key
    * use secondry cuts
    * six master key pins can be opened with 2^6 = 64 different keys
      * "phantom masters"
  * failure: kaba eplex
    * circuit traces pass directly under the status leds
    * shorting traces open lock without audit record
  * onity HT
    * hotel lock
    * interface on bottom allow reading locks memory including passcodes
    * and opening the lock providing a valid passcode
* layered security
  * drumm geminy
    * front tier firewall
    * resistant to crazy glue, grinders, hacksaws
  * safe relockers
    * web of sensors
    * triggering any sensor releases a cable that 'relocks' the safe
  * smart keys
    * perform cryptographic handshakes
    * allows expiring/lost keys
    * harder to dissect
* atomic operations
  * highest level of assurance is to test entire input as one single operation
  * prevent attackers from 'breaking down the problem'
  * 