require_relative 'euler'

# Starting in the top left corner of a 2x2 grid, there are 6 routes (without backtracking) to the bottom right corner.
# How many routes are there through a 20x20 grid?

((4*3)/(2*1)).should == 6
((21*22*23*24*25*26*27*28*29*30*31*32*33*34*35*36*37*38*39*40)/(1*2*3*4*5*6*7*8*9*10*11*12*13*14*15*16*17*18*19*20)).should == 137846528820
