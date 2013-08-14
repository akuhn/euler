require_relative 'euler'

# Prime summations

Memo = {}

def prime_summations(n,max=n)
  return 1 if n == 0
  Memo.memoize(n,max) do 
    Primes.upto([n,max].min).sum{|k|prime_summations(n-k,k)}
  end
end

prime_summations(10).should == 5

(1...Infinity).find{|n|prime_summations(n) > 5000}.should == 71
