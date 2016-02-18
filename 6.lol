OBTW
    The sum of the squares of the first ten natural numbers is,

    1^2 + 2^2 + ... + 10^2 = 385
    The square of the sum of the first ten natural numbers is,

    (1 + 2 + ... + 10)^2 = 55^2 = 3025

    Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

    Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

    Usage: lci 6.lol

    Author's note: I skipped four and five because of very very limited library support in lolcode. :)
TLDR

HAI 1.4
    BTW find the square of 1..n: (n*(n+1)/2)^2
    I HAS A a ITZ SUM OF 100 AN 1
    I HAS A b ITZ PRODUKT OF a AN 100
    I HAS A c ITZ QUOSHUNT OF b AN 2
    I HAS A square ITZ PRODUKT OF c AN c

    BTW find the sum of the squares
    I HAS A square_sum ITZ 0
    IM IN YR LOOP UPPIN YR i TIL BOTH SAEM i AN 101
        I HAS A x ITZ PRODUKT OF i AN i
        square_sum R SUM OF x AN square_sum
    IM OUTTA YR LOOP

    BTW subtract the two
    I HAS A difference ITZ DIFF OF square AN square_sum

    VISIBLE difference
KTHXBYE
