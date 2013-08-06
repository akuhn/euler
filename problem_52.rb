require_relative 'euler'

# Problem 52
# 12 September 2003
# It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.
# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

class Numeric
  def problem_52
    ds = self.digits.sort
    ds == (self*6).digits.sort and
    ds == (self*5).digits.sort and
    ds == (self*4).digits.sort and
    ds == (self*3).digits.sort and
    ds == (self*2).digits.sort
  end
end

125874.digits.sort.should == 251748.digits.sort

Numeric.positives.detect(&:problem_52).should == 142857

# Yikes!
# ------ md2perpe wrote: 
# For this problem I didn't even use a computer. I just remembered that the repeating
# sequence of digits in the decimal representation of 1/7 has the desired property. 
#
# ------ Begoner wrote:
# The first number in x must be 1. If it were 2, then 6x would have more digits