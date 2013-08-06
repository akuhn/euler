require_relative 'euler'
require 'mathn'

#Problem 5:
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest number that is evenly divisible by all of the numbers from 1 to 20?

(1*2*2*2*3*3*5*7).should == 2520
(1*2*2*2*2*3*3*5*7*11*13*17*19).should == 232792560

# Learned! could have used Integer#lcm (require 'rational')