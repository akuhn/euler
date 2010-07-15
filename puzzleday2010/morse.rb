require 'set'
Words = Set.new(`cat /usr/share/dict/words`.to_a.collect{|each|each.upcase.chomp}.uniq)
Words << "U.S."
Morse = """
A .-            N -.
B -...          O ---
C -.-.          P .--.
D -..           Q --.-
E .             R .-.
F ..-.          S ...
G --.           T -
H ....          U ..-
I ..            V ...-
J .---          W .--
K -.-           X -..-
L .-..          Y -.--
M --            Z --..
1 .----         6 -....
2 ..---         7 --...
3 ...--         8 ---..
4 ....-         9 ----.
5 .....         0 -----
. .-.-.-
""".scan(/(.) ([-.]+)/)
ToMorse = Hash[*Morse.flatten]
FromMorse = Hash[*(Morse.collect{|a,b|[b,a]}.flatten)]

class String
  def to_morse
    return ToMorse.fetch(self.upcase){return ""} if self.size == 1
    self.split(//).collect{|e|e.to_morse}.join
  end
  def from_morse str=""
    return str if self.empty?
    x = (1..self.size).collect do |n|
      code = self[0...n]
      [letter = FromMorse[code],
      rest = self[n..self.size]]
    end
    x = x.reject{|letter,rest|letter.nil?}
    x = x.collect{|a,b|b.from_morse(str+a.downcase)}
    x.flatten.sort_by{|each|each.size}
  end
  def magic n=0,word=""
    return word if n == self.size
    length = self[n..n].to_i
    letters = ToMorse.select{|l,m|m.size==length}.collect{|l,m|l}
    letters = letters.collect do |each|
      self.magic(n+1,word+each)
    end
    letters.flatten
  end
end

Puzzle = "141 22412133 34 23331 4331 323 4332 22 1423 3636 31211"

Puzzle.scan(/\d+/).collect{|number|
  p number.magic.select{|each|Words.include? each}.sort
}

__END__
["EFT", "ELT", "EVE", "EYE", "THE", "TYE", "TYT"]
["INCENTOR", "INVENTOR", "MALENESS", "NICENESS"]
["OF", "OH", "OX", "SH", "UP", "WY"]
["ADORE", "ADRUE", "ADUST", "AGOGE", "AGUST", "ARGOT", "ARGUE", "AROSE", "ARUKE", "AWOKE", "IDOSE", "ISSUE", "MOOSE", "MOOST", "MORSE", "MOUSE", "MOWSE", "MUDDE", "MURRE", "MURUT", "NOOSE", "NORSE", "NUDGE", "NURSE"]
["BODE", "BOKE", "BOOT", "BORE", "BORT", "BOSE", "BOUT", "BROT", "BRUT", "BURE", "BURT", "BUST", "CODE", "COKE", "COOT", "CORE", "COST", "COUE", "CUKE", "CURE", "CURT", "FOOT", "FORE", "FORT", "FROE", "FROT", "FUSE", "FUST", "HOOT", "HOSE", "HOST", "HOWE", "HUGE", "HUKE", "HURE", "HURT", "HUSE", "JOKE", "JUDE", "JUKE", "JURE", "JUST", "LODE", "LOGE", "LOKE", "LOOT", "LORE", "LOSE", "LOST", "LOUT", "LUGE", "LUKE", "LURE", "LUST", "POKE", "POOT", "PORE", "PORT", "POSE", "POST", "POUT", "PRUE", "PRUT", "PUKE", "PURE", "QUOT", "YOKE", "YORE", "YOWT", "YURT"]
["DAD", "DAG", "DAK", "DAO", "DAR", "DAS", "DAW", "DID", "DIG", "DIS", "GAD", "GAG", "GAR", "GAS", "GAU", "GAW", "GID", "GIG", "GIO", "GNU", "KAW", "OAK", "OAR", "ONS", "RAD", "RAG", "RAS", "RAW", "RID", "RIG", "RIO", "SAD", "SAG", "SAK", "SAO", "SAR", "SAW", "SIG", "SIR", "SIS", "UMU", "WAD", "WAG", "WAR", "WAS", "WAW", "WID", "WIG", "WIR", "WIS"]
["BOGA", "BOOM", "BOON", "BORA", "BORN", "BOSN", "BOUN", "BUDA", "BUGI", "BURI", "BURN", "CODA", "COOM", "COON", "CORA", "CORM", "CORN", "CROM", "CRUM", "CUON", "CURN", "FORA", "FORM", "FOUN", "FROM", "HOGA", "HOON", "HORA", "HORN", "HURA", "JOOM", "JUGA", "JURA", "LOKA", "LOOM", "LOON", "LORA", "LORI", "LORN", "LOWA", "LOWN", "LURA", "LURI", "POOA", "POON", "PROA", "PUKA", "XOSA", "YOGA", "YOGI", "YUGA", "YUKI", "ZOOM", "ZOON"]
["AA", "AI", "AM", "AN", "IN", "MA", "MI", "NA", "NI"]
["ECAD", "EFIK", "EYAS", "THAR", "THAW", "THIG", "THIO", "THIR", "THIS", "TYND"]
["U.S."]
["GENET", "OTATE", "RENET", "STATE", "STITE"]