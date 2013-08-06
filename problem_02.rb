require_relative 'euler'

# Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
#
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#
# Find the sum of all the even-valued terms in the sequence which do not exceed four million.
#

class Fib
  include Enumerable
  def initialize(limit)
    @limit = limit
  end
  def each
    a = b = 1
    while b <= @limit
      yield b
      b = a + (a = b)
    end
  end
end

Fib.new(4.million).select { |n| n % 2 == 0 }.sum.should == 4613732
