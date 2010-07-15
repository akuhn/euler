#require 'puzzle'

class Braille < String
  @@hash = Hash[*("""
  	20	000000
  	21	011101
  	22	000010
  	23	001111
  	24	110101
  	25	100101
  	26	111101
  	27	001000
  	28	111011
  	29	011111
  	2A	100001
  	2B	001101
  	2C	000001
  	2D	001001
  	2E	000101
  	2F	001100
  	30	001011
  	31	010000
  	32	011000
  	33	010010
  	34	010011
  	35	010001
  	36	011010
  	37	011011
  	38	011001
  	39	001010
  	3A	100011
  	3B	000011
  	3C	110001
  	3D	111111
  	3E	001110
  	3F	100111
  	40	000100
  	41	100000
  	42	110000
  	43	100100
  	44	100110
  	45	100010
  	46	110100
  	47	110110
  	48	110010
  	49	010100
  	4A	010110
  	4B	101000
  	4C	111000
  	4D	101100
  	4E	101110
  	4F	101010
  	50	111100
  	51	111110
  	52	111010
  	53	011100
  	54	011110
  	55	101001
  	56	111001
  	57	010111
  	58	101101
  	59	101111
  	5A	101011
  	5B	010101
  	5C	110011
  	5D	110111
  	5E	000110
  	5F	000111
  """.scan(/\w+/).collect{|a,b|[a.to_i(16),b]})]
  def self.from_ascii code
    @@hash[]
  end
end

if __FILE__ == $0
  loop do
    break if DATA.eof? 
    DATA.readline == "|-\n"
    char = DATA.readline[/\w+/]
    DATA.readline
    dots = "000000"
    DATA.readline.scan(/\d/).each{|dot|
      dots[dot.to_i-1] = "1"}
    DATA.readline
    DATA.readline
    puts "\t#{char}\t#{dots}"
  end
end


# http://en.wikipedia.org/w/index.php?title=Braille_ASCII&action=edit&section=3
__END__
|-
|20
|[[Space (punctuation)|(space)]]
|
!style="font-size:25pt"|⠀
|(space)
|-
|21
|[[Exclamation mark|!]]
|2-3-4-6
!style="font-size:25pt"|⠮
|the
|-
|22
|[[Quotation mark|"]]
|5
!style="font-size:25pt"|⠐
|(contraction)
|-
|23
|[[Number sign|#]]
|3-4-5-6
!style="font-size:25pt"|⠼
|(number prefix)
|-
|24
|[[Dollar sign|$]]
|1-2-4-6
!style="font-size:25pt"|⠫
|ed
|-
|25
|[[Percent sign|%]]
|1-4-6
!style="font-size:25pt"|⠩
|sh
|-
|26
|[[Ampersand|&]]
|1-2-3-4-6
!style="font-size:25pt"|⠯
|and
|-
|27
|[[Apostrophe|']]
|3
!style="font-size:25pt"|⠄
|'
|-
|28
|[[Bracket|(]]
|1-2-3-5-6
!style="font-size:25pt"|⠷
|of
|-
|29
|[[Bracket|)]]
|2-3-4-5-6
!style="font-size:25pt"|⠾
|with
|-
|2A
|[[Asterisk|*]]
|1-6
!style="font-size:25pt"|⠡
|ch
|-
|2B
|[[Plus sign|+]]
|3-4-6
!style="font-size:25pt"|⠬
|ing
|-
|2C
|[[Comma (punctuation)|,]]
|6
!style="font-size:25pt"|⠠
|(uppercase prefix)
|-
|2D
|[[Hyphen|-]]
|3-6
!style="font-size:25pt"|⠤
|<nowiki>-</nowiki>
|-
|2E
|[[Full stop|.]]
|4-6
!style="font-size:25pt"|⠨
|(italic prefix)
|-
|2F
|[[Slash (punctuation)|/]]
|3-4
!style="font-size:25pt"|⠌
|st
|-
|30
|0
|3-5-6
!style="font-size:25pt"|⠴
|"
|-
|31
|1
|2
!style="font-size:25pt"|⠂
|,
|-
|32
|2
|2-3
!style="font-size:25pt"|⠆
|;
|-
|33
|3
|2-5
!style="font-size:25pt"|⠒
|:
|-
|34
|4
|2-5-6
!style="font-size:25pt"|⠲
|.
|-
|35
|5
|2-6
!style="font-size:25pt"|⠢
|en
|-
|36
|6
|2-3-5
!style="font-size:25pt"|⠖
|!
|-
|37
|7
|2-3-5-6
!style="font-size:25pt"|⠶
|( or )
|-
|38
|8
|2-3-6
!style="font-size:25pt"|⠦
|" or ?
|-
|39
|9
|3-5
!style="font-size:25pt"|⠔
|in
|-
|3A
|[[Colon (punctuation)|:]]
|1-5-6
!style="font-size:25pt"|⠱
|wh
|-
|3B
|[[Semicolon|;]]
|5-6
!style="font-size:25pt"|⠰
|(letter prefix)
|-
|3C
|[[Less-than sign|<]]
|1-2-6
!style="font-size:25pt"|⠣
|gh
|-
|3D
|[[Equals sign|=]]
|1-2-3-4-5-6
!style="font-size:25pt"|⠿
|for
|-
|3E
|[[Greater-than sign|>]]
|3-4-5
!style="font-size:25pt"|⠜
|ar
|-
|3F
|[[Question mark|?]]
|1-4-5-6
!style="font-size:25pt"|⠹
|th
|-
|40
|[[@]]
|4
!style="font-size:25pt"|⠈
|(accent prefix)
|-
|41
|A
|1
!style="font-size:25pt"|⠁
|a
|-
|42
|B
|1-2
!style="font-size:25pt"|⠃
|b
|-
|43
|C
|1-4
!style="font-size:25pt"|⠉
|c
|-
|44
|D
|1-4-5
!style="font-size:25pt"|⠙
|d
|-
|45
|E
|1-5
!style="font-size:25pt"|⠑
|e
|-
|46
|F
|1-2-4
!style="font-size:25pt"|⠋
|f
|-
|47
|G
|1-2-4-5
!style="font-size:25pt"|⠛
|g
|-
|48
|H
|1-2-5
!style="font-size:25pt"|⠓
|h
|-
|49
|I
|2-4
!style="font-size:25pt"|⠊
|i
|-
|4A
|J
|2-4-5
!style="font-size:25pt"|⠚
|j
|-
|4B
|K
|1-3
!style="font-size:25pt"|⠅
|k
|-
|4C
|L
|1-2-3
!style="font-size:25pt"|⠇
|l
|-
|4D
|M
|1-3-4
!style="font-size:25pt"|⠍
|m
|-
|4E
|N
|1-3-4-5
!style="font-size:25pt"|⠝
|n
|-
|4F
|O
|1-3-5
!style="font-size:25pt"|⠕
|o
|-
|50
|P
|1-2-3-4
!style="font-size:25pt"|⠏
|p
|-
|51
|Q
|1-2-3-4-5
!style="font-size:25pt"|⠟
|q
|-
|52
|R
|1-2-3-5
!style="font-size:25pt"|⠗
|r
|-
|53
|S
|2-3-4
!style="font-size:25pt"|⠎
|s
|-
|54
|T
|2-3-4-5
!style="font-size:25pt"|⠞
|t
|-
|55
|U
|1-3-6
!style="font-size:25pt"|⠥
|u
|-
|56
|V
|1-2-3-6
!style="font-size:25pt"|⠧
|v
|-
|57
|W
|2-4-5-6
!style="font-size:25pt"|⠺
|w
|-
|58
|X
|1-3-4-6
!style="font-size:25pt"|⠭
|x
|-
|59
|Y
|1-3-4-5-6
!style="font-size:25pt"|⠽
|y
|-
|5A
|Z
|1-3-5-6
!style="font-size:25pt"|⠵
|z
|-
|5B
|[[Bracket|<nowiki>[</nowiki>]]
|2-4-6
!style="font-size:25pt"|⠪
|ow
|-
|5C
|[[Backslash|\]]
|1-2-5-6
!style="font-size:25pt"|⠳
|ou
|-
|5D
|[[Bracket|<nowiki>]</nowiki>]]
|1-2-4-5-6
!style="font-size:25pt"|⠻
|er
|-
|5E
|[[Caret|^]]
|4-5
!style="font-size:25pt"|⠘
|(contraction)
|-
|5F
|[[Underscore|_]]
|4-5-6
!style="font-size:25pt"|⠸
|(contraction)