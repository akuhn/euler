require_relative 'euler'

# Problem 34
# 03 January 2003
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

class Numeric
  F = (0..9).collect(&:factorial)
  def factorion?
    F.values_at(*digits).sum == self
  end
end

145.factorion?.should == true
(3..7*9.factorial).select(&:factorion?).sum.should == 40730