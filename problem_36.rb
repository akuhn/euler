require 'euler'

# Problem 36
# 31 January 2003
# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# (Please note that the palindromic number, in either base, may not include leading zeros.)

class Numeric
  def palindromic?
    to_s == self.to_s.reverse && to_s(2) == self.to_s(2).reverse
  end
end

585.palindromic?.should == true
(1...1.million).select(&:palindromic?).sum.should == 872187

# => could generate all decimal palindroms abcba by hand, with odd digits for a