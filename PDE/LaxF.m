% lax friedrichs scheme
function u = LaxF(h,k,a,x,f,T)
	Nk = T/k;
	Nx = length(x);
	s = a*k/h;
	e = ones(Nx,1);
	o = zeros(Nx,1);
	A = spdiags([0.5*(1+s)*e o  0.5*(1-s)*e],-1:1,Nx,Nx);
	u = f;
	for kk=1:Nk
	   u=A*u;
	end