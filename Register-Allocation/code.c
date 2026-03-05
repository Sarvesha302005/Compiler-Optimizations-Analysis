#include <stdio.h>
int register_alloc(int x, int y) {
    int a = x + 1;
    int b = y + 2;
    return a * b;
}

int main() {
    int result = register_alloc(5, 10);
    printf("Result: %d\n", result);
    return 0;
}