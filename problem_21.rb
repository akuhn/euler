require 'euler'

# Problem 21
# 05 July 2002
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and each of a # and b are called amicable numbers.
#  For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# Evaluate the sum of all the amicable numbers under 10000.

class Numeric
  @@A = []
  def divisors
    @@A[self] if @@A[self] 
    @@A[self] = (1...self).select{|d|self % d == 0}
  end
end

class Range
  def amicables
    self.select{|num|a=num.divisors.sum;a!=num&&a.divisors.sum==num}
  end
end

(1..300).amicables.should == [220,284]

amicables = (1..10000).amicables
amicables.should == [220, 284, 1184, 1210, 2620, 2924, 5020, 5564, 6232, 6368]
amicables.sum.should == 31626
