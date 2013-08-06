require_relative 'euler'

# Problem 38
# 28 February 2003
# Take the number 192 and multiply it by each of 1, 2, and 3:
# 192 x 1 = 192
# 192 x 2 = 384
# 192 x 3 = 576
# By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?

class Numeric
  def pandigital?
    digits.sort == [1,2,3,4,5,6,7,8,9]
  end
end

class Problem38
  include Enumerable
  def each
    for r in 2..9 do
      range = 1..r
      Numeric.positives.each do |num|
        s = range.collect{|n|n*num}.join
        break if s.size > 9 
        yield s.to_i if s.to_i.pandigital?
      end 
    end
  end
end

Problem38.new.max.should == 932718654