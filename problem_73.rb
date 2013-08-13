require_relative 'euler'

count = 0
for d in 5..12000
  for n in d/3...d/2
    count += 1 if n.gcd(d) == 1
  end
end
count.should == 7295372