require 'enumerator'
require 'rspec'

class Object
  def pp
    p self; self
  end
  def yourself
    self
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
end

class String
  def bytes
    bs=[];each_byte{|b|bs<<b};bs
  end
end

class Hash
  def to_proc
    method(:[]).to_proc
  end
  def memoize(*args) # block
    fetch(args) { self[args] = yield }
  end
end

class Array
  def to_proc
    method(:[]).to_proc
  end
  def memoize(index) # block
    self[index] ||= yield
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
  alias :freq :to_bag
  def detect_max#{|each|}
    collect{|e|[e,(yield e)]}.max{|a,b|a.last<=>b.last}.first
  end
  def cross(enum)#{|a,b|}
    return enum_for(:cross,enum) unless block_given?
    each{|a|enum.each{|b|yield [a,b]}}
  end
  def group_by#{|each|}
    return enum_for(:group_by) unless block_given?
    gs={};each{|e|gs.fetch(yield(e)){|k|gs[k]=[]}<<e};gs
  end
  def skip(n)
    Enumerator.new do |y|
      each_with_index do |each,i|
        y << each if not i < n
      end
    end
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
    to_s.each_byte.inject(0){|sum,b|sum+=b-48}
  end
  def digits
    to_s.each_byte.collect{|b|b-48}
  end
  def fraction
    self - self.floor
  end
  def square
    self*self
  end
  def square?
    Math.sqrt(self).fraction.zero?
  end
  def sqrt
    Math.sqrt(self)
  end
end

class Primes < Array
  def factorize(n)
    raise if n > last * last
    return [] if n < 2
    factors = []
    self.each do |prime|
      while (div,mod = n.divmod prime; mod == 0)
        factors << prime
        n = div
      end
      break if div < prime
    end
    factors << n if n > 1
    return factors
  end
  class <<self
    def upto(limit)
      return [] if limit < 2 
      sieve_of_eratostenes(limit+1).freeze
    end
    def cache
      @cache ||= upto(1_000_000)
    end
    def member?(n)
      return false if n < 2
      pseudo do |p|
        q,r = n.divmod p
        return true if q < p
        return false if r == 0
      end
    end
    def pseudo
      yield 2; yield 3; yield n = 5
      loop { yield n += 2; yield n += 4 }
    end
    private
    def sieve_of_eratostenes(upper)
      sieve = Primes.new(upper/2){|n|1+2*n}
      for n in 1...sieve.size do
        next unless p = sieve[n]
        sieve[n] = nil while (n+=p) < sieve.size
      end
      sieve[0] = 2
      sieve.compact!
      sieve
    end
  end
end

class Integer
  def prime?
    Primes.member? self
  end
  def prime_factors
    Primes.cache.factorize(self)
  end
  def relative_primes
    arr = [*1..self]
    self.prime_factors.uniq.each do |p|
      i = 0
      arr[i+=p] = nil while i < self
    end 
    return arr.compact
  end
end

Infinity = Float::INFINITY

if __FILE__ == $0
  
  Primes.upto(1).should == []
  Primes.upto(2).should == [2]  
  Primes.upto(43).should == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43]
  
  prime = Primes.upto(1000)
  
  for n in 0..1000 do
    n.prime?.should == prime.include?(n)
  end
  
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
  12345.digit_sum.should == 15
  
  # Array#permutations
  [1,2,3,4].permutation.to_a.size.should == 4.factorial
  [1,2,3,4].permutation.sort_by{|p|p.join.to_i}.should == [1,2,3,4].permutation.to_a
  [1,2,3,4].permutation.collect{|p|p.sort}.uniq.size.should == 1
  
  # Enumerable#sum
  [1,2,3,4].sum.should == 10
  [1,2,3,4].sum(&:square).should == 30

  # Enumerable#prod
  [1,2,3,4].prod.should == 24
  [1,2,3,4].prod(&:square).should == 576
  
  # Enumerable#take
  Numeric.positives.take(4).should == [1,2,3,4]
  
end

