x0 = [-2.30258509299, -4.60517018599, -4.60517018599, 6.90775527898, 6.90775527898, -2.30258509299, -2.30258509299, 6.90775527898, 0.0, 4.60517018599, 2.30258509299, 4.60517018599, -2.30258509299, 2.30258509299, 13.815510558, 9.21034037198, 2.30258509299, 2.30258509299, -6.90775527898, -2.30258509299, ]';
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