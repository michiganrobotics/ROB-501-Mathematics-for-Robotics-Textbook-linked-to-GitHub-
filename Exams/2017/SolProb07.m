
syms a b c d

A=[a, b; c, d]
 
y1=[ 1 1 ; 0 1]

y2=[1 -1; 0 0]

y3=[ 0 1; 1 2]

trace(A.'*y1)

trace(A.'*y2)

trace(A.'*y3)
 