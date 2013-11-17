%This program experiment with the effectiveness of the Romberg method of
%intergration.
%Inputs: f a function, a,b an interval of integration (a<b), I the value of
%the integral of f over [a,b]

format long e;
%Use cell array to store information of functions
%info of integral a) to g)
fa={@(x) 4*(1+x.^2).^(-1), 0, 1, pi};
fb={@(x) 4*x.^2*exp(-x.^2), 0, 7, sqrt(pi)};
fc={@(x) 4*x.^2*exp(-x.^2), 0, 500, sqrt(pi)};
fd={@(x) (x*(4-x)).^(1/2), 0, 2, pi};
fe={@(x) (sin(64*x)).^2, 0, 2*pi, pi};
ff={@(x) (1-(sin(x)).^2/2).^(-1/2), 0, pi, 3.7081493546027};
fg={@(x) (1-(sin(x)).^2/2).^(-1/2), 0, 1, 1.0832167728452};

%select info cell array and specify inputs for romberg
frray=fg;
f=frray{1};
a=frray{2};
b=frray{3};
I=frray{4};

%eval when n<=10
[r,stop]=romberg(f,a,b,10);
n=stop;
%output two tables

%table1
%Output as a matrix
A=[];
for i=1:n
    if i==1
        newArow=[r(i,1), abs(I-r(i,1)), r(i,i), abs(I-r(i,i)), NaN];
        
    else
        newArow=[r(i,1), abs(I-r(i,1)), r(i,i), abs(I-r(i,i)), abs(r(i,i)-r(i,i-1))];
    end
    A=cat(1,A,newArow);
end
disp('          R_n1                    |I-R_n1|                        R_nn                    |I-R_(nn)|                  |R_nn-R_n(n-1)|')
disp(A)
%switch back to long e for calculation
%table2
nume=zeros(1,3);
deno=zeros(1,3);
div=zeros(1,3);

B=[];
for l=1:n
    for m=1:3
        try 
           nume(m)=r(l-1,m)-r(l-2,m);
           deno(m)=r(l,m)-r(l-1,m);
           div(m)=nume(m)./deno(m);
        catch
            div(m)=NaN;
        end
    end
    newBrow=[div(1),div(2),div(3)];
    B=cat(1,B,newBrow);
end
disp('                   div1                     div2                     div3')
disp(B)
%initial satisfaction = 0 aka not satisfied
satisfied=0;
%while loop until you are satisfied
while (satisfied~=1)
    n=n+1;
    satisfied=input('Are you satisfied for this result? if yes enter 1, else 0:');
    if (satisfied==1)
        break;
    elseif (satisfied~=0 && satisfied~=1)
        satisfied=input('Invalid input. Are you satisfied for this result? if yes enter 1, else 0:');
    else
        h=(b-a)/(2^(n-1));
        subtotal=0;
        for i=1:2^(n-2)
            subtotal=subtotal + f(a+(2*i-1)*h);
        end
        r(n,1)=r(n-1,1)/2+h*subtotal;
        for k=2:n
            r(n,k)=(4^(k-1)*r(n,k-1)-r(n-1,k-1))/(4^(k-1)-1);
        end
    end
    %output two tables
    %table1
    %Output as a matrix
    A=cat(1, A, [r(n,1), abs(I-r(n,1)), r(n,n), abs(I-r(n,n)), abs(r(n,n)-r(n,n-1))]);
    disp('          R_n1                    |I-R_n1|                        R_nn                    |I-R_(nn)|                  |R_nn-R_n(n-1)|')
    disp(A)
    %switch back to long e for calculation
    %table2
    nume=zeros(1,3);
    deno=zeros(1,3);
    div=zeros(1,3);
    for m=1:3           
        try 
           nume(m)=r(n-1,m)-r(n-2,m);
           deno(m)=r(n,m)-r(n-1,m);
           div(m)=nume(m)./deno(m);
        catch
            div(m)= NaN;
        end
    end
    B=cat(1,B, [div(1),div(2),div(3)]);
    disp('                   div1                     div2                     div3')
    disp(B)
    
end
        