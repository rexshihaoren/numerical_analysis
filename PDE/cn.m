% Crank-Nicolson Scheme, with left Dirichlet, and right Neumann
% Input: D as in ut = Duxx
%       uinit = u(x, 0)
%		g = u(0,t)
%		h = ux(11, t)
% Output: x distance diff
%		t time diff
%		w(x) is the solution at the end (24 hrs) 
%		ws(t) is the soution at each time step at 
function [x, t, w, ws] = cn(D, H, K, g, h, uinit)
	s = D* K/H^2;
	m = floor(11/H);
	x = (1:m)*H;
	w = zeros(m);
	w = uinit(x)';
	nsteps = 1000;
	tau = (1:nsteps)*K;
	t =tau/D;
	ws = zeros(nsteps, 1);
	e = ones(m,1);
	A = spdiags([-s*e 2*s*e -s*e], -1:1, m, m) + 2* speye(m);
	A(m, m-1:m) = [-2*s, 2*(1+s)];
	B = spdiags([s*e -2*s*e s*e], -1:1, m, m) + 2* speye(m);
	B(m, m-1:m) = [2*s, 2*(1-s)];
	b = zeros(m,1);
	% we can do this only because g, h are constant
	b(1)=s*(g + g);
	b(m)= s*2*H*(h+h);
	for j = 1: nsteps
		w = A\(B*w + b);
		ws(j) = w(10/H);
	end
end
