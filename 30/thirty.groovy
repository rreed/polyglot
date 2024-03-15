class Thirty {
    private powers = []

    // these is almost certainly a more idiomatic way of doing this :)
    def populate_powers() {
        for (int i = 0; i < 10; i++) {
            powers += i*i*i*i*i
        }
    }

    def sum_of_powers(n) {
        int sum = 0
        while (n > 0) {
            int i = n % 10
            // use pre-computed powers so we don't have to redo the math
            sum += powers[i]
            n = Math.floor(n / 10)
        }
        return sum
    }

    def solve() {
        int upper_bound = (9*9*9*9*9*9) 
        int ans = 0
        for (int i = 10; i < upper_bound; i++) {
            if (i == sum_of_powers(i)) {
                ans += i
            }
        }
        return ans
    }
}

solver = new Thirty()
solver.populate_powers()
print(solver.solve())