require 'euler'

# Problem 23
# 02 August 2002
# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

module Enumerable
  def cross(enumerable)
    self.each{|a|enumerable.each{|b|yield a,b}}
  end
end

class Numeric
  def divisors
    return [] if self < 1
    fs = self.prime_factors
    (0...(1 << fs.size)).collect do |bits|
      b = d = 1;fs.each{|f|d*=f unless (bits&b).zero?;b*=2};d
    end.uniq.sort
  end
  def abundance
    divisors.sum - 2*self
  end
  def perfect?
    abundance == 0
  end
  def deficient?
    abundance < 0
  end
  def abundant?
    abundance > 0
  end
end

28.prime_factors.should == [2,2,7]
28.divisors.should == [1,2,4,7,14,28]
0.divisors.should == []
28.perfect?.should == true
12.abundant?.should == true

A = (0..30000).collect{|n|n.abundant?}
class Numeric
  def sum_of_two_abundant?
    !!(1...self).detect{|n|A[n]&&A[self-n]}
  end
end
23.sum_of_two_abundant?.should == false
24.sum_of_two_abundant?.should == true
25.sum_of_two_abundant?.should == false
(0..30000).reject{|n|n.sum_of_two_abundant?}.sum.should == 4179871