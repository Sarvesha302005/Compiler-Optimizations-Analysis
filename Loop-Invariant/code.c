#include <stdio.h>

int main() {
    int a = 5, b = 10;

    for (int i = 0; i < 10; i++) {
        int x = a * b;   // loop invariant
        printf("%d\n", x + i);
    }

    return 0;
}