import ballerina/io;

function isPrime(int n) returns boolean {
    if (n <= 1) {
        return false;
    }

    int i = 2;
    while (i <= (n / 2)) {
        if ((n % i) == 0) {
            return false;
        }
        i = i + 1;
    }

    return true;
}

function numConsecutivePrimes(int a, int b) returns int {
    int n = 0;
    while(true) {
        int val = (n * n) + (a * n) + b;
        if (!isPrime(val)) {
            return n;
        }
        n += 1;
    }
}

public function main() {
    int max_c = 0;
    int max_a_times_b = 0;
    int a = -999;
    int b = -999;

    while (a <= 999) {
        while (b <= 999) {
            int c = numConsecutivePrimes(a, b);
            if (c > max_c) {
                max_c = c;
                max_a_times_b = a * b;
            }
            b += 1;
        }
        b = -999;
        a += 1;
    }

    io:println(max_a_times_b);
}
