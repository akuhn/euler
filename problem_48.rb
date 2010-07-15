require 'euler'

# Problem 48
# 18 July 2003
# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

(1..10).collect{|n|n**n}.sum.should == 10405071317
(1..1000).collect{|n|n**n}.sum.to_s[-10..-1].should == "9110846700"
