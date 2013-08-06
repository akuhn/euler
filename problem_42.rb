require_relative 'euler'

# Problem 42
# 25 April 2003
# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.
# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?

class Numeric
  def triangle?
    ((1+8*self)**0.5).odd?
  end
end

class String
  def triangle?
    enum_for(:each_byte).collect{|n|n-?A.ord+1}.sum.triangle?
  end
end

[1, 3, 6, 10, 15, 21, 28, 36, 45, 55].all?(&:triangle?).should == true
"SKY".triangle?.should == true
`cat words.txt`.scan(/\w+/).select(&:triangle?).size.should == 162