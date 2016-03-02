/*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

Usage: gcc 3.c; ./a.out
*/

# include <stdio.h>
# include <math.h>
 
int main() {
    long n = 600851475143;
    for (long i = 3; i <= sqrt(n); i = i+2) {
        while (n % i == 0) {
            printf("%ld\n", i);
            n = n / i;
        }
    }

    if (n > 2) {
        printf("%ld\n", n);
    }

    return 0;
}
