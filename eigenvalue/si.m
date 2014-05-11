% Simultaneous Iteration
function [lam,Q]=si(A)
[m,n]=size(A);
Q = eye(m,m);
[Q,R] = qr(A*Q);
lam0=diag(Q'*A*Q);
[Q,R] = qr(A*Q);
lam=diag(Q'*A*Q);
while norm(lam0-lam, 2)> 1E-6
	lam0 = lam;
    [Q,R] = qr(A*Q);
	lam=diag(Q'*A*Q);
end