format long e
p0=input('Enter p0=');
p1=input('Enter p1=');
xtol= 1e-14;
ytol= 1e-12;
maxit= 50;
f=@s;
[x,y,err,iter]=secant(f,p0,p1,xtol,ytol,maxit);
fprintf('%8.5f %8.5f %8.5f %8.5f\n',[x,y,err,iter])