require_relative 'euler'

# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def problem_09
  1000.downto(0) do |c|
    c.downto(0) do |b|
      a = 1000 - c - b
      break unless a.between? 1,b
      return [a*b*c,a,b,c] if (a*a+b*b==c*c)
    end
  end;nil
end

problem_09.first.should == 31875000