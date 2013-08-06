require_relative 'euler'

# Problem 51
# 29 August 2003
# By replacing the 1st digit of *3, it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
# By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first example having seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this family, is the smallest prime with this property.
# Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.

class Numeric
  def mask(indices)
    str = to_s
    digits = []
    indices.each do |n|
      digits << str[n]
      str[n] = ?*
    end
    digits.uniq.size == 1 ? str : :mismatch
  end
  def pattern
    return enum_for(:pattern) unless block_given?
    b,n = 1,-2
    loop do
      yield n unless (self&b)==0
      b,n = b<<1,n-1
      break if b > self
    end
  end
end

3.pattern.to_a.should == [-2,-3]
56663.mask([-2,-3]).should == "56**3"
56123.mask([-2,-3]).should == :mismatch

def problem_51
  return enum_for(:problem_51) unless block_given?
  groups = Primes.upto(1.million).group_by{|n|[n%10,n.to_s.size]}.values
  groups.reject! {|primes|primes.size<8}
  groups.each do |primes|
    len = primes.first.to_s.size
    (1...(1<<len-1)).each do |bit|
      gs = primes.group_by{|p|p.mask(bit.pattern)}
      gs.delete :mismatch
      gs.each{|g|yield g}
    end
  end
end

problem_51.select{|mask,primes|primes.size>7}.should ==
[["*2*3*3", [121313, 222323, 323333, 424343, 525353, 626363, 828383, 929393]]]


  
