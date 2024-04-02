# The number 197 is called a circular prime because all rotations
# of the digits (197, 971, and 791) are themselves prime.
# How many circular primes are there below one million?

# immediately yelled at for naming this file 35.nim instead of ThirtyFive.nim :)
import std/algorithm
import std/assertions
import std/strutils
import std/sequtils
import std/sugar

# no number containing a 0, 2, 4, 6, or 8 will ever be a circular prime
# (other than 2 itself, of course)
# because it will be even when that number rotates to the last position
# this is also true of 5 and divisibility by 5 (other than 5 itself)
# this also lets us avoid the annoying question of
# "but what if I rotate a zero to the first position?"
let BadDigits = {'0', '2', '5', '4', '6', '8'}

type Inputs = object
    low: int
    high: int

# super basic prime algorithm
# true if `n` is prime, false otherwise
proc isPrime(n: int): bool =
    if n <= 1:  return false
    elif n <= 3: return true
    elif n mod 2 == 0 or n mod 3 == 0: return false
    
    var i = 5
    while i * i <= n:
        if n mod i == 0 or n mod (i + 2) == 0: return false
        i += 6
    return true

# a range of numbers that are potentially prime
# this is not the greatest name because we still have to worry about 2 and 5
# but, shhhhhh
iterator possiblyPrime(range: Inputs) : int = 
    assert range.low >= 3
    var i = range.low
    while i <= range.high:
        # I was hoping for `none` but `not any` is fine
        if not intToStr(i).toSeq().any(c => BadDigits.contains(c)):
            # yield numbers that contain only 1, 3, 7, and 9
            yield i
        inc i

proc intSeqToInt(s: seq[int]) : int =
    var ret = 0
    for n in s:
        ret = ret * 10 + n
    return ret

proc permutations(i: int) : seq[int] = 
    # there's almost certainly a better way to do this 
    # stack of eight conversions in a trenchcoat
    # but the rotation functions DO make permutation easy
    let origSeq = intToStr(i).map(c => c.int - 48)
    var ret = @[intSeqToInt(origSeq)]
    var newSeq = rotatedLeft(origSeq, 1)
    while origSeq != newSeq:
        ret.add(intSeqToInt(newSeq))
        newSeq = rotatedLeft(newSeq, 1)
    return ret

var ans = 2 # base case 2 and 5 as special cases
for i in possiblyPrime(Inputs(low: 3, high: 999999)):
    if permutations(i).all(x => isPrime(x)):
        ans += 1
echo ans
