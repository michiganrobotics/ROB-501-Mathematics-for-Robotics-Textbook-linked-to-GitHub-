

syms x1 x2 x3 x4

if 0
    x=[x1;x2];
    
    F= [3;4]+[1 2; 3 4]*x - transpose(x)*[1 4;
        4 10]*x;
    
    x0=[7;8]
    
elseif 0
    
     x=[x1;x2];
    
    F= [3;4]+[1 2; 3 4]*x - x*transpose(x)*[1;2]
    
    x0=0*[7;8]
    
else
    
    x=[x1;x2;x3;x4];
    y=[x1;x2];
    
    F= [3;4]+[1 2; 3 4]*y - transpose(y)*[1 4;
        4 10]*y;
    
    F=[F;sin(x3)^(7)+0.5*cos(x1); x4^3-2*sin(x1)*x2*x2];
  
    F
    %pause(5)
    
    x0=[7;8;9;10]
    
    
end
tic
[xstar,count]=NewtonRaphson(F,x,x0)
toc

for k = 1:length(x0)
    Kay=num2str(k);
    eval(['x',Kay,'=xstar(k);']);
end
subs(F)
