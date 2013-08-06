require_relative 'euler'

# Problem 50
# 15 August 2003
# The prime 41, can be written as the sum of six consecutive primes:
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
# Which prime, below one-million, can be written as the sum of the most consecutive primes?

P = Primes.upto(1.million).to_a

sum=0;$upper=P.collect{|p|sum+=p}.select{|n|n<1.million}.size

def problem_50
  $upper.downto(1) do |len|
    P.each_cons(len) do |cons|
      sum = cons.sum
      break if sum > 1.million
      return sum if sum.prime?
    end
  end
end

problem_50.should == 997651

