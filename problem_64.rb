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

2.sqrt_as_continued_fraction.should == [[1],[2]]
3.sqrt_as_continued_fraction.should == [[1],[1,2]]
4.sqrt_as_continued_fraction.should == [[2],[]]
5.sqrt_as_continued_fraction.should == [[2],[4]]
6.sqrt_as_continued_fraction.should == [[2],[2,4]]
7.sqrt_as_continued_fraction.should == [[2],[1,1,1,4]]
8.sqrt_as_continued_fraction.should == [[2],[1,4]]
9.sqrt_as_continued_fraction.should == [[3],[]]
10.sqrt_as_continued_fraction.should == [[3],[6]]
11.sqrt_as_continued_fraction.should == [[3],[3,6]]
12.sqrt_as_continued_fraction.should == [[3],[2,6]]
13.sqrt_as_continued_fraction.should == [[3],[1,1,1,1,6]]

23.sqrt_as_continued_fraction.should == [[4],[1,3,1,8]]

def odd_period_sqrt_count(n)
  (1..n).collect(&:sqrt_as_continued_fraction).count{|a,period|period.size.odd?}
end

odd_period_sqrt_count(13).should == 4
odd_period_sqrt_count(10_000).should == 1322