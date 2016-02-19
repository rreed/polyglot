/*
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

Usage: (on OSX, not tested elsewhere) clang++ 9.cpp; ./a.out
*/

#include <iostream>
using namespace std;

int main() {
    int max = 1000;
    
    /*
        a is necessarily < 333, since a<b<c and 333+334+335 = 1002
        b is similarly < 500, since n+500+501 = 1001+n
    */
    for(int a = 1; a < max/3; a++) {
        for(int b = a; b < max/2; b++) {
            int c = max - a - b;
            if(a*a + b*b == c*c) {
                cout << a*b*c << endl;
                return 0;
            }
        }
    }

    return 1; // we didn't find it, shouldn't happen. :)
}
