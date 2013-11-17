%determine chebyshev points with n in the interval [-1,1]
function [x,y]=chebyshev_points(f,n)
x=zeros(1,n);
for k=1:n
    x(k)=cos((2*k-1)*pi/(2*n));
end
y=f(x);
end



