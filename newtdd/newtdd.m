%Input: x, y vectors; n the number of points
%Output: coefficients of interpolating polymonial in nested form
function c=newtdd(x,y,n)
for j=1:n
    v(j,1)=y(j); %fill in y column of newton trangle
end
for i=2:n
    for j=1:n+1-i
        v(j,i)=(v(j+1,i-1)-v(j,i-1))/(x(j+i-1)-x(j));
    end
end
for i=1:n
    c(i)=v(1,i);
end

