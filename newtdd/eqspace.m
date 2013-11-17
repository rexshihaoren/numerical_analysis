%Input: f is the function we try to interpolate; n is the number of points
%we use.
%Output: eoutput is the output when we eval 100 equispaced points in [-1,1]
%including the end points, with this interpolating polymonial.
%Use eqspace_points.m to calculate the n points. Use newtdd.m to calculate
%the coefficients; Use nest.m to eval interpolating polymonial at 100 points.
function eoutput=eqspace(f,n)
[x,y]=eqspace_points(f,n);
c=newtdd(x,y,n);
newx=linspace(-1,1,100);
eoutput=nest(n-1,c,newx,x);
end




