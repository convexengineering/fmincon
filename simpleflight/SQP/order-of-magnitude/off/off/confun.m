function [c, ceq, DC, DCeq] = confun(x)
% Nonlinear inequality constraints
c = [
    -x(8) + 0.031*x(6).^-1 + 0.335*x(5).^2*x(7).^-1 + 2.46*x(2)
    -x(9) + 0.194*x(1).^0.5*x(6).^0.5*x(7).^1.5 + 45.2*x(6)
    -6.91e+04*x(10)*x(6).^0.5*x(7).^-0.5 + x(3)
    -x(2) + 0.074*x(3).^-0.2
    -0.615*x(10).^2*x(5)*x(6) + x(1)
    -446*x(6) + x(1)
    -x(1) + 4.94e+03 + x(9)
    ];

ceq = [
      -x(4) + 0.615*x(10).^2*x(6)*x(8)
      ];
if nargout > 2
    DC = [
          0,...
          2.46,...
          0,...
          0,...
          0.67*x(5)*x(7).^-1,...
          -0.031*x(6).^-2,...
          -0.335*x(5).^2*x(7).^-2,...
          -1,...
          0,...
          0;
          0.0969*x(1).^-0.5*x(6).^0.5*x(7).^1.5,...
          0,...
          0,...
          0,...
          0,...
          0.0969*x(1).^0.5*x(6).^-0.5*x(7).^1.5 + 45.2,...
          0.291*x(1).^0.5*x(6).^0.5*x(7).^0.5,...
          0,...
          -1,...
          0;
          0,...
          0,...
          1,...
          0,...
          0,...
          -3.46e+04*x(10)*x(6).^-0.5*x(7).^-0.5,...
          3.46e+04*x(10)*x(6).^0.5*x(7).^-1.5,...
          0,...
          0,...
          -6.91e+04*x(6).^0.5*x(7).^-0.5;
          0,...
          -1,...
          -0.0148*x(3).^-1.2,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0;
          1,...
          0,...
          0,...
          0,...
          -0.615*x(10).^2*x(6),...
          -0.615*x(10).^2*x(5),...
          0,...
          0,...
          0,...
          -1.23*x(10)*x(5)*x(6);
          1,...
          0,...
          0,...
          0,...
          0,...
          -446,...
          0,...
          0,...
          0,...
          0;
          -1,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          1,...
          0
         ]';
    DCeq = [
            0,...
            0,...
            0,...
            -1,...
            0,...
            0.615*x(10).^2*x(8),...
            0,...
            0.615*x(10).^2*x(6),...
            0,...
            1.23*x(10)*x(6)*x(8)
           ]';
end