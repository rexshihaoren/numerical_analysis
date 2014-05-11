% Conjugate Gradient Method to solve Ax=b
% Input: A, b, tol tolerance
% Output: r1, residual inf norm; xk calculated x
function [r1,xk] = cgm(A,b,tol)
[R,C] = size(A);
n = C;
x = {};
r = {};
d = {};
r1 = [];
x{1} = zeros(n,1);
r{1} = b - A*x{1};
d{1} = r{1};
r1(1) = norm(r{1}, inf);
for k = 1: n+1
	rk = r{k};
	dk = d{k};
	xk = x{k};
	r1k = r1(k);
	if r1k < tol
		break;
	else
		alpha = rk'*rk/(dk'*A*dk);
		x{k+1} = xk + alpha*dk;
		r{k+1} = rk - alpha*A*dk;
		r1(k+1) = norm(r{k+1}, inf);
		beta = r{k+1}'*r{k+1}/(rk'*rk);
		d{k+1} = r{k+1} + beta*dk;
	end
end


