% Power Iteration
function [lam,u]=powerit(A)
[R,C] = size(A);
x = zeros(R,1);
x(1) = 1;
lam0 = 0;
lam = inf;
while abs(lam-lam0) > 10^-4
   lam0 = lam;
   u=x/norm(x); 
   x=A*u;            
   lam=u'*x; 
u = x/norm(x);
end