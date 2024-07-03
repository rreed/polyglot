sub is_pandigital($n) {
    return $n.chars == 9 && $n.comb(/<[1..9]>/).unique.elems == 9;
}

for 2..^10000 -> $i {
    my $p = $i.Str;
    for (2, 3, 4, 5) -> $j {
        $p ~= $i * $j;
        say $p if is_pandigital($p);
    }
}
