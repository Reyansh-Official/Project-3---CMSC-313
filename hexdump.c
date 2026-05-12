/* Name: Reyansh Attavar */

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#define BYTES_PER_LINE 16

static void print_hex_line(unsigned long offset, const unsigned char *buf, int count)
{
    int i;

    printf("%08lx", offset);

    for (i = 0; i < BYTES_PER_LINE; i++) {
        if (i < count)
            printf(" %02x", buf[i]);
        else
            printf("   ");
    }

    printf(" |");

    for (i = 0; i < count; i++)
        putchar(isprint((unsigned char)buf[i]) ? buf[i] : '.');

    printf("|\n");
}

int main(int argc, char *argv[])
{
    FILE         *fp;
    unsigned char buf[BYTES_PER_LINE];
    int           bytes_read;
    unsigned long offset = 0;

    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return EXIT_FAILURE;
    }

    fp = fopen(argv[1], "rb");
    if (fp == NULL) {
        perror(argv[1]);
        return EXIT_FAILURE;
    }

    while ((bytes_read = (int)fread(buf, 1, BYTES_PER_LINE, fp)) > 0) {
        print_hex_line(offset, buf, bytes_read);
        offset += (unsigned long)bytes_read;
    }

    if (ferror(fp)) {
        perror("fread");
        fclose(fp);
        return EXIT_FAILURE;
    }

    fclose(fp);
    return EXIT_SUCCESS;
}
