# n! means n × (n − 1) × ... × 3 × 2 × 1
# 
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!
# 
# Usage: elixirc 20.exs

defmodule Fact do
  # basic recursive factorial
  def factorial(1), do: 1
  def factorial(n), do: n * factorial(n-1)
end

defmodule DigitSum do
  def add_digit(sum, string, n) when n < 0 do
    IO.puts(sum)
  end

  def add_digit(sum, string, n) do
    # returns a tuple
    digit_tuple = Integer.parse(String.slice(string, n, 1))
    digit = elem(digit_tuple, 0)
    sum = sum + digit
    add_digit(sum, string, n-1)
  end
end

big_number = Fact.factorial(100)
big_string = Integer.to_string(big_number)
DigitSum.add_digit(0, big_string, String.length(big_string)-1)
