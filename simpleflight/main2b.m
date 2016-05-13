%x0 = [0.02, 2000, 8, 300, 0.5, 20, 4E6, 7000, 40, 0.004];
x0 = [0.1, 1000, 10, 100, 1, 10, 1E6, 10000, 10, 0.01];
%x0 = ones(10,1);

%options = optimoptions(@fmincon,'Algorithm','interior-point');
options = optimset('fmincon');
options.MaxFunEvals = Inf;
options.MaxIter = Inf;
%options.Display ='iter';
%options.Algorithm = 'interior-point';
options.Algorithm = 'SQP';
%options.GradObj = 'on';
%options.GradConstr = 'on';
disp([options.Algorithm])
disp([options.GradObj])
disp([options.GradConstr])
A = zeros(2,10);
A(1,8) = 1;
A(1,6) = -446.49;
A(2,2) = 1;
A(2,8) = -1;
b = [0; -4940];
tic;
[x,fval] = fmincon(@objfun,x0,A,b,[],[],[],[],@confun2b, options)
toc;