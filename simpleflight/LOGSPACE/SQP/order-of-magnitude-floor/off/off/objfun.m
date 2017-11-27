function [f, gradf] = objfun(x)
f = log( + 1.0*exp( +1 * x(1) ) );
if nargout > 1
    gradf  = [];
end