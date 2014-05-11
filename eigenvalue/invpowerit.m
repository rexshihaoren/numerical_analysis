% Inverse Power Iteration
function [lam,u]=invpowerit(A)
[R,C] = size(A);
x = zeros(R,1);
x(1) = 1;
lam0 = -inf;
lam = inf;
s = 2;
As=A-s*eye(R);
while abs(lam-lam0) > 10^-4
  lam0 = lam;
  u=x/norm(x); 
  x=As\u;      
  lam=u'*x;         
lam=1/lam+s;
end