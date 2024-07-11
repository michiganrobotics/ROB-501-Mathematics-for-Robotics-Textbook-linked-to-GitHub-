function [xstar,F,count]=NewtonRaphsonLineSearch(x0)
%

xnew=x0;
epsilon=[1e-3,1e-2,0.1,0.3,0.5,1];
err=1;
count=0;
while err>1e-12
    xold=xnew;
    [F,JacF]=FunJacob(xold);
    if 1
        Delx= -JacF\F;
    else
        Delx= -transpose(JacF)*F;
    end
        
    for k=1:length(epsilon)
        [y,~]=FunJacob(xold+epsilon(k)*Delx);
        LineSearch(k)=norm(y);
    end
    [Y,I] = min(LineSearch);
    err=Y(1)
    xnew=xold+epsilon(I(1))*Delx;
    count=count+1;
    epsilon(I(1))
    if count > 1e3, break, end
end

xstar=xnew;
[F,JacF]=FunJacob(xstar);

end

function [F,JacF]=FunJacob(x)

x1=x(1);x2=x(2);x3=x(3);x4=x(4);
y=[x1;x2];
F= [3;4]+[1 2; 3 4]*y - transpose(y)*[1 4;
    4 10]*y;
F=[F;sin(x3)^(7)+0.5*cos(x1); x4^3-2*sin(x1)*x2*x2];

JacF=[ 1.0 - 8.0*x2 - 2.0*x1, 2.0 - 20.0*x2 - 8.0*x1,                     0,        0; ...
    3.0 - 8.0*x2 - 2.0*x1, 4.0 - 20.0*x2 - 8.0*x1,                     0,        0 ; ...
    -0.5*sin(x1),                      0, 7.0*cos(x3)*sin(x3)^6,        0; ...
    -2.0*x2^2*cos(x1),        -4.0*x2*sin(x1),                     0, 3.0*x4^2];
end

