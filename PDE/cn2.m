function [x, t, w, ws] = cn2(D, H, K, g, h, uinit)
	s = D* K/H^2;
	m = floor(1/H);
	m = m-1;
	x = (1:m)*H;
	w = zeros(m);
	w = uinit(x)';
	nsteps = 99;
	tau = (1:nsteps)*K;
	t =tau/D;
	ws = zeros(nsteps, 1);
	e = ones(m,1);
	A = spdiags([-s*e (1+2*s)*e -s*e], -1:1, m, m)
	for j = 1: nsteps
		w = A*w;
		ws(j) = w((1-H)/H);
	end
end