function [f, gradf] = objfun(x)
f = x(1);
if nargout > 1
    gradf  = [1
              0
              0
              0
              0
              0
              0
              0
              0
              0];
end