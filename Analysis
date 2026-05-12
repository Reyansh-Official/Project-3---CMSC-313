Name: Reyansh Attavar

**GCC Optimization Analysis: Hex Dump Program**

**Compiler:** GCC 13.3.0 on x86-64 Linux
**Source:** hexdump.c — two functions: `print_hex_line` (static) and `main`

---

**-O0: No Optimization**

At `-O0`, GCC performs a direct translation of the source code with minimal analysis. Every function exists independently, variables are stored on the stack, and control flow closely matches the original C code.

`print_hex_line` is compiled as a separate function. Each call from `main` incurs full x86-64 calling convention overhead (argument setup, `call`, and `ret`). For each output line, this overhead is repeated, making function calls relatively expensive compared to the actual computation.

Both `main` and `print_hex_line` maintain separate stack frames, and most local variables are stored in memory rather than registers. This increases memory access overhead.

Inside the ASCII loop, `isprint` is implemented via `__ctype_b_loc()`, which is called repeatedly for each character. This results in redundant lookups into the locale classification table. Each character also involves branching logic to decide whether to print the character or a dot, increasing control flow overhead.

---

**-O1: Basic Optimization**

At `-O1`, GCC begins applying fundamental optimizations that significantly reduce overhead.

The most important change is function inlining: `print_hex_line` is inlined into `main`. This removes function call and return overhead entirely and allows further optimization across function boundaries.

Stack usage is reduced because variables that were previously stored in memory are promoted into registers where possible. This reduces load/store operations.

GCC performs loop-invariant code motion. The `__ctype_b_loc()` call is moved outside the inner loop and executed once, with its result reused for all characters. This eliminates repeated function calls inside the ASCII loop.

The conditional branch used for `isprint` is replaced with a `cmove` instruction. This removes branching and instead selects between values using a conditional move, reducing branch misprediction risk.

Additionally, `printf` and `fprintf` are replaced with their fortified variants (`__printf_chk`, `__fprintf_chk`), adding runtime safety checks without affecting performance in normal execution.

String literals are consolidated in the read-only data section, improving cache locality and reducing duplication.

---

**-O3: Full Optimization**

At `-O3`, GCC applies more aggressive optimizations focused on performance and instruction-level efficiency.

Loop headers are aligned using `p2align`, ensuring loops begin at 16-byte boundaries. This improves instruction fetch efficiency on x86-64 processors, though it increases binary size due to padding.

The compiler modifies its branch strategy for `isprint`. Instead of using `cmove`, it reintroduces a branch based on heuristics that assume predictable behavior. In typical input, most characters are printable, allowing the CPU branch predictor to handle the condition efficiently.

Cold code paths, such as error handling (`fopen` failures or `ferror` checks), are moved into a separate `.cold` function placed in a low-priority text section. This improves instruction cache usage by keeping the hot loop compact and focused.

---

**Summary**

At `-O0`, the program is a direct translation of the source code with high overhead due to function calls, stack usage, and repeated evaluations.

At `-O1`, most major performance improvements occur: inlining removes function call overhead, loop-invariant computations are hoisted, and branching is reduced.

At `-O3`, GCC focuses on low-level execution efficiency, including instruction alignment, branch prediction heuristics, and separation of cold and hot code paths.

In this program, the primary performance bottleneck is I/O (`printf` and `putc`), so differences between `-O1` and `-O3` are smaller compared to improvements from `-O0` to `-O1`.
