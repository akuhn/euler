require_relative 'euler'

# The Fibonacci sequence is defined by the recurrence relation:
# Fn = Fn1 + Fn2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:
# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.
# What is the first term in the Fibonacci sequence to contain 1000 digits?

Ary = Array.new(10000)

Ary[1] = 1
Ary[2] = 1

(3...Ary.length).each { |n| Ary[n] = Ary[n-1] + Ary[n-2] } 
    
def Ary.first_to_contain_n_digits(len)
  (0...Ary.length).to_a.zip(self).detect{|i,n|n.to_s.size == len}.first
end
    
Ary.first_to_contain_n_digits(3).should == 12
Ary.first_to_contain_n_digits(1000).should == 4782
