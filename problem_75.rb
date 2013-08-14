require_relative 'euler'

# It turns out that 12 cm is the smallest length of wire that can be bent to
# form an integer sided right angle triangle in exactly one way, but there
# are many more examples.
# 
# 12 cm: (3,4,5)
# 24 cm: (6,8,10)
# 30 cm: (5,12,13)
# 36 cm: (9,12,15)
# 40 cm: (8,15,17)
# 48 cm: (12,16,20)
# 
# In contrast, some lengths of wire, like 20 cm, cannot be bent to form an
# integer sided right angle triangle, and other lengths allow more than one
# solution to be found; for example, using 120 cm it is possible to form
# exactly three different integer sided right angle triangles.
# 
# 120 cm: (30,40,50), (20,48,52), (24,45,51)
# 
# Given that L is the length of the wire, for how many values of L <= 1,500,000
# can exactly one integer sided right angle triangle be formed?

count = Hash.new(0)
limit = 1_500_000

for m in 2...Infinity
  break if 2*m*(m+1) > limit
  for n in 1...m
    # Eucild's formula produces all primitive Pythagorean triples if n and m
    # are coprime and one of them is even. And thus, multiplied by k, all.
    next unless n.gcd(m) == 1 && (n.even? or m.even?)
    a = m*m - n*n
    b = 2*m*n
    c = m*m + n*n
    length = a+b+c
    for i in (length..limit).step(length)
      count[i] += 1
    end
  end
end

count.values.count(1).should == 161667