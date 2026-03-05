#include <stdio.h>

int constant_folding() {
    int x = 10 * 5;
    return x;
}

int main() {
    printf("%d\n", constant_folding());
    return 0;
}
