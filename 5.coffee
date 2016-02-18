###
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

Usage: node_modules/.bin/coffee 5.coffee (with coffeescript installed locally)
###

check = (x for x in [3..20])  # all integers are divisible by 1, anything divisible by 20 is also divisible by 2
i = 0

loop
    i += 2520
    doesNotDivide = (x for x in check when i % x != 0)
    continue if doesNotDivide.length
    console.log i  # found it
    break
