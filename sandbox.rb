require 'enumerator'

class F
  def m
    return enum_for(:m) unless block_given?
    yield 1;yield 2;yield 3
  end
end

f = F.new

f.m do |n|
  p n
end

p f.m.to_a