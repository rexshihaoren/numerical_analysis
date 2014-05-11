function [x, t, w, ws] = cn3(D, H, K, g, h, ux0)
	s = D* K/H^2;
	m = 11/H
	x = (1:m)*H
	w = zeros(m);
	w = exp(x.^2)';
	nsteps = 1000;
	tau = (1:nsteps)*K;
	t =tau/D*3600;
	ws = zeros(nsteps, 1)
	e = ones(m,1);
	A = spdiags([-s*e 2*s*e -s*e], -1:1, m, m) + 2* speye(m);
	A(m, m-1:m) = [-2*s, 2*(1+s)];
	B = spdiags([s*e -2*s*e s*e], -1:1, m, m) + 2* speye(m);
	B(m, m-1:m) = [2*s, 2*(1-s)];
	b = zeros(m,1);
	b(1)=s*(g + g);
	b(m)= s*2*H*(h+h);
	for j = 1: nsteps
		w = A\(B*w + b);
		ws(j) = w(10/H);
	end
end
