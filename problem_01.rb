require 'euler'

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

def self.multiples_of_3_or_5_below(num)
  (1...num).select do |n|
    n % 3 == 0 or n % 5 == 0
  end
end

multiples_of_3_or_5_below(10).sum.should == 23
multiples_of_3_or_5_below(1000).sum.should == 233168
