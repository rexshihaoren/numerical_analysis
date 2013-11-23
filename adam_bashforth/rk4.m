%Runge Kutta Method of order 4
%Input f=y'(t,y), interval a b, initial condition y1, number of steps n
%Output vector w
function w=rk4(f, a, b, y1, n)
h=(b-a)/n;
w(1)= y1;
t(1)=a;
for i=1:n
    s1=f(t(i), w(i));
    s2=f(t(i)+h/2, w(i)+h*s1/2);
    s3=f(t(i)+h/2, w(i)+h*s2/2);
    s4=f(t(i)+h, w(i)+h*s3);
    t(i+1)=t(i)+h;
    w(i+1)=w(i)+h*(s1+2*s2+2*s3+s4)/6;
end

