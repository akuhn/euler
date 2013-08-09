require_relative 'euler'

# Problem 60
# 02 January 2004
# The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and concatenating them in any order the result will always be prime. For example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792, represents the lowest sum for a set of four primes with this property.
# Find the lowest sum for a set of five primes for which any two primes concatenate to produce another prime.

Cache = {}

def concatenating_primes?(a,b)
  b,a = a,b if a > b
  h = Cache.fetch(a){Cache[a]={}}
  h.fetch(b){h[b] = "#{a}#{b}".to_i.prime? && "#{b}#{a}".to_i.prime?}
end

def find_five_primes
  primes = Primes.upto(10_000)
  for a in primes
    for b in primes
      next if not concatenating_primes?(a,b) 
      for c in primes
        next if not concatenating_primes?(a,c) 
        next if not concatenating_primes?(b,c) 
        for d in primes
          next if not concatenating_primes?(a,d) 
          next if not concatenating_primes?(b,d) 
          next if not concatenating_primes?(c,d) 
          for e in primes
            next if not concatenating_primes?(a,e) 
            next if not concatenating_primes?(b,e) 
            next if not concatenating_primes?(c,e) 
            next if not concatenating_primes?(d,e) 
            return a+b+c+d+e
          end
        end
      end
    end
  end
  raise 
end

find_five_primes.should == 26033
