/*
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

Usage: swift 17.swift

Author's note: I liked this problem least of all of them so far. :(
*/

import Foundation

func numToWords(var num: Int) -> String {
    if num == 1000 {
        return "onethousand" // special case it, don't bother replacing the whitespace I guess
    }
    var ret = ""
    var hundredsDigit = 0
    while num >= 100 {
        hundredsDigit += 1
        num -= 100
    }
    
    ret += hundreds(hundredsDigit)
    if (num != 0 && hundredsDigit != 0) {
        ret += " and "
    }
    ret += lessThanOneHundred(num)
    return ret.stringByReplacingOccurrencesOfString(" ", withString: "")
}

func hundreds(num: Int) -> String {
    switch num {
        case 1: return "one hundred"
        case 2: return "two hundred"
        case 3: return "three hundred"
        case 4: return "four hundred"
        case 5: return "five hundred"
        case 6: return "six hundred"
        case 7: return "seven hundred"
        case 8: return "eight hundred"
        case 9: return "nine hundred"
        default: return ""
    }
}

func lessThanOneHundred(num: Int) -> String {
    // English is highly irregular before twenty, so we special-case all of those
    if num < 20 {
        return lessThanTwenty(num)
    } else {
        return tens(num / 10) + " " + lessThanTwenty(num % 10)
    }
}

func tens(num: Int) -> String {
    switch num {
        case 2: return "twenty"
        case 3: return "thirty"
        case 4: return "forty"
        case 5: return "fifty"
        case 6: return "sixty"
        case 7: return "seventy"
        case 8: return "eighty"
        case 9: return "ninety"
        default: return ""
    }
}

func lessThanTwenty(num: Int) -> String {
    switch num {
        case 1: return "one"
        case 2: return "two"
        case 3: return "three"
        case 4: return "four"
        case 5: return "five"
        case 6: return "six"
        case 7: return "seven"
        case 8: return "eight"
        case 9: return "nine"
        case 10: return "ten"
        case 11: return "eleven"
        case 12: return "twelve"
        case 13: return "thirteen"
        case 14: return "fourteen"
        case 15: return "fifteen"
        case 16: return "sixteen"
        case 17: return "seventeen"
        case 18: return "eighteen"
        case 19: return "nineteen"
        default: return ""
    }
}

var sum = 0
for i in 1..<1001 {
    sum += numToWords(i).characters.count
}
print(sum)
