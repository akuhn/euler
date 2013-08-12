require_relative 'euler'

# Problem 41
# 11 April 2003
# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
# What is the largest n-digit pandigital prime that exists?

2142.prime?.should == false
2143.prime?.should == true
2144.prime?.should == false

def brute_force(r)
  [*1..r].reverse.permutation do |each|
    num = each.join.to_i
    return num if num.prime?
  end
  return nil
end

brute_force(9).should == nil # !digital sum indicates divisable by 3
brute_force(8).should == nil # !digital sum indicates divisable by 3
brute_force(7).should == 7652413
brute_force(6).should == nil # !digital sum indicates divisable by 3
brute_force(5).should == nil # !digital sum indicates divisable by 3
brute_force(4).should == 4231
