require_relative 'euler'

# Problem 18
# 31 May 2002
# By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
# 3
# 7 4
# 2 4 6
# 8 5 9 3
# That is, 3 + 7 + 4 + 9 = 23.
# Find the maximum total from top to bottom of the triangle below:

Triangle = [
  %w{75},
  %w{95 64},
  %w{17 47 82},
  %w{18 35 87 10},
  %w{20 04 82 47 65},
  %w{19 01 23 75 03 34},
  %w{88 02 77 73 07 63 67},
  %w{99 65 04 28 06 16 70 92},
  %w{41 41 26 56 83 40 80 70 33},
  %w{41 48 72 33 47 32 37 16 94 29},
  %w{53 71 44 65 25 43 91 52 97 51 14},
  %w{70 11 33 28 77 73 17 78 39 68 17 57},
  %w{91 71 52 38 17 14 91 43 58 50 27 29 48},
  %w{63 66 04 68 89 53 67 30 73 16 69 87 40 31},
  %w{04 62 98 27 23 09 70 98 73 93 38 53 60 04 23}
].collect{|row|row.collect{|x|x.to_i}}

class Array
  def path(row,col) 
    return 0 if row >= self.size 
    self[row][col] + [path(row+1,col),path(row+1,col+1)].max
  end
end

[[3],[7,4],[2,4,6],[8,5,9,3]].path(0,0).should == 23
Triangle.path(0,0).should == 1074