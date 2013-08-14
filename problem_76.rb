require_relative 'euler'

# Counting summations

def counting_summations(n,max=(n-1))
  return 1 if n == 0
  Memoize(n,max) do 
    (1..[n,max].min).sum{|k|counting_summations(n-k,k)}
  end
end

counting_summations(5).should == 6
counting_summations(8).should == 21
counting_summations(100).should == 190569291

__END__

5: => 3+2+1 => 6
  1 1 1 1 1
  2 1 1 1
  2 2 1
  
  3 1 1
  3 2
  
  4 1
  
  5
     
8: 5+5+5+3+2+1 => 21
  1 1 1 * 1 1 1 *
  2 1 1 1 1 1 1
  2 2 1 1 1 1 
  2 2 2 1 1 
  2 2 2 2
  
  3 1 1 1 1 1
  3 2 1 1 1
  3 2 2 1 
  3 3 1 1
  3 3 2
  
  4 1 1 1 1 
  4 2 1 1 
  4 2 2 
  4 3 1
  4 4 
  
  5 1 1 1
  5 2 1 
  5 3
  
  6 1 1
  6 2
  
  7 1 
