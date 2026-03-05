
#include <stdio.h>

int cse(int x, int y) {
    int a = x + y;
    int b = x + y;
    return a + b;
}


int main() {
    int x = 5;
    int y = 10;
    printf("%d\n", cse(x, y));
    return 0;
}