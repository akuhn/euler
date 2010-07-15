require 'euler'

# Problem 57
# 21 November 2003
# It is possible to show that the square root of two can be expressed as an infinite continued fraction.
# 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...
# By expanding this for the first four iterations, we get:
# 1 + 1/2 = 3/2 = 1.5
# 1 + 1/(2 + 1/2) = 7/5 = 1.4
# 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
# 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...
# The next three expansions are 99/70, 239/169, and 577/408, but the eighth expansion, 1393/985, is the first example where the number of digits in the numerator exceeds the number of digits in the denominator.
# In the first one-thousand expansions, how many fractions contain a numerator with more digits than denominator?

def series
  require 'rational'
  return enum_for(:series) unless block_given?
  sqrt=1.to_r;loop{ yield sqrt=1+1/(1+sqrt)}
end

S = series.take(1000)
S.select{|r|r.numerator.digits.size>r.denominator.digits.size}.size.should == 153