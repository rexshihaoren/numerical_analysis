% Crank Nicolson + BabyWave
function u = CN_BabyWave(h,k,a,x,f,T)
	Nk = T/k;
	Nx = length(x);
	s = a*k/h;
	e = ones(Nx,1);
	A = spdiags([-0.25*s*e e   0.25*s*e],-1:1,Nx,Nx);
	B = spdiags([  0.25*s*e e -0.25*s*e],-1:1,Nx,Nx);
	u = f;
	% figure
	% set(gcf,'Color','w')
	% Animation
	for kk=1:Nk
	   u=A\(B*u);
	   % plot(x,u,'LineWidth',2)
	   % axis([-10 20 0 .5])
	   % drawnow
	end