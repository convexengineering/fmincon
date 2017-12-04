x0 = [-0.568735947213, -3.07418359834, -4.31524683735, 7.16938114894, 8.42030542122, -0.568735947213, -2.25754524402, 7.83473868502, 2.48655738115, 7.11300745655, 2.79339313757, 6.13773790742, -1.14315929446, 3.07503658672, 15.3724193988, 9.49665884734, 3.93204058462, 3.17208754289, -5.67817406554, -0.771598505346, ]';
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