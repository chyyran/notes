# 2021-01-11

* Assumptions come with blindspots
* systems change, need to think about new blindspots
* motivation
  * creating technology, needs to be a daily consideration in testing, deployment, creation
  * defensive coding
  * challenge design assumptions
  * how attackers exploit risk
* Rules and assumptions
  * rule around what access is permitted
  * some are explicit
  * some are implicit, based on assumptions
* how data can be turned into instructions
* security is a negative goal
  * try to ensure something cannot happen
  * positive goal: alice can read the file
  * negative goal: bob can not read the file
    * can't know how bob will try to read the file
      * pretend to be alice
      * use our defined interfaces?

**Section 1:** Introduction
  * Course intro
  * Quick review: OS, asm, software tools
  * Basic principles of computer security
  * Confidentiality, integrity, availability
**Section 2:** Software Code Vulnerabilities
  * Injection-tye attack
  * ROP
  * Format strings
  * double-free
  * Library attacks
  * defenses
**Section 3:** Cryptography
**Section 4:** Web Security
  * XSS, CSRF
  * SQL injection
  * cloud security
**Section 6**: Network Security
**Section 7**: Malware
**Section 8**: Physical security
