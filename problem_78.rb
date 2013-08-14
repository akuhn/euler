require_relative 'euler'

def pentagonal(k)
  k*(3*k-1)/2
end

Memo = [1]
$mod = 1_000_000

def partitions(n)
  return 0 if n < 0
  Memo.memoize(n) do
    sum,sign = 0,1
    for k in 1...Infinity
      break if n < pentagonal(k)
      sum += sign * partitions(n - pentagonal(k))
      sum += sign * partitions(n - pentagonal(-k))
      sum = sum % $mod
      sign = -sign
    end
    sum
  end
end

partitions(5).should == 7
partitions(6).should == 11
partitions(7).should == 15
partitions(8).should == 22

(1...Infinity).find{|n|partitions(n) % $mod == 0}.should == 55374

__END__
Uses Euler's pentagonal number theorem, taken from wikipedia.
