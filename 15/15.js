/*
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?

Usage: node 15.js

Math note: basically, we have twenty "right" moves and twenty "down" moves, and we need to know how many ways we can rearrange them. (In combinatorics terms, how many permutations of the set of possible moves are there?)

We can arrange these 40 moves 40! ways. Then, to deduplicate, we divide out the number of ways we can shuffle the 20 rights and the 20 lefts: 20! each.

The actual program that does this is not very interesting, but the math is cool. :)
*/

function factorial(n) {
    return (n === 0 ? 1 : n * factorial(n-1)); 
}

console.log(factorial(40)/factorial(20)/factorial(20));
