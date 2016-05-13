x0 = [...
      10  %  x_1: d_{t_n}
      0.1  %  x_2: w_{t_n}
      10  %  x_3: x_n
      10  %  x_4: x_m
      1000  %  x_5: W_{mw}
      0.01  %  x_6: r_n
      1000  %  x_7: W_{ms}
      10000  %  x_8: F_{w_m}
      1  %  x_9: \Delta x_m
      10  %  x_10: \Delta x_n
      1E5  %  x_11: L_n
      10  %  x_12: x_{CG}
      1E-7  %  x_13: I_n
      1E-6  %  x_14: I_m
      100  %  x_15: W_{ns}
      100  %  x_16: W_{wa,n}
      0.01  %  x_17: t_m
      1  %  x_18: y_m
      0.1  %  x_19: r_m
      1  %  x_20: \tan(\psi)
      0.1  %  x_21: d_{oleo}
      1E5  %  x_22: L_{w_m}
      1E6  %  x_23: L_m
      0.1  %  x_24: w_{t_m}
      1  %  x_25: d_{nacelle}
      1E4  %  x_26: W_{lg}
      10  %  x_27: B
      1E5  %  x_28: E_{land}
      1E5  %  x_29: L_{n_{dyn}}
      6  %  x_30: T
      1000  %  x_31: F_{w_n}
      1  %  x_32: l_{oleo}
      0.1  %  x_33: S_sa
      1E4  %  x_34: W_{mg}
      1E5 %  x_35: L_{w_n}
      1000  %  x_36: W_{ng}
      100  %  x_37: W_{wa,m}
      0.001  %  x_38: t_n
      1000  %  x_39: W_{nw}
      10  %  x_40: d_{t_m}
      1  %  x_41: l_n
      0.1  %  x_42: \tan(\phi)
      1  %  x_43: l_m
        ];

options = optimset('fmincon');
options.Algorithm = 'interior-point';
%options.Algorithm = 'SQP';
options.MaxFunEvals = Inf;
options.MaxIter = Inf;
%options.GradObj = 'on';
%options.GradConstr = 'on';

tic;
[x,fval] = ...
fmincon(@objfun,x0,[],[],[],[],[],[],@confun, options)
toc;
