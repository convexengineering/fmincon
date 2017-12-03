x0 = [-0.356674943939, -2.52572864431, -4.60517018599, 7.60090245954, 8.69951474821, -0.356674943939, -1.60943791243, 7.60090245954, 2.07944154168, 6.68461172767, 2.99573227355, 6.39692965522, -1.20397280433, 3.40119738166, 15.6072700272, 9.21034037198, 3.91202300543, 2.99573227355, -5.80914299031, -0.223143551314, ];
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