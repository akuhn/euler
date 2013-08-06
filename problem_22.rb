require_relative 'euler'

# Problem 22
# 19 July 2002
# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938  53 = 49714.
# What is the total of all the name scores in the file?

class String 
  def alphabetical_value
    val = 0; self.each_byte{|b|val+=(b-?A.ord+1)}; val
  end
end

`cat names.txt`.scan(/\w+/).sort[937].alphabetical_value.should == 53

sum=0;`cat names.txt`.scan(/\w+/).sort.each_with_index{|name,index|sum+=name.alphabetical_value*(index+1)};sum.should == 871198282