x0 = [-0.556486457433, -3.02460720085, -4.30476158635, 7.17853000932, 8.432554911, -0.556486457433, -2.25212702404, 7.8606938029, 2.50316752233, 7.1564412532, 2.80077775918, 6.14260277559, -1.12902819945, 3.0841854471, 15.3613041368, 9.50580770803, 3.92465596301, 3.17573338691, -5.67595101314, -0.722022107857, ]';
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
    fprintf(fid, '%.3g\n', x(i));
end
fclose(fid);