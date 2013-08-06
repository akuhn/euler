require_relative 'euler'

# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 * 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

class Object
  def palindrom?
    to_s == to_s.reverse
  end
end

def max_palin(digits)
  palin = [0,0,0]
  upper = ("9"*digits).to_i
  lower = ("9"*(digits-1)).to_i
  upper.downto(lower) do |a|
    a.downto(lower) do |b|
      break if (a*b) < palin.first
      palin = [a*b,a,b] if (a*b).palindrom?
    end
  end
  palin
end

max_palin(2).first.should == 9009
max_palin(3).first.should == 906609


