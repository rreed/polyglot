# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, 
# then a and b are an amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; 
# therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

# Finds the set of all divisors of the given `num` and returns the sum of the set.
# NB that this algorithm as written considers the number itself as a divisor, as obviously a number is divisible evenly by itself.
# So if you want "proper divisors", you'll need to subtract out the number itself from the return value.
sum_of_proper_divisors <- function(num) {
    divisors <- vector()
    idx <- 1
    for (i in 1:floor(sqrt(num))) {
        if ((num %% i) == 0) {
            divisors[idx] <- i
            if (i != num / i) {
                idx <- idx + 1
                divisors[idx] <- num / i
            }
            idx <- idx + 1
        }
    }
    return(sum(divisors) - num)
}

answer <- 0
n <- 2
while (n <= 10000) {
    # for example, consider the lowest known amicable pair, (220, 284)
    # the divisors of 220: {1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110}, which sum to 284.
    # the divisors of 284: {1, 2, 4, 71, 142}, which sum to 220
    # so if d(a) == a', and d(a') == our original input, we have half of a pair of amicable numbers
    # our algorithm will get the other half when it passes a' on a later loop, because d(a') == a and d(a) == a' 
    s <- sum_of_proper_divisors(n)
    more_different_s <- sum_of_proper_divisors(s)
    if (n == more_different_s & n != s) {
        answer <- answer + n
    } 
    n <- n + 1
}
print(answer)
