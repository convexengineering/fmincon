x0 = ones(43,1);
options = optimset('fmincon');
options.MaxFunEvals = Inf;
options.MaxIter = Inf;
options.GradObj = 'on';
options.GradConstr = 'on';
[x,fval] = ...
fmincon(@objfun,x0,[],[],[],[],[],[],@confun, options);