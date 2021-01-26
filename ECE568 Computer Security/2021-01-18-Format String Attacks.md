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
  * Arguments are pushed to the stack in reverse order
  * snprintf copies data in format string until it reaches '%'. Next argument in stack is then fetched and output in the requested format string
  * What happens if there are more '%' params than arguments?
  * Argument pointer keeps moving up the stack and points values in the previous frame!
  * Information leakage!
  * Programmers may not pay attention to sanitizing input like in language config
  * `printf` can leak out of bounds memory on the stack when we have more `%x` or format arguments. 
* We can write RA through printf
 * `%n` assumes the current argument is a pointer the number of characters/bytes written are copied to that address
 * We can use this to write to memory with a bad format string
 * If `%n` points to the RA on the stack, we have ACE.
 * `%n` attack:
   * `printf(buf, 123);`
   * if our format string is long enough, it will start to wraparound and reading from the top of the buffer
   * put address of RA at the top of the format string
   * put shellcode in format string
   * put enough `%` format args so the arg pointer points to the front of the format string
   * put `%n` at the end to overwrite RA to point to shellcode
     * how do we get `%n` to a high enough value? address of our shellcode in practice will be very large and `buf` won't be long enough
       * number of characters written can be controlled by adding a width argument between `%`, `x/u/d`
       * `%243d` writes an integer with a field width of 243, and `%n` will be incremented by 243.
       * even with this, we may need to write gigabytes of output before we reach a valid stack address.... however
       * 32-bit number return address can be **written one byte at a time**
         * Use just lowest-order byte by `%hhn`
         * divide address into 4 eight-byte values, each value is at most 256
         * increment with moduluo-256 arithmetic
         * write `%x...%nnx%hhn%nnx%hhn%nnx%hhn%nnx%hhn`
         * `%n` = 32 bits, `%hn` = 16 bits, `%hhn` = 8 bits
         * add dummy values to be consumed by the `%nnx` to manipulate the number mod 256 into the RA location
         * `buf = [RA, D, RA + 1, D, RA + 2, D, RA + 3, Shellcode]`
           * D is some dummy value
    * technique can be used to manipulate *any* memory
   * determining addresses
    * we need enough `%x` format strings, if we have enough we can leak some information up
     * attack only works if buffer is some stack variable
   * `snprintf` is not immune! it will interpret the whole format string regardless o the specified size limit. `%n` is **always** evaluated. 
     * if output is longer than len, format string is truncated before writing to `buf`