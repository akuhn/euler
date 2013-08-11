require_relative 'euler'

# By starting at the top of the triangle below and moving to adjacent numbers 
# on the row below, the maximum total from top to bottom is 23.
# 
# 3
# 7 4
# 2 4 6
# 8 5 9 3
# 
# That is, 3 + 7 + 4 + 9 = 23.
# 
# Find the maximum total from top to bottom in triangle.txt (right click and
# 'Save Link/Target As...'), a 15K text file containing a triangle with one-
# hundred rows.

data = File.read('triangle.txt')

$triangle = data.each_line.collect{|line|line.split.map(&:to_i)}.reject(&:empty?)
$triangle.each_cons(2){|p,q|[0,*p,0].each_cons(2).with_index{|ab,i|q[i]+=ab.max}}

$triangle.last.max.should == 7273
