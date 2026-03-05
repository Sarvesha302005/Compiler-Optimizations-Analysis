#include <stdio.h>

int constant_propagation() {
    int a = 5;
    int b = a + 3;
    return b;
}

int main() {
    int result = constant_propagation();
    printf("Result: %d\n", result);
    return 0;
}