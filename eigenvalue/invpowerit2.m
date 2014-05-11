function x=invpowerit2(A,x,s,k)
As=A-s*eye(size(A));
for j=1:k
  u=x/norm(x);     
  x=As\u;          
  lam=u'*x;        
end