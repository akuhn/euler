require 'enumerator'

class Object
  def should
    Shoulda.new self
  end
  def pp
    p self; self
  end
  def yourself
    self
  end
end

class Shoulda
  def initialize(value)
    @value = value
  end
  def ==(expected)
    raise "Expected #{expected.inspect} but found #{@value.inspect} (using ==)." unless @value == expected
  end
  def =~(expected)
    raise "Expected #{expected.inspect} but found #{@value.inspect} (using =~)." unless @value =~ expected
  end
end

class Array
  def binary_search(elem)
    min, max = 0, size-1
    loop do
      mid = (min + max) / 2
      elem < self[mid] ? max = mid-1 : min = mid+1
      break if max < min
    end
    self[max] == elem ? max : -(max+2)
  end
  def binary_search?(elem)
    binary_search(elem) >= 0
  end
  def permutation!(num)
    (2..length).collect do |n|
      num,r=num.divmod(n);r
    end.reverse.
    each_with_index do |f,i|
      insert(i,delete_at(i+f))
    end;self
  end
  def permutation(num) 
    dup.permutation! num
  end
  def permutations
    return enum_for(:permutations) unless block_given?
    (0...self.size.factorial).each { |n| yield permutation(n) }
  end
end

class Symbol
  def to_proc
    Proc.new { |obj,*args| obj.send(self,*args) }
  end
end

class String
  def bytes
    bs=[];each_byte{|b|bs<<b};bs
  end
end

class NilClass
  def call(each)
    each
  end
end

module Enumerable
  def sum#{|each|}
    return sum(&:yourself) unless block_given?
    inject(0) { |sum,each| sum + yield(each) }
  end
  def prod#{|each|}
    return prod(&:yourself) unless block_given?
    inject(1) { |prod,each| prod * yield(each) }
  end
  def to_bag#{|each|}
    bag = {}; self.each { |elem| bag[elem] = bag.fetch(elem,0)+1 }; bag
  end
  def detect_max#{|each|}
    collect{|e|[e,(yield e)]}.max{|a,b|a.last<=>b.last}.first
  end
  def cross(enum)#{|a,b|}
    return enum_for(:cross,enum) unless block_given?
    each{|a|enum.each{|b|yield a,b}}
  end
  def group_by#{|each|}
    return enum_for(:group_by) unless block_given?
    gs={};each{|e|gs.fetch(yield(e)){|k|gs[k]=[]}<<e};gs
  end
  def take(num)
    ary=[];each{|e|return ary if (ary<<e).size == num}
  end
end

class Numeric
  def self.non_negatives
    return Numeric.enum_for(:non_negatives) unless block_given?
    n=-1;loop{yield n+=1}
  end
  def self.positives
    return Numeric.enum_for(:positives) unless block_given?
    n=0;loop{yield n+=1}
  end
  def self.odd_numbers
    return Numeric.enum_for(:odd_numbers) unless block_given?
    n=-1;loop{yield n+=2}
  end
  def even?
    self%2==0
  end
  def odd?
    self%2==1
  end
  def million
    self * 1000 * 1000
  end
  def triangle
    self.succ * self / 2
  end
  def factorial
    f = 1; 2.upto(self){|n|f*=n}; f
  end
  def digit_sum
    sum=0;to_s.each_byte{|b|sum+=b-?0};sum
  end
  def digits
    ary=[];to_s.each_byte{|b|ary<<b-?0};ary
  end
  def fraction
    self - self.floor
  end
  def square
    self*self
  end
  def square?
    (self**0.5).fraction.zero?
  end
end

class Primes
  include Enumerable
  def initialize(limit)
    @primes = Primes.__fetch(@limit = limit)
  end
  def self.upto(num,&block)
    block ? self.new(num).each(&block) : self.new(num)
  end
  def each#block
    @primes.each{|p|break if p > @limit;yield p} 
  end
  @@cache = [1]
  def self.__fetch(limit)
    return @@cache if limit <= @@cache.last
    @@cache = sieve_of_eratostenes(limit)
  end
  def self.sieve_of_eratostenes(max_value)
    sieve = Array.new(max_value/2) { |n| 3+n+n }
    for n in 0...sieve.size do
      next unless p = sieve[n]
      (n+p).step(sieve.size,p) { |m| sieve[m] = nil }
    end
    [2] + sieve.compact
  end
  def self.[](pos)
    raise unless pos < @@cache.size
    @@cache[pos-1] 
  end
end

class Numeric
  def enum_prime_factors
    num = self;
    Primes.upto((self**0.5).ceil) do |f|
      loop do
        div, mod = num.divmod f 
        break unless mod == 0
        yield f
        return if (num = div) == 1
      end
    end
    yield num
  end
  def prime_factors
    fs = []; enum_prime_factors{|f|fs<<f}; fs
  end
  def prime?
    return false if self < 2
    !Primes.upto((self**0.5).ceil).detect{ |p| self%p == 0 }
  end
end

if __FILE__ == $0
  
  Primes.upto(43).to_a.should ==
  [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43]
  Primes.upto(10_000).all?(&:prime?).should == true
  ((1..10_000).to_a-Primes.upto(10_000).to_a).any?(&:prime?).should == false
  
  # Numeric#prime_factors
  48.prime_factors.should == [2,2,2,2,3]
  49.prime_factors.should == [7,7]
  50.prime_factors.should == [2,5,5]
  36242707.prime_factors.should == [36242707]
  1000.prime_factors.should == [2,2,2,5,5,5]
  6789.prime_factors.should == [3, 31, 73]
  
  # Array#binary_search
  [1,4,9,16,25].binary_search(1).should == 0
  [1,4,9,16,25].binary_search(4).should == 1
  [1,4,9,16,25].binary_search(9).should == 2
  [1,4,9,16,25].binary_search(16).should == 3
  [1,4,9,16,25].binary_search(25).should == 4
  [1,4,9,16,25,36,49,64].binary_search(16).should == 3
  [1,4,9,16,25,36,49,64].binary_search(15).should == -4
  [1,4,9,16,25,36,49,64].binary_search(0).should == -1
  [1,4,9,16,25,36,49,64].binary_search(65).should == -9
  
  # Numeric#digits
  12345.digits.should == [1,2,3,4,5]
  
  # Array#permutations
  [1,2,3,4].permutations.to_a.size.should == 4.factorial
  [1,2,3,4].permutations.sort_by{|p|p.join.to_i}.should == [1,2,3,4].permutations.to_a
  [1,2,3,4].permutations.collect{|p|p.sort}.uniq.size.should == 1
  
  # Enumerable#sum
  [1,2,3,4].sum.should == 10
  [1,2,3,4].sum(&:square).should == 30

  # Enumerable#prod
  [1,2,3,4].prod.should == 24
  [1,2,3,4].prod(&:square).should == 576
  
  # Enumerable#take
  Numeric.positives.take(4).should == [1,2,3,4]
  
end

