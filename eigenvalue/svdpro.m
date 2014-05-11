% SVD Method
function [U,S,V] = svdpro(A)
[m,n] = size(A);
B = [zeros(n,m) A'
	A zeros(m,n)];
% eigenvects and eigenvals of B
[VB, lamB]=workhorse(B);
for i=1:n
	lam(i) = lamB(2*i)^2;
	Va(1:n, i) = VB(1:n,2*i);
	% Gram-Schmit to get eigenvects of A
	[V,R] = gs(Va);
end

S = zeros(size(A));
U = zeros(size(A));
for i = 1:m
	S(i,i) = sqrt(lam(i));
	U(1:n,i) = A*V(1:n,i)/S(i,i);
end