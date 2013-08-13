require_relative 'euler'

# Consider the fraction, n/d, where n and d are positive integers. If n < d
# and HCF(n,d)=1, it is called a reduced proper fraction.
# 
# If we list the set of reduced proper fractions for d  8 in ascending 
# order of size, we get:
# 
# 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 
# 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
# 
# It can be seen that there are 21 elements in this set.
#
# How many elements would be contained in the set of reduced proper 
# fractions for d <= 1,000,000?

def smallest_prime_factors(max)
  arr = Array.new(max+1)
  for n in 2...arr.count
    next if arr[n] # n.prime?
    for i in (n...arr.count).step(n)
      arr[i] = n unless arr[i]
    end
  end
  arr
end

smallest_prime_factors(7).should == [nil, nil, 2, 3, 2, 5, 2, 7]

$factors = smallest_prime_factors(1_000_000)

def prime_factors(n)
  factors = []
  while n > 1
    factors << $factors[n]
    n = n / $factors[n]
  end
  return factors
end

def totient(n)
  primes = prime_factors(n).uniq
  count = n
  for p in primes
    count = count * (p-1) / p 
  end
  count
end

(2..1_000_000).sum{|n|totient(n)}.should == 303963552391

__END__
