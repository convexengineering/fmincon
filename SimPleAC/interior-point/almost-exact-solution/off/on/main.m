x0 = [0.6, 0.05, 0.01, 1000.0, 5000.0, 0.6, 0.1, 3000.0, 10.0, 1000.0, 20.0, 500.0, 0.3, 20.0, 5000000.0, 10000.0, 50.0, 20.0, 0.003, 0.5, ]';
options = optimset('fmincon');
options.Algorithm = 'interior-point';
options.MaxFunEvals = Inf;
options.MaxIter = Inf;
options.GradObj = 'off';
options.GradConstr = 'on';
tic;
[x,fval, exitflag, output] = ...
fmincon(@objfun,x0,[],[],[],[],[],[],@confun,options);
elapsed = toc;
fid = fopen('elapsed.txt', 'w');
fprintf(fid, '%.1f', elapsed);
fclose(fid);
fid = fopen('iterations.txt', 'w');
fprintf(fid, '%d', output.iterations);
fclose(fid);
fid = fopen('cost.txt', 'w');
fprintf(fid, '%.5g', fval);
if exitflag == -2
	fprintf(fid, '(i)');
end
fclose(fid);