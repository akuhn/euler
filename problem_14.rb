require_relative 'euler'

# The following iterative sequence is defined for the set of positive integers:
# n = n/2 (n is even)
# n = 3n + 1 (n is odd)
# Using the rule above and starting with 13, we generate the following sequence:
# 13  40  20  10  5  16  8  4  2  1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.

class Numeric
  def even?
    self % 2 == 0
  end
  def next_turtle
    return nil if self < 2 
    self.even? ? self/2 : 3*self+1
  end
  @@T = Array.new(10.million)
  def length_of_chain
    return 1 if self < 2
    return 1 + self.next_turtle.length_of_chain unless self < @@T.size
    return @@T[self] unless @@T[self].nil?
    @@T[self] = 1 + self.next_turtle.length_of_chain
  end
end

class Range
  def element_with_longest_chain
    self.collect{|n|[n,n.length_of_chain]}.sort_by{|a|a.last}.last.first
  end
end

13.length_of_chain.should == 10
(1...1.million).element_with_longest_chain.should == 837799

