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
