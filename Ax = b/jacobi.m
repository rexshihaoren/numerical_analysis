%jacobi method
function [rj,x] = jacobi(a,b,tol)
n=length(b);
d=diag(a);
r=a-diag(d);      
x=zeros(n,1);     
rj = [];
for j=1:n
	rj(j) = norm(b-a*x,inf);
	if rj(j) < tol
		break;
	else
		x=(b-r*x)./d;
	end
end               