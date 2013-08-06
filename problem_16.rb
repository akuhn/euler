require_relative 'euler'

# 2**15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2**1000?

(2**15).digit_sum.should == 26
(2**1000).digit_sum.should == 1366