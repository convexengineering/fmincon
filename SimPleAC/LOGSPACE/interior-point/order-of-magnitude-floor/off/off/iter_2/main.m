x0 = [-0.337828574649, -2.52766106815, -4.25812043913, 7.31360370897, 8.65121279379, -0.337828574649, -1.83687553526, 7.75609377634, 2.07788564374, 6.72765643844, 2.76383472327, 6.39820369429, -1.31107699219, 3.21925914675, 15.6784249619, 9.56821332192, 3.96159899892, 2.94704344694, -5.73937517815, -0.225075975155, ]';
options = optimset('fmincon');
options.Algorithm = 'interior-point';
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
for i = 1:numel(x)
    fprintf(fid, '%.3g\n', x(i));
end
fclose(fid);