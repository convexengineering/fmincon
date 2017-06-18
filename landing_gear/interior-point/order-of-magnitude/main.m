x0 = [10.0, 0.1, 1.0, 10.0, 1000.0, 0.01, 100.0, 1000.0, 1.0, 10.0, 100000.0, 10.0, 1e-07, 1e-06, 100.0, 10.0, 0.001, 1.0, 0.01, 1.0, 0.1, 100000.0, 100000.0, 0.1, 1.0, 10000.0, 10.0, 100000.0, 10000.0, 1.0, 100.0, 0.1, 0.1, 10000.0, 10000.0, 1000.0, 100.0, 0.001, 100.0, 10.0, 1.0, 0.1, 1.0, ];
options = optimset('fmincon');
options.Algorithm = 'interior-point';
options.MaxFunEvals = Inf;
options.MaxIter = Inf;
options.GradObj = 'on';
options.GradConstr = 'on';
tic;
[x,fval] = ...
fmincon(@objfun,x0,[],[],[],[],[],[],@confun,options);
toc;