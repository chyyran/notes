# 2021-02-05 Sudo buffer overflow

* sudo allows non-root users to execute commands in privileged/escalated context
* 'setuid' program (sets user ID bit)

* CVE-2021-3156
  * disclosed 2021/1/26
  * heap-based buffer overflow
  * around since 2011 introduced in 1.8.2, and 1.9.0
  * gives root access to non sudoers
* description
  * sudo starts by modifying cmdline in argv by concating and escaping meta characters with backslashes
  * builds an array for logging on the heap `user_args` and copies argv while unescaping metachars
  * if commandline arg ends in backslash `\`, argument's null terminator is unescaped and `user_args` copies OOB onto stack
  * control size contents of buffer
  * independently control size and contents of overflow
    * last arg is followed by envvars
* options
  * overwrite next chunks memory tag (use after free)
  * function pointer overwrite within one of sudo's functions (`process_hooks_getenv`)
  * dll overwrite (change `libnss_systemd.so.2`)
  * race condition related to tempfile that sudo creates
  * overwrite `/usr/sbin/sendmail` on the heap with another executable
  * 