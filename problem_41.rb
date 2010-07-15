require 'euler'

# Problem 41
# 11 April 2003
# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
# What is the largest n-digit pandigital prime that exists?

class Numeric
  def prime? # less memory exhaustive :prime? 
    #!Primes.upto((self**0.5).ceil).detect{|n|self%n==0}
    !(2..(self**0.5).ceil).any?{|n|self%n==0}
  end
end

2142.prime?.should == false
2143.prime?.should == true
2144.prime?.should == false

def brute_force(r)
  ary = (1..r).to_a.reverse
  (0...ary.size.factorial).each do |n|
    num = ary.permutation(n).join.to_i
    return num if num.prime?
  end;nil
end

brute_force(9).should == nil # !digital sum indicates divisable by 3
brute_force(8).should == nil # !digital sum indicates divisable by 3
brute_force(7).should == 7652413
brute_force(6).should == nil # !digital sum indicates divisable by 3
brute_force(5).should == nil # !digital sum indicates divisable by 3
brute_force(4).should == 4231
