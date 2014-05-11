% Rayleigh Quotient
function [lam,x]=rqi(A)
[R,C] = size(A);
x = zeros(R,1);
x(1) = 1;
lam0 = -inf;
lam = 2;
while abs(lam-lam0) > 10^-4
	lam0 = lam;
	u=x/norm(x);              
	lam=u'*A*u;
	x=(A-lam*eye(size(A)))\u;
x=x/norm(x);
lam=x'*A*x;
end