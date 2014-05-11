% Workhorse Method to find eigenvectors and eigenvalues
function [V, lam]=workhorse(A)
[a,U]=henssen(A);
lam =shiftedqr(a);
for i=1:length(a)
	x = randn(length(a),1);
	V(1:length(a),i) = invpowerit2(a,x,(1+1E-12)*lam(i),1);
	V(1:length(a),i) = U*V(1:length(a),i);
	V(1:length(a),i) = V(1:length(a),i) / norm(V(1:length(a),i));
end

	