%Adam Bashforth 4 step Method
%Inputs: function f=y'(t,y), interval a b, four initial conditions array v1=(y1,y2,y3,y4), number of steps n
%Output: approximation of the solution of ODE, vector w 
function w=ab4(f, a, b, v1, n)
h=(b-a)/n;
for j=1:4
	w(j)=v1(j);
	t(j)=a+(j-1)*h;
end
for i=4:n
	w(i+1)=w(i)+h*(55*f(t(i),w(i))-59*f(t(i-1),w(i-1))+37*f(t(i-2),w(i-2))-9*f(t(i-3),w(i-3)))/24;
	t(i+1)=t(i)+h;
end
end