require '../euler'
require 'braille'

class Array
  def from_int_to_string
    self.collect{|int|(int+64).chr}.join
  end
end

[1,2,3].from_int_to_string.should == "ABC"

123.digit_sum.should == 6