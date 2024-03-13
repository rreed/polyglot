// huh, Zig has no multiline comments by design
// this is basically just a math problem, but the math is kinda neat
// the 5x5 example can be thought of as a 1x1 "square" (the center 1)
// inside a 3x3 square inside a 5x5 square:
// 21 XX XX XX 25
// XX  7  X  9 XX
// XX  X  1  X XX
// XX  5  X  3 XX
// 17 XX XX XX 13
//
// By adding another "layer" (an outer 7x7 square) starting at proceeding right from 25, we get:
// 43 XX XX XX XX XX 49
// XX 21 XX XX XX 25 XX
// XX XX  7  X  9 XX XX 
// XX XX  X  1  X XX XX
// XX XX  5  X  3 XX XX
// XX 17 XX XX XX 13 XX
// 37 XX XX XX XX XX 31
// 
// And, in looking at this, we can see that the upper right corner of each sub-square is always
// the square of the N for an NxN square.
// And the other three corners are that square minus (N-1), i.e., we get sequences that look like
// (9,7,5,3) (subtracting 2 each time) 
// (25,21,17,13) (subtracting 4 each time) 
// (49, 43, 37, 31) (subtracting 6 each time)
// Perhaps unsurprisingly, this just leads us to a closed-form solution:
// the sequence (n^2, n^2 - n + 1, n^2 - 2n + 2, n^2 - 3n + 3)
// can be added together to get 4n^2 - 6n + 6.

const std = @import("std");

pub fn sumOfSpiral(size: i32) i32 {
    var n: i32 = 3;
    var ans: i32 = 0;
    while (n <= size) {
        ans += (4*n*n) - (6*n) + 6;
        n += 2;
    }

    return ans;
}

pub fn main() !void {
    const ans: i32 = sumOfSpiral(1001);
    std.debug.print("Answer: {d}\n", .{ans});
}
