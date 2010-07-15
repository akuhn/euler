require 'puzzle'

Words = `cat /usr/share/dict/words`.to_a.collect{|each|each.upcase.chomp}.uniq
Ransom = """

     B?C? O? DAR?
    ?O?R? ?TUD?? E
   EA?? O? ??? LO?BY
   ?HE? Y?? R?Q??R?
    ??W ?N? ??EFU?
      ?IR?C?I?N

""".gsub('?','.').scan(/\S+/)

words = Ransom.collect do |r|
  p ws=Words.grep(Regexp.new("^#{r}$")).collect(&:downcase)
  [r,ws]
end  
words.each{|r,ws|puts "#{r}\t#{ws.size}" }

__END__

Ransom = """
T..E
TO
.IN.
.I...
.OCATE
A
DES.
I.
S..
.I.ER
.EAR
T.E
.A..ER.
A.D
...
.NDIA.
RESTAURANT""".scan(/\S+/)



class Array
  def histogram
    h = Hash.new{|h,k|h[k]=0}
    self.each{|ea| h[ea] = h[ea] + 1}
    h.collect{|ea,count|[count,ea]}.sort_by{|count,ea|count}
  end
end

puts """
17 ? 7 6 
17 14 
2 19 12 ?
10 19 ? 7 11
? 14 18 5 17 6
5
8 6 15 K
19 ?
15 ? ?
7 19 ? 6 4
? 6 5 4
17 ? 6
1 5 21 ? 6 4 11
5 ? 8
? 16 ?
? 12 8 19 5 ?
R 6 15 T 5 9 4 A 12 17
""".
#.scan(/\S+/).histogram.reverse.each{|count,ea|
#  p "#{count}x #{ea}"}
gsub(/15/,'S').
gsub(/19/,'I').
gsub(/17/,'T').
gsub(/16/,'H').
gsub(/12/,'N').
gsub(/14/,'O').
gsub(/18/,'C').


gsub(/\b8\b/,'D').
gsub(/\b6\b/,'E').
gsub(/\b4\b/,'R').
gsub(/\b5\b/,'A').
gsub(/\b7\b/,'M').
gsub(/\b9\b/,'U').

gsub(/\d+|\?/,'.').
gsub(/ /,'').
yourself