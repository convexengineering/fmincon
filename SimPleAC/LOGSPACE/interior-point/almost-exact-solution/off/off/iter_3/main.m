x0 = [-0.569200118083, -3.07632253451, -4.31598133848, 7.16832345558, 8.41984125035, -0.569200118083, -2.25672767743, 7.82999040885, 2.48174916789, 7.10433968248, 2.79206511395, 6.13860176017, -1.14593730987, 3.07397889335, 15.3756226824, 9.49560115355, 3.93336860823, 3.17004402861, -5.67881472226, -0.773737441518, ]';
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