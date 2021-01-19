# 2021-01-14 Buffer Overflows

* **Input Vulns**
  * Trust is dangerous, designers make unwritten, implicit assumptions
  * most common cause of vulns is trusting input
  * Third most leading vuln
  * Stack smash here with unchecked string copy 
    ```c
    int foo(char* input_str) {
        char bar[32];
        strcpy(bar, input_str); // st5ack smash
        return 0;
    } 
    ```
  * Vulnerability and exploit characterisitics 
    * Thinking about systems abstractly miss such vulns
    * Exploits rely on idiosyncracies of systems
    * Need to think outside the box
    * Someone compromised a casino through an IoC fishtank thermometer
    * Small, embedded devices that are easily compromisable
    * consumers will not pay for security
* **Intro to Buffer Overflows**
  * Buffer overflows are the most common source of vulnerabilities
  * Cowan: "Buffer Overflows: Attacks and Defenses for the Vulnerability of the Decade"
  * ASLR, NX, stack canaries
  * Recall how subroutine calls work
    * push input args
    * push return addr
    * push frame pointer
    * allocate local vars
    * push regs
  * example: call `foo` inside `main`
    * local variables are only a little bit away from the return address (RA)
    * RA is program flow!
    * If we overflow local vars, we can change the RA, and jump elsewhere, getting ACE. 
    * If we put garbage into RA we get segfault, but if we put in a place with meaningful instructions, we have pwned the app.
  * `strcpy` will copy up to `\0`. 
  * `strncpy` is "safer" than `strcpy`. 
    * If destination buffer doesn't fit, it will overflow
    * does not guarantee null termination!!!
  * Vuln requirements
    * Input string from attacker
    * Some stack buffer
    * Bug where input string is not checked before being copied into the buffer.
  * "Stack smash attack", because the attack overwrites values on the stack. 
  * Can be determined via source code, or decompiled code
  * attackers only need to succeed once
* **Shellcode**
  * Arbitrary code execution (ACE)
    * attacker needs to put code somewhere so we can return to it
    * program attacked is ran as root
    * attacker may want to gain access to a command shell
    * shellcode: `exec("/bin/sh")` or `exec("cmd.exe")`.
    * if we have a call to `exec` what if we replace the arg?
  * Syscall basics
    * `execve("/bin/sh", argv, NULL);` immediately replaces with a command shell, full setup with argv is pretty big though
    * libc is by default dynamically linked!
    * we need to statically link libc to analyze `execve`
      * set up arguments by loading args from stack
      * move 0xb into eax for execve syscall number
      * raise syscall interrupt, trap into kernel
  * Optimizing shellcode
    * if exploit code is too long, won't fit inside buffer
    * Requirements
      * Create array `["/bin/sh", NULL]`
      * Set arguments for exec:
        * %ebx: address to string "/bin/sh"
        * %ecx: address to the array
        * %edx: NULL (`0x0`)
      * Trap into kernel to call exec
        * put `0xb` into %eax
        * exec `int $0x80` 
    * optimized, address independent shellcode
      ```asm
      jmp 0x26                # 1. jump 0x26 bytes to 2.
      popl %esi               # 3. pop address of the string from stack into %esi
      movl %esi, 0x8(%esi)    # 4. write address of string to 8 bytes after 
      movb $0x0, 0x7(%esi)    # 5. write NULL terminator to "/bin/sh" 
      movl $0x0, 0xc(%esi)    # 6. write NULL after end of argv
      movl $0xb,%eax          # 7. write exec syscall number
      movl %esi, %ebx         # 8. write address to "/bin/sh"
      leal 0x8(%esi),%ecx     # 9. write address to array
      movl 0xc(%esi),%edx     # 10. write address to NULL
      int $0x80               # 11. trap into kernel
      movl $0x1, %eax         # 12. syscall to exit(0) in case it fails 
      movl $0x0, %ebx
      int $0x80
      call -0x24             # 2. push string's address onto the stack, then jump to 3. 
      .string "/bin/sh"
      ``` 
  * Sanitizing shellcode
    * if we assemble the above shellcode, it contains a lot of null bytes.
    * we need to make substitutions to remove nulls to make `strcpy` copy our instructions
      * this is called "ASCII armoring"
    * substitute commands to get 0s without specifying 0s.
    * very optimized shellcode is 46 bytes long. 
* **Putting it all together**
  * Smashing the Stack for Fun and Profit
  * Example: Attack-buffer format
* **Other approaches**