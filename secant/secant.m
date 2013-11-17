function[x,y,err,iter]=secant(f,p0,p1,xtol,ytol,maxit)
% Input:
% - f is the object function whose roots you will want
% - p0 and p1 are the initial approximations to a root
% - xtol: the program ends if the change in x is less than xtol
% - ytol: the program ends if the function value is closer to 0 than ytol
% - maxit is the maximum number of iterations permitted
% Output:
% - x is the vector of successive approximations to a root
% - y is the vector of function values at the approximations to a root
% - err is the difference between the last two approximations
% - iter is the number of iterations actually made
c(1)= p0;
c(2)= p1;
if f(p0)==0
    x=p0;
    y=0;
    err=0;
    iter=0;
elseif f(p1)==0
    x=p1;
    y=0;
    err=0;
    iter=0;
else
    for i=1:maxit
        c(i+2)=c(i+1)-f(c(i+1))*(c(i+1)- c(i))/(f(c(i+1))-f(c(i)));
        if abs(c(i+2)-c(i))<xtol
            disply('the change in x is less than xtol');
            break;
        end
        if abs(f(c(i+1)))< abs(ytol)
            display('the function value is closer to 0 than ytol')
            break
        end
        y=f(c(i+2));
        x=c(i+2);
        err=abs(c(i+2)-c(i));
        iter=i;

    end
end