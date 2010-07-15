require 'euler'

# Problem 31
# 22 November 2002
# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:
# 1£1 + 150p + 220p + 15p + 12p + 31p
# How many different ways can £2 be made using any number of coins?

class Array
  def combs(sum,i=0)
    return sum == 0 ? 1 : 0 if i >= size
    cnt=0;0.step(sum,self[i]){|n|cnt+=combs(sum-n,i+1)};cnt
  end
end

[1,2,5,10,20,50,100,200].combs(200).should == 73682

