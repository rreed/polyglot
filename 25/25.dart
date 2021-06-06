void main() {
    var fibs = [BigInt.zero, BigInt.one];
    var i = 2;
    while (true) {
        BigInt nextFib = fibs[i-1] + fibs[i-2];
        String nextFibStr = nextFib.toString();
        if (nextFibStr.length >= 1000) {
            print("Answer: " + i.toString());
            return;
        }
        fibs.add(nextFib);
        i++;
    }
}