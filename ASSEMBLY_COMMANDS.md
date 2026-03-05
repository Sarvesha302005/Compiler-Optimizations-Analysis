# x86-64 Assembly Instructions Reference

A quick one-line reference for every important x86-64 assembly instruction for this project.

---

## Data Movement

| Instruction | Definition |
|-------------|------------|
| `movl`      | Move a 32-bit (long) value from source to destination. |
| `movq`      | Move a 64-bit (quad) value from source to destination. |
| `leaq`      | Load the effective address (64-bit) of the source into the destination register, without accessing memory. |
| `leal`      | Load the effective address (32-bit) of the source into the destination register — often used for arithmetic tricks. |
| `movabsq`   | Move a 64-bit immediate value into a register (used for large constants that don't fit in 32-bit sign-extended form). |

---

## Arithmetic & Logic

| Instruction | Definition |
|-------------|------------|
| `addl`      | Add two 32-bit values and store the result in the destination. |
| `addq`      | Add two 64-bit values and store the result in the destination. |
| `subl`      | Subtract a 32-bit value from the destination. |
| `subq`      | Subtract a 64-bit value from the destination. |
| `imull`     | Signed multiply of two 32-bit values and store the result in the destination. |
| `sall`      | Arithmetic left shift of a 32-bit value by a specified number of bits (equivalent to multiplying by a power of 2). |
| `xorl`      | Bitwise XOR of two 32-bit values — commonly used as `xorl %eax, %eax` to zero a register efficiently. |

---

## Comparison & Branching

| Instruction | Definition |
|-------------|------------|
| `cmpl`      | Compare two 32-bit values by subtracting them and setting CPU flags (result is discarded). |
| `cmpq`      | Compare two 64-bit values by subtracting them and setting CPU flags (result is discarded). |
| `testl`     | Bitwise AND of two 32-bit values, setting flags without storing the result — used to check for zero or sign. |
| `jmp`       | Unconditional jump to a target label. |
| `jl`        | Jump to a target label if the previous comparison result was "less than" (signed). |
| `jle`       | Jump to a target label if the previous comparison result was "less than or equal" (signed). |
| `je`        | Jump to a target label if the previous comparison result was "equal" (zero flag set). |
| `jne`       | Jump to a target label if the previous comparison result was "not equal" (zero flag not set). |

---

## Stack Operations

| Instruction | Definition |
|-------------|------------|
| `pushq`     | Push a 64-bit value onto the stack (decrements `%rsp` by 8 and writes the value). |
| `popq`      | Pop a 64-bit value from the stack into a register (reads the value and increments `%rsp` by 8). |

---

## Function Call & Return

| Instruction | Definition |
|-------------|------------|
| `call`      | Push the return address onto the stack and jump to the target function. |
| `ret`       | Pop the return address from the stack and jump back to the caller. |
| `leave`     | Restore the stack frame by setting `%rsp = %rbp` and then popping `%rbp` — shorthand for function epilogue. |
| `endbr64`   | End branch marker for Intel's Control-flow Enforcement Technology (CET) — marks valid indirect jump/call targets. |
| `cltq`      | Sign-extend `%eax` (32-bit) into `%rax` (64-bit) — used before 64-bit address calculations. |

---

## Assembler Directives (Not Instructions)

| Directive     | Definition |
|---------------|------------|
| `.file`       | Specifies the original source file name for debugging information. |
| `.text`       | Marks the beginning of the code (executable) section. |
| `.globl`      | Declares a symbol as globally visible to the linker. |
| `.type`       | Specifies the type of a symbol (e.g., `@function`). |
| `.size`       | Sets the size of a symbol, typically computed as `. - symbol_name`. |
| `.string`     | Defines a null-terminated ASCII string constant in the current section. |
| `.long`       | Defines a 32-bit integer constant in the current section. |
| `.align`      | Aligns the next piece of data/code to a specified byte boundary. |
| `.p2align`    | Aligns to a power-of-2 byte boundary (e.g., `.p2align 4` = 16-byte alignment). |
| `.section`    | Switches to a named section (e.g., `.rodata` for read-only data). |
| `.cfi_*`      | Call Frame Information directives — metadata used by debuggers and exception handlers for stack unwinding. |
| `.ident`      | Embeds a compiler identification string into the object file. |
