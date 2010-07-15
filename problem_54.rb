require 'euler'

# Problem 54
# 10 October 2003
# In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:
# High Card: Highest value card.
# One Pair: Two cards of the same value.
# Two Pairs: Two different pairs.
# Three of a Kind: Three cards of the same value.
# Straight: All cards are consecutive values.
# Flush: All cards of the same suit.
# Full House: Three of a kind and a pair.
# Four of a Kind: Four cards of the same value.
# Straight Flush: All cards are consecutive values of same suit.
# Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
# The cards are valued in the order:
# 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.
# If two players have the same ranked hands then the rank made up of the highest value wins; for example, a pair of eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players have a pair of queens, then highest cards in each hand are compared (see example 4 below); if the highest cards tie then the next highest cards are compared, and so on.
# Consider the following five hands dealt to two players:
# The file, poker.txt, contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.
# How many hands does Player 1 win?

class String
  def rank
    case self[0]
    when ?A then 14
    when ?K then 13
    when ?Q then 12
    when ?J then 11
    when ?T then 10
    when ?2..?9 then self[0] - ?0
    else raise Error
    end
  end
  def suit
    self[-1]
  end
end

class Array
  def to_hand
    Hand.new(self)
  end
end

class Hand
  def initialize(cards)
    @flush = (cards.collect{|str|str[-1]}.uniq.size == 1)
    @ranks = cards.collect(&:rank).sort.reverse
    @groups = @ranks.group_by{|n|n}.values.sort_by{|x|-x.size}
  end
  def one_pair?
    return nil unless @groups.first.size == 2
    @groups.first.first
  end
  def two_pairs?
    return nil unless @groups[0].size == 2 && @groups[1].size == 2
    [@groups[0].first,@groups[1].first].max
  end
  def three_ofa_kind?
    return nil unless @groups[0].size == 3
    @groups[0].first
  end
  def straight?
    return nil unless @ranks.enum_cons(2).all?{|a,b|a==b+1}
    @ranks.first
  end
  def flush?
    return nil unless @flush
    @ranks.first
  end
  def full_house?
    return nil unless @groups[0].size == 3 && @groups[1].size == 2
    @ranks.first
  end
  def four_ofa_kind?
    return nil unless @groups.first.size == 4
    @groups.first.first
  end
  def straight_flush?
    straight? and flush? 
  end
  def result
    x = nil
    return 900 + x if x = straight_flush?
    return 800 + x if x = four_ofa_kind?
    return 700 + x if x = full_house?
    return 600 + x if x = flush?
    return 500 + x if x = straight?
    return 400 + x if x = three_ofa_kind?
    return 300 + x if x = two_pairs?
    return 200 + x if x = one_pair?
    100 + @ranks.first
  end
  def full_result
    @ranks.inject(result){|sum,r|sum*100+r}
  end
end

%w{2A 3A 4A 5A 6A}.to_hand.result.should == 906
%w{5A 5B 5C 5D 6A}.to_hand.result.should == 805
%w{6A 6B 5C 5D 5A}.to_hand.result.should == 706
%w{5A 5B 5C 4D 4A}.to_hand.result.should == 705
%w{2A 4A 6A 8A 9A}.to_hand.result.should == 609
%w{2A 3B 4C 5D 6A}.to_hand.result.should == 506
%w{2A 2B 2C 7D 6A}.to_hand.result.should == 402
%w{6A 6B 6C 7D 2A}.to_hand.result.should == 406
%w{5H 5C 6S 6S KD}.to_hand.result.should == 306
%w{5H 5C 2S 2S KD}.to_hand.result.should == 305
%w{5H 5C 6S 7S KD}.to_hand.result.should == 205

%w{5D 8C 9S JS AC}.to_hand.full_result.should == 1_14_1411090805

(%w{5H 5C 6S 7S KD}.to_hand.full_result > %w{2C 3S 8S 8D TD}.to_hand.full_result).should == false
(%w{5D 8C 9S JS AC}.to_hand.full_result > %w{2C 5C 7D 8S QH}.to_hand.full_result).should == true
(%w{2D 9C AS AH AC}.to_hand.full_result > %w{3D 6D 7D TD QD}.to_hand.full_result).should == false
(%w{4D 6S 9H QH QC}.to_hand.full_result > %w{3D 6D 7H QD QS}.to_hand.full_result).should == true
(%w{2H 2D 4C 4D 4S}.to_hand.full_result > %w{3C 3D 3S 9S 9D}.to_hand.full_result).should == false

Games = `cat poker.txt`.collect do |line|
  line.split.enum_slice(5).collect{|ary|ary.to_hand}
end

Games.select{ |a,b| a.full_result > b.full_result }.size.should == 376