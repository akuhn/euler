require 'puzzle'
require 'set'

Words = Set.new((
  ws=`cat /usr/share/dict/words`.to_a.collect{|w|w.upcase.chomp};
  ws+ws.collect{|w|"#{w}S"}).uniq)
  
Words.include?("FLAWS").should == true

n = 0;
Elements = %w{
  H                                   He
  Li Be                  B  C  N O F  Ne
  Na Mg                  Al Si P S Cl Ar
  K Ca Sc Ti V Cr Mn Fe }.
    collect(&:upcase).
    collect{|elem|[elem,Regexp.new("#{elem}"),n=n+1,]}
  
Puzzle = %w{
  FLAWS SANDBAG SHADE SNAIL CAPTION DEBATED
  REMNANTS STASIS PLIABLE FINALLY }

Puzzle << "CONCLUSION"

Puzzle.each do |puzz|
  puts puzz
  Elements.each do |_,r,a|
    next unless puzz =~ r
    Elements.each do |e,_,b|
      word = puzz.gsub(r,e)
      next if word == puzz
      puts "\t#{b-a}\t#{word}" if Words.include? word
    end
  end
end
  

