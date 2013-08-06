require_relative 'euler'

# Problem 7:
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10001st prime number?

P = [nil] + Primes.upto(123456).to_a

P[6].should == 13
P[10001].should == 104743

# require_relative 'euler' => Program exited with code #0 after 0.13 seconds.
# require 'mathn' => Program exited with code #0 after 55.20 seconds.


