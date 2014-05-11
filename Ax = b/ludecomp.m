%LU Decomposition
function [L,U] = ludecomp(a)
a0 = a;
[R,C] = size(a);
n = R;
L0 = eye(n);
L = eye(n);
%elimination
for j=1 : n-1
	if abs(a(j,j)) < eps
		error('zero pivot encountered');
	end
	for i = j+1 : n
		mult = a(i,j)/a(j,j);
		for k = j+1:n
			a(i,k) = a(i,k) - mult*a(j,k);
		end
		L0(i,j)= -mult;
		L(i,j) = mult;
	end
end
U = L0* a0;
end