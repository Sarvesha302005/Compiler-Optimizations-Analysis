#include <stdio.h>
int dead_code(int x) {
    int a = x * 10;
    int b = x * 20;   // never used
    return a;
}

int main() {
    int result = dead_code(5);
    printf("Result: %d\n", result);
    return 0;
}