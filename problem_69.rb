require_relative 'euler'

# Euler's Totient function, phi(n) [sometimes called the phi function], is 
# used to determine the number of numbers less than n which are relatively 
# prime to n. For example, as 1, 2, 4, 5, 7, and 8, are all less than nine
# and relatively prime to nine, phi(9)=6.
#
# n Relatively Prime	phi(n)	n/phi(n)
# 2	1	1	2
# 3	1,2	2	1.5
# 4	1,3	2	2
# 5	1,2,3,4	4	1.25
# 6	1,5	2	3
# 7	1,2,3,4,5,6	6	1.1666...
# 8	1,3,5,7	4	2
# 9	1,2,4,5,7,8	6	1.5
# 10	1,3,7,9	4	2.5
#
# It can be seen that n=6 produces a maximum n/phi(n) for n =< 10.
# 
# Find the value of n =< 1,000,000 for which n/phi(n) is a maximum.

prod=1;Primes.upto(100).take_while{|p|(prod*=p)<1_000_000}.prod.should == 510510

# Assuming that the number with the most small prime factors has the best
# n/phi as it will have the most smaller numbers with a common divider and
# thus the least relatively prime numbers and thus the biggest n / phi(n)