
rng('default')
N=5
A=rand(N,N);
A=A/det(A)

latex = mat2LatexArrayMatrix(A,'3.5f')

[U,Sigma,V]=svd(A);


latex = mat2LatexArrayMatrix(Sigma,'3.5f')


B=U*Sigma*V';
norm(B-A)

d=diag(Sigma);
d(end)=0;
D=diag(d);
B=U*D*V';
E=A-B;
max(sqrt(eig(E'*E)))

latex = mat2LatexArrayMatrix(E,'3.5f')

[U,Sigma,V]=svd(A-E);
diag(S)

latex = mat2LatexArrayMatrix(E,'3.5f')

latex = mat2LatexArrayMatrix(Sigma,'3.5f')

