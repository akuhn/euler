require_relative 'euler'

f,num = 0,0
for d in 8..1_000_000
  n = d * 3 / 7
  f0 = n/d.to_f
  f,num = f0,n if n.gcd(d) == 1 && f0 > f
end
num.should == 428570