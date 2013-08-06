require_relative 'euler'

# Problem 35
# 17 January 2003
# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
# How many circular primes are there below one million?

class Numeric
  def circular_prime?
    ds = digits
    return prime? if ds.size == 1
    return false unless (ds-[1,3,7,9]).empty? 
    ds.all? { ds << ds.shift; ds.join.to_i.prime? }
  end
end

Primes.upto(100).select(&:circular_prime?).size.should == 13
Primes.upto(1.million).select(&:circular_prime?).size.should == 55
