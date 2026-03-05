
#include <stdio.h>
int strength_reduction(int i) {
    return i * 8;
}

int main() {
    int result = strength_reduction(5);
    printf("Result: %d\n", result);
    return 0;
}