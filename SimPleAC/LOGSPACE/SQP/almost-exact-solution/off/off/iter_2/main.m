x0 = [-0.568752183233, -3.07425368527, -4.31526571276, 7.16935861257, 8.4202891852, -0.568752183233, -2.25753739122, 7.83464908861, 2.48647406646, 7.11284690615, 2.79336796182, 6.13774684715, -1.14321094021, 3.07501405035, 15.3724749637, 9.49663631097, 3.93206576037, 3.17205477255, -5.67818517853, -0.771668592274, ]';
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
for i = 1:numel(x)
    fprintf(fid, '%.3g\n', exp(x(i)));
end
fclose(fid);