# 🔧 Compiler Optimizations Analysis

A hands-on study of **x86-64 compiler optimization techniques** using GCC. Each optimization is demonstrated with a focused C program, compiled at `-O0` (no optimization) and `-O2` (aggressive optimization) to reveal how the compiler transforms code at the assembly level.

## 📁 Project Structure

```
Optimizations/
├── Common-Subexpression-Elimination/
├── Constant-Folding/
├── Constant-Propagation/
├── Dead-Code-Elimination/
├── Function-Handling/
├── Loop-Invariant/
├── Register-Allocation/
├── Strength-Reduction/
├── cmds                          # Shell commands used for compilation
├── ASSEMBLY_COMMANDS.md          # Quick reference for x86-64 instructions
└── README.md
```

Each optimization directory contains:

| File                  | Description                                              |
|-----------------------|----------------------------------------------------------|
| `code.c`              | C source code demonstrating the optimization scenario    |
| `O0.s`                | Assembly output compiled with `-O0` (no optimization)    |
| `O2.s`                | Assembly output compiled with `-O2` (full optimization)  |
| `differences.txt`     | Side-by-side diff of `O0.s` vs `O2.s`                   |
| `instructionLines.txt`| Instruction line counts for both optimization levels     |

---

## 🧠 Optimizations Covered

### 1. Common Subexpression Elimination (CSE)
Detects and reuses identical expressions (e.g., `x + y` computed twice) instead of recalculating them. At `-O2`, GCC computes `x + y` once and doubles the result with a single `leal` instruction.

### 2. Constant Folding
Evaluates constant expressions at compile time. The expression `10 * 5` is pre-computed to `50` and embedded directly into the assembly as an immediate value — no runtime arithmetic needed.

### 3. Constant Propagation
Substitutes variables with their known constant values. The chain `a = 5; b = a + 3;` is resolved entirely at compile time, and the function simply returns the literal `8`.

### 4. Dead Code Elimination
Removes computations whose results are never used. The variable `b = x * 20` is dead code — at `-O2`, GCC completely eliminates it from the assembly output.

### 5. Function Inlining (Function Handling)
Replaces function calls with the function body to avoid call overhead. The `static` helper function `add()` is inlined into `inline_test()`, which itself is reduced to a single `leal 5(%rdi), %eax`.

### 6. Loop Invariant Code Motion
Hoists expressions that produce the same result on every loop iteration outside the loop body. GCC restructures the loop to use pointer arithmetic and eliminates redundant recomputation.

### 7. Register Allocation
Optimizes variable storage by keeping values in CPU registers instead of memory (stack). At `-O2`, all computations happen directly in registers (`%edi`, `%esi`, `%eax`) — no stack spills.

### 8. Strength Reduction
Replaces expensive operations with cheaper equivalents. Multiplication by 8 (`i * 8`) is replaced with a left shift (`sall $3`) or an `leal` addressing mode trick.

---

## 🛠️ How to Reproduce

The commands used to generate all outputs are stored in the `cmds` file:

```bash
# Compile with no optimization
gcc -O0 -S code.c -o O0.s

# Compile with aggressive optimization
gcc -O2 -S code.c -o O2.s

# Generate side-by-side diff
diff -y O0.s O2.s > differences.txt

# Count instruction lines in each assembly file
grep -c "^\s*[a-z]" O0.s > instructionLines.txt
grep -c "^\s*[a-z]" O2.s >> instructionLines.txt
```

Run these commands inside any optimization subdirectory.

---

## 📊 Key Observations

| Optimization                      | Impact at `-O2`                                            |
|-----------------------------------|------------------------------------------------------------|
| Common Subexpression Elimination  | Duplicate `x + y` computed once, result reused via `leal`  |
| Constant Folding                  | `10 * 5` → immediate `$50` at compile time                |
| Constant Propagation              | `a = 5; b = a + 3` → immediate `$8` at compile time       |
| Dead Code Elimination             | Unused `b = x * 20` entirely removed                      |
| Function Inlining                 | `add()` call eliminated, body folded into caller           |
| Loop Invariant Code Motion        | Loop restructured with pointer arithmetic                  |
| Register Allocation               | All variables kept in registers, zero stack access          |
| Strength Reduction                | `i * 8` → `leal 0(,%rdi,8)` (shift-based multiply)        |

---

## 🧰 Tools & Environment

- **Compiler**: GCC 11.4.0 (Ubuntu 11.4.0-1ubuntu1~22.04.3)
- **Architecture**: x86-64 (AMD64)
- **OS**: Ubuntu 22.04 LTS (via WSL)
- **Diff Tool**: GNU `diff` with `-y` (side-by-side mode)

---

## 📚 References

- [GCC Optimization Options](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html)
- [x86-64 Instruction Set Reference](https://www.felixcloutier.com/x86/)
- *Compilers: Principles, Techniques, and Tools* — Aho, Lam, Sethi, Ullman (Dragon Book)
