require 'euler'

# Problem 49
# 01 August 2003
# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
# What 12-digit number do you form by concatenating the three terms in this sequence?

class Array
  def find_arithmetic_sequences # broken!
    return enum_for(:find_arithmetic_sequences) unless block_given?
    3.upto(self.size) do |len|
      each_cons(len) do |cons|
        yield cons.join if cons.enum_cons(2).collect{|a,b|b-a}.uniq.size == 1
      end
    end
  end  
end

Primes.upto(9999).
  reject{|n|n<1000}.
  group_by{|n|n.digits.sort.join}. 
  values.
  collect{|s|s.find_arithmetic_sequences.to_a}.
  flatten.
  should == ["296962999629"]
  
# I'm lucky its a consequtive sequence, or else I won't have found it!