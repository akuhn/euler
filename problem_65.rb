require_relative 'euler'
require 'mathn'

def continued_fraction
  return enum_for(:continued_fraction) unless block_given?
  yield 2; for k in 1...Infinity; yield 1; yield 2*k; yield 1; end
end

continued_fraction.take(10).should == [2,1,2,1,1,4,1,1,6,1]

def nth_convergent(n)
  arr = continued_fraction.take(n).drop(1)
  e = 0; for a in arr.reverse; e = 1 / (a + e); end
  return 2 + e
end

nth_convergent(1).should == 2
nth_convergent(2).should == 3
nth_convergent(3).should == 8/3
nth_convergent(4).should == 11/4
nth_convergent(5).should == 19/7
nth_convergent(6).should == 87/32
nth_convergent(7).should == 106/39
nth_convergent(8).should == 193/71
nth_convergent(9).should == 1264/465
nth_convergent(10).should == 1457/536

nth_convergent(100).numerator.digit_sum.should == 272

