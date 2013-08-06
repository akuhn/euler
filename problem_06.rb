require_relative 'euler'

# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

"""(a+b+..)^2 = a^2 + 2a(b+...) + (b+...)^2 thus the diff is:"""

(1..10).sum { |x| 2 * x * (x - 1).triangle }.should == 2640
(1..100).sum { |x| 2 * x * (x - 1).triangle }.should == 25164150

