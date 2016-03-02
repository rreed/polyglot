-- |The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
--  Find the sum of all the primes below two million.
--  Usage: ghc 10.hs; ./10

-- I'd love to pass a variable limit into this but ¯\_(ツ)_/¯
primes = 2 : primeList
  where isPrime (p:ps) n = p*p > n || n `rem` p /= 0 && isPrime ps n
        primeList = 3 : filter (isPrime primeList) [5, 7 .. 2000000]

main = putStrLn $ show $ sum $ primes
