%Forward Finite Difference Method
function [x, u] = ffd(uinit, h, sig, x0,x1, u0,u1)
	x = h:h:1-h;
	k = sig*h^2;
	n = (x1-x0)/h;
	% Calculating u(x,0) for x0 < x < x1
	for i =1:n-1
		u(i,1) = uinit(x0+i*h);
	end
	j = 1;
	A = trid(sig,1-2*sig, sig, n-1);
	s = zeros(n-1,1);
	s(1)=sig*u0;
	s(n-1)= sig*u1;
	u(:,j+1) = A* u(:,j) + s;
	j = j+1;
	while norm(u(n-1,j) - u(n-1,j-1),2) > 10^-4
		u(:,j+1) = A* u(:,j) + s;
		j = j+1;
	end
end


