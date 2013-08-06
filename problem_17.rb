require_relative 'euler'

# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

class Numeric
  def to_english
    case self
    when 1..20
      %w{zero one two three four five six seven eight nine ten
          eleven twelve thirteen fourteen fifteen sixteen seventeen
          eighteen nineteen twenty}[self]
    when 20..99
      teen,num = self.divmod 10
      "#{%w{NA NA twenty thirty forty fifty sixty seventy
          eighty ninety}[teen]}#{'-'+num.to_english if num != 0}"
    when 100..999
      hundred,num = self.divmod 100
      "#{hundred.to_english} hundred#{' and '+num.to_english if num != 0}"
    else
      "one thousand"
    end
  end
end

(1..5).collect{|n|n.to_english.scan(/[a-z]/).size}.sum.should == 19
342.to_english.scan(/[a-z]/).size.should == 23
115.to_english.scan(/[a-z]/).size.should == 20
1000.to_english.should == 'one thousand'
(1..1000).collect{|n|n.to_english.scan(/[a-z]/).size}.sum.should == 21124

