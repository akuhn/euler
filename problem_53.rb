require 'euler'

# Problem 53
# 26 September 2003
# There are exactly ten ways of selecting three from five, 12345:
# 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
# In combinatorics, we use the notation, 5C3 = 10.
# In general,
# n C r = n! / r!(n-r)! where r <= n
# It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.
# How many, not necessarily distinct, values of  nCr, for 1 <= n <= 100, are greater than one-million?

class Numeric
  def choose(num)
    self.factorial / (num.factorial * (self-num).factorial)
  end
end

23.choose(10).should == 1144066

(23..100).collect do |n|
  # Pascal's triangle is symetric, my dear!
  n-(1..n).detect{|r|n.choose(r) > 1_000_000}*2+1 
end.sum.should == 4075