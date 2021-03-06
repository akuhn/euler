require_relative 'euler'

# Problem 28
# 11 October 2002
# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
# *21* 22 23 24 *25*
# 20  *7*  8  *9* 10
# 19  6  *1*  2 11
# 18  *5*  4  *3* 12
# *17* 16 15 14 *13*
# It can be verified that the sum of the numbers on the diagonals is 101.
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

def spiral(m)
  yield num = 1
  2.step(m,2) do |n|
    4.times { yield num += n }
  end
end
def spiral_sum(m)
  sum=0;spiral(m) {|n|sum+=n};sum
end

spiral_sum(5).should == 101
spiral_sum(1001).should == 669171001
