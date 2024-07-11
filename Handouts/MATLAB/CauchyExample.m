

n=10;
A=randn(n,n);
b=rand(n,1);
x0=rand(n,1);

M=A'*A;
c=eig(M);
c=max(c)
%alpha=.5/c;
alpha=1.85/c;
%%
K=20
x=x0;
ATb=A'*b;
for k=1:K
    x'
    x=x-alpha*(M*x-ATb);    
end

disp('P(x)-x=')
-alpha*(M*x-A'*b)

disp('Ax-b=')
A*x-b

disp('|\lamba_max(I-alpha*A^\top A)=')
abs(max(eig(eye(n)-alpha*A'*A)))
