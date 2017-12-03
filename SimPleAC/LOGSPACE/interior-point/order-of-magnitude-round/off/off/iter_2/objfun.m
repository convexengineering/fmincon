function [f, gradf] = objfun(x)
f = log( + 1.0*exp( +1 * x(5) ) );
if nargout > 1
    gradf  = [];
end