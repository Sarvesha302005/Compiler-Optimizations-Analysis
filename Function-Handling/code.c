#include <stdio.h>

static int add(int a, int b) {
    return a + b;
}

int inline_test(int x) {
    return add(x, 5);
}

int main() {
    int result = inline_test(10);
    printf("Result: %d\n", result);
    return 0;
}