function [f, gradf] = objfun(x)
f = 0.5*x(18) + x(4);
if nargout > 1
    gradf  = [0
              0
              0
              1
              0
              0
              0
              0
              0
              0
              0
              0
              0
              0
              0
              0
              0
              0.5
              0
              0
              0
              0
              0
              0
              0
              0
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