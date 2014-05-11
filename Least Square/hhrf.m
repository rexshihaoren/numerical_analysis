%HouseHolder Reflector
function [Q,R] = hhrf(A)
[m,n] = size(A);
w = zeros(m,1);
x = A(:,1);
w(1) = sign(x(1))* norm(x,2);
H = hr(x,w);
A = H*A;
Q = H;
for j = 2:n
	w = zeros(m-j+1,1);
	x = A(j:end,j);
	w(1) = -sign(A(j,j))* norm(x,2);
	H0 = hr(x,w);
	H = [eye(j-1,j-1) zeros(j-1,m-j+1)
		zeros(m-j+1,j-1) H0];
	A = H*A;
	Q = Q*H;
end
R = A;
