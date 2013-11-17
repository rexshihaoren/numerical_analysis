%determine equispaced points with n in the interval [-1,1]
function [x,y]=eqspace_points(f,n)
x=linspace(-1,1,n);
y=f(x);
end

