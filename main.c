#include <stdio.h>
#include <stdlib.h>

#include "add.h"

int main(int argc, char *argv[]) {
    int a = atoi(argv[1]);
    int b = atoi(argv[2]);
    printf("hello world: %d + %d = %d", a, b, add(a, b));
    return EXIT_SUCCESS;
}
