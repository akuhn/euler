require_relative 'euler'

# Problem 20
# 21 June 2002
# n! means n  (n  1)  ...  3  2  1
# Find the sum of the digits in the number 100!

100.factorial.digit_sum.should == 648
