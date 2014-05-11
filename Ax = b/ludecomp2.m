%LU Decomposition with backwards substitution
function [L,U,x] = ludecomp2(a,b)
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
		b(i) = b(i)-mult*b(j);
		L0(i,j)= -mult;
		L(i,j) = mult;
	end
end
U = L0* a0;

%backwards substitution
for i = n : -1 : 1
	for j = i+1 : n
		b(i) = b(i) - a(i,j)*x(j);
	end
	x(i) = b(i)/a(i,i);
end