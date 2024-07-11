%close all
noise=rand(1,12);
noise=2*(noise-0.5);
n=length(noise);
I=1:2:n;
delta=10;
noise(I)=delta*noise(I);

x=1:n;
y=1+2*x+noise;

figure(1)
plot(x,y,'*')
title('Odd Data Points are More Uncertain')

%Regression for y = a0 + a1 *x

Y=y'
A=[ones(n,1) x'];

%Un-weighted least squares

alpha=inv(A'*A)*A'*Y;
a0=alpha(1)
a1=alpha(2)

figure(2)
plot(x,y,'*'), hold on
title('Equal Weights')
xx=[1:.1:n];
plot(xx,a0+a1*xx,'r'), hold off

%Weighted least squares

M=ones(1,n);
M(I)=1/delta;
M=diag(M);
alphaW=inv(A'*M*A)*A'*M*Y;
a0W=alphaW(1)
a1W=alphaW(2)
figure(3)
plot(x,y,'*'), hold on
title('Higher Weight on Even Data Points')
xx=[1:.1:n];
plot(xx,a0W+a1W*xx,'r'), hold off


