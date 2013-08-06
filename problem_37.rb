require_relative 'euler'

# Problem 37
# 14 February 2003
# The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

Primes.upto(10000)

class Numeric
  def truncatable_prime?
    (1...to_s.size).all?{|i|to_s[i..-1].to_i.prime?} and
    (1..to_s.size).all?{|i|to_s[0...i].to_i.prime?}
  end
end

223.truncatable_prime?.should == false
3797.truncatable_prime?.should == true

A = Primes.upto(1.million).select(&:truncatable_prime?).reject{|n|n<10}
A.size.should == 11
A.sum.should == 748317
