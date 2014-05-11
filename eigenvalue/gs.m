% Gram Schimit
function [Q,R] = gs(A)
[m,n] = size(A);
Q = zeros(m,m);
R = zeros(m,n);
R(1,1) = norm(A(:,1),2);
Q(:,1) = A(:,1)/R(1,1);
for j = 1:n
	y = A(:,j);
	for i = 1:j-1
		R(i,j) = Q(:,i)'*A(:,j);
		y = y - R(i,j)*Q(:,i);
	end
	R(j,j) = norm(y,2);
	Q(:,j) = y/R(j,j);
end
end