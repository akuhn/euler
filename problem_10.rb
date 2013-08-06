require_relative 'euler'

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

Primes.upto(10).sum.should == 17
Primes.upto(2.million).sum.should == 142913828922