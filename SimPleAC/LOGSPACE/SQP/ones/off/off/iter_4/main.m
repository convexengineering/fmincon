x0 = [-0.56920010419, -3.07632229974, -4.3159810694, 7.16832401178, 8.41984126425, -0.56920010419, -2.25672845419, 7.82999332547, 2.48175239001, 7.10434511548, 2.79206592534, 6.13860096267, -1.14593557561, 3.07397944955, 15.375620538, 9.49560170975, 3.93336779684, 3.17004549379, -5.67881429339, -0.773737206748, ]';
options = optimset('fmincon');
options.Algorithm = 'SQP';
options.MaxFunEvals = Inf;
options.MaxIter = Inf;
options.GradObj = 'off';
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
fprintf(fid, '%.5g', exp(fval));
if exitflag == -2
	fprintf(fid, '(i)');
end
fclose(fid);
fid = fopen('solution.txt', 'w');
fid2 = fopen('initialguess.txt', 'w');
for i = 1:numel(x)
    fprintf(fid, '%.3g\n', exp(x(i)));
    fprintf(fid2, '%.3g\n', x0(i));
end
fclose(fid);
fclose(fid2);
fid = fopen('logsolution.txt', 'w');
for i = 1:numel(x)
    fprintf(fid, '%.3g\n', x(i));
end
fclose(fid);