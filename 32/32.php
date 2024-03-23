<?php

function is_pandigital($n) {
    // split it, sort it, then smash it back together and see if it's exactly 123456789
	// this is less annoying than using a regex but probably not more efficient
    $sorted = str_split($n);
    sort($sorted);
    $sorted = implode('', $sorted);
    return $sorted === '123456789';
}

function solve() {
    $answers = array();
    for ($i = 2; $i < 99; $i++) {
        $j = $i + 1;
        while ($i * $j < 8999) {
        	$concat = ($i . $j . ($i * $j));
            if (is_pandigital($concat)) {
            	$product = $i * $j;
                if (!in_array($product, $answers)) {
    				$answers[] = $product;
				}
            }
            $j += 1;
        }
    }
    return array_sum($answers);
}

echo solve();