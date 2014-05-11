% Gauss-Siedel method
% Input: A, b, tol tolerance
% Outputs: rg: residual inf norm; calculated x
function [rg, x] = gsm(A,b,tol)
n = length(b);
d = diag(diag(A));
u = triu(A,1);
l = tril(A,-1);
x = zeros(n,1);
rg = [];
for j = 1:n
	rg(j) = norm(b-A*x, inf);
	if rg(j) < tol
		break;21`1qi
	else
		b1 = b - u*x;
		A1 = (l+d);
		x = A1\b1;
		% for i = 1:n
		% 	x(i) = (b1(i)-l(i,:)*x) /d(i,i);
		% end
	end
end