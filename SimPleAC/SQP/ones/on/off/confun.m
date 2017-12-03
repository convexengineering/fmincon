function [c, ceq, DC, DCeq] = confun(x)
% Nonlinear inequality constraints
c = [
    -x(16) + 6.25e+03 + x(5) + x(8)
    -0.615*x(13)*x(14)*x(17).^2 + 0.5*x(5) + 6.25e+03 + x(8)
    -615*x(14) + x(16)
    -3.6*x(11) + 3e+03*x(17).^-1
    -x(5) + 0.6*x(11)*x(12)
    -x(12) + 0.615*x(14)*x(17).^2*x(3)
    -x(3) + 0.346*x(13).^2*x(9).^-1 + 2.43*x(19) + x(14).^-1*x(2)
    -10*x(2) + x(20)
    -6.93e+04*x(14).^0.5*x(17)*x(9).^-0.5 + x(15)
    -x(19) + 0.074*x(15).^-0.2
    -1.3e-05*x(14).^3*x(9).^-1 + x(7).^2
    -x(20) + -x(7) + x(1)
    -x(1) + x(6)
    -x(4) + 60*x(14)
    -x(10).^2 + 0.00189*x(14)*x(16)*x(9).^3 + 0.00242*x(14)*x(16)*x(20)*x(9).^3
    -x(8) + x(10) + x(4)
    ];

ceq = [
      -x(18) + x(13)*x(3).^-1
      -x(6) + 0.000125*x(5)
      ];
if nargout > 2
    DC = [
          0,...
          0,...
          0,...
          0,...
          1,...
          0,...
          0,...
          1,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          -1,...
          0,...
          0,...
          0,...
          0;
          0,...
          0,...
          0,...
          0,...
          0.5,...
          0,...
          0,...
          1,...
          0,...
          0,...
          0,...
          0,...
          -0.615*x(14)*x(17).^2,...
          -0.615*x(13)*x(17).^2,...
          0,...
          0,...
          -1.23*x(13)*x(14)*x(17),...
          0,...
          0,...
          0;
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          -615,...
          0,...
          1,...
          0,...
          0,...
          0,...
          0;
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          -1,...
          0,...
          0,...
          0,...
          0,...
          0,...
          -3e+03*x(17).^-2,...
          0,...
          0,...
          0;
          0,...
          0,...
          0,...
          0,...
          -1,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0.6*x(12),...
          0.6*x(11),...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0;
          0,...
          0,...
          0.615*x(14)*x(17).^2,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          -1,...
          0,...
          0.615*x(17).^2*x(3),...
          0,...
          0,...
          1.23*x(14)*x(17)*x(3),...
          0,...
          0,...
          0;
          0,...
          x(14).^-1,...
          -1,...
          0,...
          0,...
          0,...
          0,...
          0,...
          -0.346*x(13).^2*x(9).^-2,...
          0,...
          0,...
          0,...
          0.692*x(13)*x(9).^-1,...
          -x(14).^-2*x(2),...
          0,...
          0,...
          0,...
          0,...
          2.43,...
          0;
          0,...
          -10,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          1;
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          3.46e+04*x(14).^0.5*x(17)*x(9).^-1.5,...
          0,...
          0,...
          0,...
          0,...
          -3.46e+04*x(14).^-0.5*x(17)*x(9).^-0.5,...
          1,...
          0,...
          -6.93e+04*x(14).^0.5*x(9).^-0.5,...
          0,...
          0,...
          0;
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          -0.0148*x(15).^-1.2,...
          0,...
          0,...
          0,...
          -1,...
          0;
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          2*x(7),...
          0,...
          1.3e-05*x(14).^3*x(9).^-2,...
          0,...
          0,...
          0,...
          0,...
          -3.89e-05*x(14).^2*x(9).^-1,...
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
          0,...
          0,...
          -1,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          -1;
          -1,...
          0,...
          0,...
          0,...
          0,...
          1,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0;
          0,...
          0,...
          0,...
          -1,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          60,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0;
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0.00567*x(14)*x(16)*x(9).^2 + 0.00727*x(14)*x(16)*x(20)*x(9).^2,...
          -2*x(10),...
          0,...
          0,...
          0,...
          0.00189*x(16)*x(9).^3 + 0.00242*x(16)*x(20)*x(9).^3,...
          0,...
          0.00189*x(14)*x(9).^3 + 0.00242*x(14)*x(20)*x(9).^3,...
          0,...
          0,...
          0,...
          0.00242*x(14)*x(16)*x(9).^3;
          0,...
          0,...
          0,...
          1,...
          0,...
          0,...
          0,...
          -1,...
          0,...
          1,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0,...
          0
         ]';
    DCeq = [
            0,...
            0,...
            -x(13)*x(3).^-2,...
            0,...
            0,...
            0,...
            0,...
            0,...
            0,...
            0,...
            0,...
            0,...
            x(3).^-1,...
            0,...
            0,...
            0,...
            0,...
            -1,...
            0,...
            0;
            0,...
            0,...
            0,...
            0,...
            0.000125,...
            -1,...
            0,...
            0,...
            0,...
            0,...
            0,...
            0,...
            0,...
            0,...
            0,...
            0,...
            0,...
            0,...
            0,...
            0
           ]';
end