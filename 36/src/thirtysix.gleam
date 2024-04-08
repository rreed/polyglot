// The decimal number 585 == 1001001001 (binary) is palindromic in both bases.
// Find the sum of all numbers, less than one million, which are palindromic in base 10
// and base 2.

import gleam/io
import gleam/int
import gleam/list
import gleam/string

pub fn is_palindrome(s: String) -> Bool {
  s == string.reverse(s)
}

pub fn main() {
  io.debug(
    list.range(1, 1_000_000)
    |> list.filter(fn(x) {
      is_palindrome(int.to_string(x)) && is_palindrome(int.to_base2(x))
    })
    |> list.reduce(fn(acc, x) { acc + x }),
  )
}
