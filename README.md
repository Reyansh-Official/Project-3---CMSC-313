# Project-3-CMSC313 — Hex Dump Program 

---

## Compile Executable

```bash
gcc -O0 -o hexfile hexfile.c
gcc -O1 -o hexfile hexfile.c
gcc -O3 -o hexfile hexfile.c

```

## Compile Assembly Files

```bash
gcc -O0 -S -o hexfile_O0.s hexfile.c
gcc -O1 -S -o hexfile_O1.s hexfile.c
gcc -O3 -S -o hexfile_O3.s hexfile.c
```

## Run Program

```bash
./hexfile binary.out
