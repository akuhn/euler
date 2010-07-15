require 'euler'

# Problem 39
# 14 March 2003
# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.
# {20,48,52}, {24,45,51}, {30,40,50}
# For which value of p < 1000, is the number of solutions maximised?

class Numeric
  def triangles
    (1..self).each do |a|
      (a..self-a).each do |b|
        c = self - a - b
        break if c < b
        yield [a,b,c] if a*a+b*b == c*c
      end
    end
  end
  def num_triangles
    n=0;triangles{n+=1};n
  end
end

120.num_triangles.should == 3
(1...1000).detect_max(&:num_triangles).should == 840