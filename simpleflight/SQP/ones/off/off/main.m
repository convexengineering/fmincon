x0 = ones(10,1);
options = optimoptions('fmincon');
options.Algorithm = 'SQP';
options.MaxFunEvals = Inf;
options.MaxIter = 100000;
options.SpecifyObjectiveGradient = false;
options.SpecifyConstraintGradient = false;
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
if exitflag == 0
	fprintf(fid, '(e)');
end
fclose(fid);
fid = fopen('solution.txt', 'w');
fid2 = fopen('initialguess.txt', 'w');
for i = 1:numel(x)
    fprintf(fid, '%.4g\n', x(i));
    fprintf(fid2, '%.3g\n', x0(i));
end
fclose(fid);
fclose(fid2);