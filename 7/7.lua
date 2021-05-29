--[[
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?

Usage: lua 7.lua
]]

function nthPrime(n)
	local r = 1
	for i = 1, n do
		while true do
			r = r + 1
			local isPrime = true
			for j = 2, r-1 do
				isPrime = r % j ~= 0
				if not isPrime then break end
			end
			if isPrime then break end
		end
	end
	return r
end

print(nthPrime(10001))
