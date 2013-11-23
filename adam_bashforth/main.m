% This program use Adams-Bashforth 4 step method of finding numerical solutions of ODEs. Write a program which, for a given function f(t,y) and for a solution g(t) of the ODE y′ = f(t,y), will find approximate numerical solutions of that ODE on the interval (0, 1), with initial condition y(0) = g(0).
clear all
format long e;

% Specify interval (0,1)

a=0;
b=1;

% Ask you how many steps you want to use.

n=input('How many steps do you want to use? (Powers of 2 between 8 and 512 preferred)');
% Apply your program to each of the following ODE’s, trying out different numbers of steps

f1= {@(t,y) 4*(y-8*t/y), @(t) (8*t+1)^(1/2)};
f2= {@(t,y) 2.8*t*y^2, @(t) (0.7*(1-2*t.^2)).^-1};
f3= {@(t,y) 40*(sin(t)-y)+cos(t), @(t) exp(-40*t)+sin(t)};
f4= {@(t,y) 10*y.^(4/5), @(t) 32*(t-0.5).^5};
f5= {@(t,y) abs(1-2*t)*y,@(t) exp(abs(t-1/2)*(t-1/2))};

%Specify which funtions to test
frray=f3;
f= frray{1};
g= frray{2};

% For the four starting values your program should use the global fourth order Runge-Kutta method
rk=rk4(f,a,b,g(0),n);
for i=1:4
	v1(i)=rk(i);
end
% Then use the Adams-Bashforth 4-step method. Your program should be arranged so that the Adams-Bashforth part does only one function evaluation of f per step.
w=ab4(f,a,b,v1,n);
%The main output of your program should be a list of the errors and a plot of the errors, i.e. of the difference between g and the computed values of y at the points t where y is computed
h=(b-a)/n;
for i=1:n+1
	t(i)=a+(i-1)*h;
	truesolution(i)=g(t(i));
	r(i)=abs(truesolution(i)-w(i));
end
r
steps = linspace(1,n+1,n+1);
plot(steps,r);
title('Error plot')
xlabel('steps')
ylabel('error')
%You should also have your program ask you if you also want a simultaneous plot of y and g themselves to give you a better idea of what is going on, using a command like plot(t, g, t, y)
simul=input('Do youwant a simultaneous plot of y and g? Y/N:','s');
if simul == 'Y'
	% subplot(2,1,1)
	% plot(steps, real(truesolution),steps, real(w))
	% subplot(2,1,2)
	% plot(steps, imag(truesolution), steps, imag(w))
	plot(steps,truesolution,steps,w);
	title('simultaneous plot of y and g')
	xlabel('steps')
	ylabel('y and g')

else
	break;
end

