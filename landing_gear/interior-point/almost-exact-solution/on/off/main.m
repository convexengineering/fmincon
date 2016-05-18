x0 = [40.0, 0.3, 7.0, 20.0, 2000.0, 0.04, 600.0, 7000.0, 3.0, 10.0, 200000.0, 20.0, 0.3, 8e-06, 100.0, 60.0, 0.008, 3.0, 0.07, 2.0, 0.4, 200000.0, 700000.0, 0.4, 2.0, 10000.0, 10.0, 400000.0, 80000.0, 1e-06, 6.0, 800000.0, 700.0, 0.7, 10000.0, 80000.0, 2000.0, 300.0, 0.004, 600.0, 40.0, 2.0, 0.3, 2.0, ];
options = optimset('fmincon');
options.Algorithm = 'interior-point';
options.MaxFunEvals = Inf;
options.MaxIter = Inf;
options.GradObj = 'on';
options.GradConstr = 'off';
tic;
[x,fval] = ...
fmincon(@objfun,x0,[],[],[],[],[],[],@confun,options);
elapsed = toc;
fid = fopen('elapsed.txt', 'w');
fprintf(fid, '%.1f', elapsed);
fclose(fid);
fid = fopen('cost.txt', 'w');
fprintf(fid, '%.5g', fval);
fclose(fid);