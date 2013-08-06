require_relative 'euler'

# Problem 32
# 06 December 2002
# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
# The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

prods = []
1.upto(9999) do |a|
  next unless a.digits.uniq == a.digits
  a.upto(9999) do |b|
    ds = (a.digits + b.digits + (a*b).digits);
    break if ds.size > 9
    prods << a*b if (ds.size == 9 && ds.sort == [1,2,3,4,5,6,7,8,9])
  end
end

prods.uniq.sum.should == 45228
