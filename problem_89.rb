require_relative 'euler'

# Roman numerals

Roman = Hash[%w{
  I    1 
  IV   4  V    5 
  IX   9  X   10
  XL  40  L   50
  XC  90  C  100
  CD 400  D  500
  CM 900  M 1000
}
  .each_slice(2)
  .map{|a,b|[a,b.to_i]}
  .reverse]

class String
  def parse
    arr = self.each_char.map(&Roman)
    [*arr,0].each_cons(2).sum{|a,b| a < b ? -a : a } 
  end
end

class Integer
  def to_roman
    n,str = self,""
    while n > 0
      for each,value in Roman
        if n >= value
          str << each
          n -= value
          break
        end
      end
    end
    str
  end
end

49.to_roman.should == "XLIX"
"IL".parse.should == 49
"XLIX".parse.should == 49
"XXXXIIIIIIIII".parse.should == 49

File.read('roman.txt').split.sum do |line|
  line.size - line.parse.to_roman.size
end.should == 743