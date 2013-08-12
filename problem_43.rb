require_relative 'euler'

# Problem 43
# 09 May 2003
# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.
# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:
# d2d3d4=406 is divisible by 2
# d3d4d5=063 is divisible by 3
# d4d5d6=635 is divisible by 5
# d5d6d7=357 is divisible by 7
# d6d7d8=572 is divisible by 11
# d7d8d9=728 is divisible by 13
# d8d9d10=289 is divisible by 17
# Find the sum of all 0 to 9 pandigital numbers with this property.

class Array
  def to_i
    raise unless size == 3
    self[0]*100+self[1]*10+self[2]
  end
  def rather_divisable?
    d = [nil] + self # workaround missing 1-based indexing
    d[1] > 0 and
    d[4].even? and # d2d3d4=406 is divisible by 2
    d[3..5].sum%3==0 and # d3d4d5=063 is divisible by 3
    [0,5].include?(d[6]) and # d4d5d6=635 is divisible by 5
    d[5..7].to_i%7==0 and # d5d6d7=357 is divisible by 7
    d[6..8].to_i%11==0 and # d6d7d8=572 is divisible by 11
    d[7..9].to_i%13==0 and # d7d8d9=728 is divisible by 13
    d[8..10].to_i%17==0 # d8d9d10=289 is divisible by 17
  end
end

1406357289.digits.rather_divisable?.should == true

[*0..9].permutation.
  select{|d|d.rather_divisable?}.
  collect{|n|n.join.to_i}.sum.should == 16695334890

# !gosh, could have been solved manually :(
    
