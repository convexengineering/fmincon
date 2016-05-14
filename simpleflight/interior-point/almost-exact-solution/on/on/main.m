x0 = [0.02, 2000.0, 8.0, 20.0, 300.0, 0.5, 4000000.0, 0.004, 7000.0, 40.0, ];
options = optimset('fmincon');
options.Algorithm = 'interior-point';
options.MaxFunEvals = Inf;
options.MaxIter = Inf;
options.GradObj = 'on';
options.GradConstr = 'on';
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