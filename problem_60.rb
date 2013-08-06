require_relative 'euler'

# Problem 60
# 02 January 2004
# The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and concatenating them in any order the result will always be prime. For example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792, represents the lowest sum for a set of four primes with this property.
# Find the lowest sum for a set of five primes for which any two primes concatenate to produce another prime.

raise 'No yet solved'

class Numeric
  def uncat
    return enum_for(:uncat) unless block_given?
    s = self.to_s
    (1..s.size-1).each do |n|
      b = s[n..-1]
      next if b[0] == ?0
      yield [s[0...n].to_i,b.to_i]
    end
  end
end

109673.uncat.to_a.should == [[10967,3],[1096,73],[109,673],[10,9673]].reverse

class Node < Hash
  attr_accessor :key
  def initialize(key)
    @key = key
  end
  def << node
    self[node.key] = node 
  end
  def remove_undirectional_edges
    self.reject! { |n| not n.include? self.key }
  end
  def edge? node
    @edges.include? node
  end
end

class Graph < Hash
  def chain(*keys)
    keys.collect{|k|fetch(k){self[k]=Node.new(k)}}.
      each_cons(2){|a,b|a << b}
  end
  def remove_undirectional_edges
    self.values.each(:remove_undirectional_edges)
  end
  def fully_connected_components
  end
end

G = Graph.new
Primes.upto(1.million/100).each do |p|
  p.uncat.each do |a,b|
    G.chain(a,b) if a.prime? && b.prime?
  end
end
p 'here'
G.reject_unidirectional_edges
p 'gggg'
p G.fully_connected_components.sort_by{|fcc|fcc.size}