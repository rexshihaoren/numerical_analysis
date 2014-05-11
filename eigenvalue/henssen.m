% Transform Matrix to Hessenberg Form
function [a,U]=hessen(a)
[m,n] = size(a);
v=zeros(m,m);
U = eye(m,m);
u={};
for k=1:m-2
  x=a(k+1:m,k);
  v(1:m-k,k)= -sign(x(1)+eps)*norm(x)*eye(m-k,1)-x;
  v(1:m-k,k)=v(1:m-k,k)/norm(v(1:m-k,k));
  v0 = v(1:m-k,k);
  u{k} = [eye(k) zeros(k,m-k)
  			zeros(m-k,k) eye(m-k)-2*v0*v0'/(v0'*v0)];
  a(k+1:m,k:m)=a(k+1:m,k:m)-2*v(1:m-k,k)*v(1:m-k,k)'*a(k+1:m,k:m);
  a(1:m,k+1:m)=a(1:m,k+1:m)-2*a(:,k+1:m)*v(1:m-k,k)*v(1:m-k,k)';
end
for j=1:length(u)
	U = U*u{j};
end