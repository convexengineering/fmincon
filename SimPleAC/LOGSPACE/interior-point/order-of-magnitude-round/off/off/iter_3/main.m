x0 = [-0.569135033972, -3.07596137155, -4.3157897634, 7.16865977193, 8.41990633447, -0.569135033972, -2.25711197948, 7.8316506758, 2.48352672102, 7.10740945322, 2.79252792127, 6.13820403696, -1.14495594642, 3.0743152097, 15.3744392567, 9.49593747007, 3.93290580092, 3.17083381698, -5.67857803712, -0.773376278554, ]';
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