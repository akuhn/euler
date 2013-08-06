require_relative 'euler'

# Problem 40
# 28 March 2003
# An irrational decimal fraction is created by concatenating the positive integers:
# 0.123456789101112131415161718192021...
# It can be seen that the 12th digit of the fractional part is 1.
# If dn represents the nth digit of the fractional part, find the value of the following # # expression.
# d1 x d10 x d100 x d1000 x d10000 x d100000 x d1000000

$s = ""
Numeric.non_negatives.each do |n|
  $s << n.to_s
  break if $s.size > 1.million
end
def d(n)
  $s[n].ord-?0.ord
end

d(7).should == 7
d(12).should == 1
(d(1)*d(10)*d(100)*d(1000)*d(10000)*d(100000)*d(1000000)).should == 210

# => Champernowne constant (could be computed directly... but hey, this was so fast)