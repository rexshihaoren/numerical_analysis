% Pure QR
function [lam,Qbar]=pqr(A)
[m,n]=size(A);
Q=eye(m,m);
Qbar=Q; R=A;
[Q,R] = qr(R*Q)
Q*R
R*Q
lam0 = diag(R*Q)
[Q,R] = qr(R*Q)
lam = diag(R*Q)
while norm(lam0-lam, 2)> 1E-6
	lam0 = lam;
	[Q,R] = qr(R*Q)
	Qbar=Qbar*Q;       
	lam=diag(R*Q);       
end