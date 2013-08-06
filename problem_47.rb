require_relative 'euler'

# Problem 47
# 04 July 2003
# The first two consecutive numbers to have two distinct prime factors are:
# 14 = 2  7
# 15 = 3  5
# The first three consecutive numbers to have three distinct prime factors are:
# 644 = 2²  7  23
# 645 = 3  5  43
# 646 = 2  17  19.
# Find the first four consecutive integers to have four distinct primes factors. What is the first of these numbers?

def find(num)
  Numeric.positives.detect do |n|
    (n...n+num).collect{|n|n.prime_factors.uniq}.all?{|ps|ps.size==num}
  end
end

find(2).should == 14
find(3).should == 644
find(4).should == 134043