%hr function in HouseHolder Reflector
function H0 = hr(x, w)
	v = w - x;
	p = v*v'/(v'*v);
	H0 = eye(length(x))- 2*p;
end