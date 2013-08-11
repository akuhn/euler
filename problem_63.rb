require_relative 'euler'

def powerful_digits_count(k)
  count = 0
  for n in 1...Infinity
    digits = (n**k).to_s.size
    break if digits > k
    count += 1 if digits == k
  end
  return count
end

(1..100).collect{|n|powerful_digits_count(n)}.sum.should == 49

