#=
The series 1^1 + 2^2 + 3^3 ... + 10^10 = 10405071317.
Find the last ten digits of the series 1^1 + 2^2 + 3^3 ... + 1000^1000.
=#

f(x) = BigInt(x)^x
a = collect(1:1000)
println(sum(map(f, a)) % 10^10)
