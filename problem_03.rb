require 'euler'

# Problem 3:
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

13195.prime_factors.should == [5,7,13,29]

600851475143.prime_factors.max.should == 6857