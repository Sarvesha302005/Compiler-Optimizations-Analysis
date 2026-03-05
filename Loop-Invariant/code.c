#include <stdio.h>

int loop_invariant(int *arr, int n) {
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += arr[i] * 10;
    }

    return sum;
}

// arr1 and arr2
// arr1[i] = arr[i-1] + 1

int main() {
    int arr[] = {1, 2, 3, 4, 5};
    int result = loop_invariant(arr, 5);
    printf("Result: %d\n", result);
    return 0;
}