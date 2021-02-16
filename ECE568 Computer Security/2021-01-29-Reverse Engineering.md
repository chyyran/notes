# 2021-01-29 Reverse Engineering

* analyzing a product to learn something about design that creator wants to keep secret
  * software: src
  * hardware: circuit logic
* legally complicated
  * dmca
  * copyright/trade secret
  * eulas
  * usually forbidden to circumvent DRM
    * some exceptions
  * permitted for 'interoperability'
  * eulas may or may not override legislative rights
    * frustrating if reversing is your job, because it violates eulas
  * investigate what you are and are not allowed to do
* hackers frequently reverse to 
  * uncover flaws in apps
  * bypass auth
  * reuse flaws
* disassembly: machine code to asm
* decompilers: asm to source code
* easily change instructions to nops (`0x90`) for example to bypass if statements
  * sign code to prevent unauthorized modifications
* tools
  * IDA Pro
  * xdbg64
  * Snowman (compiled to C++)
