# 2021-01-18 Format String attacks

* Simple vuln
  * `sprintf(buf, "Warning: %s", attacker_string)`
  * can result in a buffer overflow
* Complex
  * `snprintf(buf, len, str)`
  * No buffer overflow risk, but attacker gets to specify the format string!
  * Consider
    * `printf(buffer)`
    * `printf("%s", buffer)`
  * The first argument here is the format string!
  * Mixture of data and commands become a risk
  * Printf format string is almost like a small program
  * If we can control the format string, we may be able to leak information out of the program
  * Arguments are pushe to the stack in reverse order
  * snprintf copies data in format string until it reaches '%'. Next argument in stack is then fetched and output in the requested format string
  * What happens if there are more '%' params than arguents?
  * Argument pointer keeps moving up the stack and points values in the previous frame!
  * Information lekage!
  * Programmers may not paint attention to sanitizing input like in langugage config
  * '%n` assumes the current argument is a pointer the number of characters written are copied to that address