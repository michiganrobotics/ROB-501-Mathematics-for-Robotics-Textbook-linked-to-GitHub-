function [xstar,count]=NewtonRaphson(F,x,x0)
%
Jac=jacobian(F,x);Jac=simplify(Jac);
xnew=x0;
epsilon=1;
err=1;
count=0;
while err>1e-8
    xold=xnew;
    for k = 1:length(x0)
        Kay=num2str(k);
        eval(['x',Kay,'=xold(k);'])
    end
    J=vpa(subs(Jac),10);
    Fval=vpa(subs(F),10);
    xnew=xold-epsilon*inv(J)*Fval;
    err=norm(xold-xnew);
    count=count+1;
    if count > 1e3, break, end
end

xstar=xnew;

end

