% LeapFrog Scheme
function w = LeapFrog(h,c,T)
	k = h/c;
	x = (h:h:1-h)';
	Nk = T/k +1;
	Nx = length(x);
	s = c*k/h;
	e = ones(Nx,1);
	A = spdiags([s^2*e 2*(1-s^2)*e  s^2*e],-1:1,Nx,Nx);
	w = zeros(Nx, Nk);
	w(:,1) = .5*A*zeros(Nx,1);

	w(:,2) = .5*A*w(:,1) + k * 2*pi*sin(pi*x);

	for kk=3:Nk
	   w(:,kk) = A*w(:,kk-1) - w(:,kk-2);
	end