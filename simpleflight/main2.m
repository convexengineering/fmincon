%x0 = [0.02, 2000, 8, 300, 0.5, 20, 4E6, 7000, 40, 0.004];
%x0 = [0.1, 1000, 10, 100, 1, 10, 1E6, 10000, 10, 0.01];
x0 = [0.01, 1000, 1, 100, 0.1, 10, 1E6, 1000, 10, 0.001];
%x0 = ones(10,1);

%options = optimoptions(@fmincon,'Algorithm','interior-point');
options = optimset('fmincon');
options.MaxFunEvals = Inf;
options.MaxIter = Inf;
%options.Display ='iter';
options.Algorithm = 'interior-point';
options.DerivativeCheck = 'on';
%options.Algorithm = 'SQP';
options.GradObj = 'on';
options.GradConstr = 'on';
disp([options.Algorithm])
disp([options.GradObj])
disp([options.GradConstr])
tic;
[x,fval,exitflag,output] = fmincon(@objfun,x0,[],[],[],[],[],[],@confun, options)
toc;