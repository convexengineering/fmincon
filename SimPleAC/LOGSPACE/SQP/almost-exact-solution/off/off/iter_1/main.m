x0 = [-0.510825623766, -2.99573227355, -4.60517018599, 6.90775527898, 8.51719319142, -0.510825623766, -2.30258509299, 8.00636756765, 2.30258509299, 6.90775527898, 2.99573227355, 6.21460809842, -1.20397280433, 2.99573227355, 15.4249484704, 9.21034037198, 3.91202300543, 2.99573227355, -5.80914299031, -0.69314718056, ]';
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