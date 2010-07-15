require 'euler'

# Problem 33
# 20 December 2002
# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
# There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
#  If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

curious = []
(10..99).each do |denom|
  (10...denom).each do |nom|
    a,b = nom.digits
    c,d = denom.digits
    curious << [nom,denom,b,d] if a == c && a > 0
    curious << [nom,denom,b,c] if a == d && a > 0
    curious << [nom,denom,a,d] if b == c && b > 0
    curious << [nom,denom,a,c] if b == d && b > 0
  end
end
curious = curious.select {|nom,denom,b,d| nom * d == b * denom}
curious.should == [[16, 64, 1, 4], [26, 65, 2, 5], [19, 95, 1, 5], [49, 98, 4, 8]]
require 'rational'
curious.collect{|nom,denom,b,d|Rational(b,d)}.prod.denominator.should == 100
