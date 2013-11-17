%This program interpolates functions with either chebyshev polynomial or
%Newton's Form. User should provide info about the number of points they
%want to use. The defualt input interval is [-1,1]. Then we use chosen
%methods to interpolates 100 equispaced points in [-1,1], and compare them
%with the real function

format long e;
%asking user how many points they want to use to iterpolate
n=input('What is the number of points you want to use to iterpolate?');
%asking user whether to use equispace points or chebyshev points
methods=input('How do you want to choose your interpolation points? (for equispace points enter 0, for checyshev points enter 1)');
%initialize f
f=@cfunc;
%choose different vector based on n and methods
if (methods == 0)
    %equispace methods
    y2=eqspace(f,n);
elseif (methods ==1)
    %chebyshev
    y2=chebyshev(f,n);
else 
    error('enter 0 or 1');
end
x=linspace(-1,1,100);
%eval f
y1=f(x);
%graph together the function and its interpolating polynomial at the
%100points
%plot(x,y1,x,y2);
subplot(121), plot(x,y1);
subplot(122), plot(x,y2);
%plot(x,y1,x,y2);