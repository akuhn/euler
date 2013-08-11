require_relative 'euler'

class Integer
  def sqrt_as_continued_fraction
    arr = []
    state = []
    sqrt = Math.sqrt(self)
  
    # (i*sqrt+r)/(j*sqrt+q)
  
    i,r = 1,0
    j,q = 0,1
  
    loop do
  
      raise if not i == 1
      raise if not j == 0

      return [arr,[]] if q == 0

      arr << ((i*sqrt+r)/q).to_i
      r -= arr.last * q

      raise if not r < 0

      state << (s = [q,r].join)
      i = state.count - state.index(s)
      return [arr.shift(arr.count-i+1),arr] if i > 1

      i,j=j,i
      r,q=q,r

      raise if not i == 0
      raise if not j == 1
      raise if not q < 0

      # (sqrt-q)(sqrt+q) = n - q*q

      i = r
      r = r * -q
      j = 0
      q = self - q*q

      raise if not q % i == 0

      q = q/i
      j = j/i
      r = r/i
      i = 1
    
    end
  end
end

def nth_convergent(a0,period,n)
  arr = period.cycle.take(n)
  f = 0; for a in arr.reverse; f = Rational(1,(a+f)); end
  return a0 + f
end

def solve_diophantine_eq(d)
  a,period = d.sqrt_as_continued_fraction
  return 0 if period.empty?
  raise unless a.size == 1
  for n in 1...Infinity
    f = nth_convergent(a.first,period,n)
    y = f.denominator
    x = f.numerator
    return x if x*x == d*y*y+1
  end
end

solve_diophantine_eq(2).should == 3
solve_diophantine_eq(3).should == 2
solve_diophantine_eq(4).should == 0
solve_diophantine_eq(5).should == 9
solve_diophantine_eq(6).should == 5
solve_diophantine_eq(7).should == 8

(2..7).max_by{|n|solve_diophantine_eq(n)}.should == 5

(2..1000).max_by{|n|solve_diophantine_eq(n)}.should == 661



