require_relative 'euler'

def cubic_permutations(k)
  memo = Hash.new{|h,k|h[k]=[]}
  for n in 0...Infinity
    cube = n ** 3
    cubes = memo[cube.digits.sort.join] << cube
    return cubes.min if cubes.count == k
  end
  nil
end

cubic_permutations(5).should == 127035954683