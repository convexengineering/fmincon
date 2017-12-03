x0 = [0.1, 0.01, 0.01, 1000.0, 1000.0, 0.1, 0.1, 1000.0, 10.0, 1000.0, 10.0, 100.0, 0.1, 10.0, 1000000.0, 10000.0, 10.0, 10.0, 0.001, 0.1, ]';
options = optimset('fmincon');
options.Algorithm = 'SQP';
options.MaxFunEvals = Inf;
options.MaxIter = Inf;
options.GradObj = 'on';
options.GradConstr = 'off';
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