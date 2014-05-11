%generage a tridiagonal matrix
function A = trid(a,b,c,n)
	A = eye(n)*b;
	for i =1:n-1
		A(i+1,i) = a;
		A(i,i+1) = c;
	end
end
