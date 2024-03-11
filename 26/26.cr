def is_prime?(n : Int) : Bool
  return false if n <= 1
  
  (2..Math.sqrt(n).to_i).each do |i|
    return false if n % i == 0
  end
  
  true
end

def cycle_len(i : Int32) : Int32
    a = 1
    len = 0
    loop do
        a = a * 10 % i
        len += 1
        break if a == 1
    end    
    len
end

def solve() : Int32
    max_seq_len = -1
    ans = -1
    (6..1000).each do |v|
        if is_prime? v
            len = cycle_len(v)
            if len > max_seq_len
                max_seq_len = len
                ans = v
            end
        end
    end
    ans
end

puts solve
