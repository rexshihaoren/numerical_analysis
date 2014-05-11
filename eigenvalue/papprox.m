function A = papprox(Color)
	[U,S,V] = svd (Color);
	S0 = diag(S);
	plot(S0,'.');
	p = input('what do you think the cutoff point is?');
	A = U(:,1:p)*S(1:p,1:p)*(V(:,1:p))';
end