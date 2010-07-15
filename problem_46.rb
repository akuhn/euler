require 'euler'

# Problem 46
# 20 June 2003
# It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
# 9 = 7 + 2*1^2
# 15 = 7 + 2*2^2
# 21 = 3 + 2*3^2
# 25 = 7 + 2*3^2
# 27 = 19 + 2*2^2
# 33 = 31 + 2*1^2
# It turns out that the conjecture was false.
# What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

Primes.upto(10_000)

class Numeric
  def goldbach_conjecture?
    return true if self < 2
    return true if prime?
    Primes.upto(self).detect { |p| ((self-p)/2).square? }
  end
end

Numeric.odd_numbers.detect do |n|
  !n.goldbach_conjecture?
end.should == 5777
