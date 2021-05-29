/*
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. 
For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, 
which means that 28 is a perfect number.
A number n is called deficient if the sum of its proper divisors is less than n 
and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, 
the smallest number that can be written as the sum of two abundant numbers is 24. 
By mathematical analysis, it can be shown that all integers greater than 28123 
can be written as the sum of two abundant numbers. 
However, this upper limit cannot be reduced any further by analysis even though it is known 
that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
*/

import kotlin.math.sqrt
import kotlin.math.ceil
import kotlin.math.floor
import kotlin.collections.MutableSet

fun sumOfDivisors(n: Int): Int {
    if (n == 1) {
        return 0
    }
    
    var s: Int = 1
    
    // huh, there's no override of `sqrt` that takes an int
    // there's almost certainly a more idiomatic way of doing this...
    // as I'm 100% sure that Kotlin doesn't want me to just spam casts everywhere
    val sq: Int = Math.ceil(Math.sqrt(n.toDouble())).toInt()
    for (b in 2..sq-1) {
        if ((n % b) == 0) {
            val floored: Int = Math.floor(n.toDouble() / b).toInt()
            s += (b + floored)
        }
    }

    // is it a perfect square or isn't it?
    if ((sq*sq) == n) {
        return s + sq
    } else {
        return s
    }
}

fun main(args: Array<String>) {
    val abundant: MutableSet<Int> = mutableSetOf<Int>() 
    var ans: Int = 0
    
    // this magic number is explained in the problem statement
    // but the short version is that it's mathematically provable that no number after this is relevant
    for (i in 1..28123) {
        var found: Boolean = false
        // there's probably a fancy if-any type construct but this is clean and readable
        for (item in abundant) {
            if (abundant.contains(i-item)) {
                found = true
            }
        }
        if (!found) {
            ans += i
        }
        
        if (sumOfDivisors(i) > i) {
            abundant.add(i)
        }
    }
    
    println("The answer is: $ans")
}