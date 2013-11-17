%Input: deg of polynomial d;
%       array of d+1 coefficients c
%       x-coordinate x at which to evalute, and
%       array of base points b, if needed
%Output: value y of polymonial at x
function y=nest(d,c,x,b)
if nargin<4
    b=zeros(d,1);
end
y=c(d+1);
for i=d:-1:1
    y=y.*(x-b(i))+c(i);
end