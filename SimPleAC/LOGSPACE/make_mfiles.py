import os
from SimPleAC import SimPleAC
from gpkit.tools.fmincon import generate_mfiles
from gpkit import Model

algorithms = ['interior-point', 'SQP']
guesstypes = ['order-of-magnitude-floor', 'order-of-magnitude-round',
              'almost-exact-solution', 'ones']
gradobjs = ['off']
gradconstrs = ['off']

with open('run_mfiles.m', 'w') as outfile:
    outfile.write('\n')

for algorithm in algorithms:
    for guesstype in guesstypes:
        for gradobj in gradobjs:
            for gradconstr in gradconstrs:
                m = SimPleAC()
                sol = m.localsolve(modifylastgp=False)
                numgps = len(m.program.gps)
                # TODO: initiate with correct initial guess?
                for i in range(numgps):
                    sa = SimPleAC()
                    sol = sa.localsolve(modifylastgp=False)
                    gp = sa.program.gps[i]
                    m = Model(gp.cost, gp.flat(constraintsets=False), gp.substitutions)
                    directory = (algorithm + '/' + guesstype + '/' + gradobj + '/' +
                                 gradconstr + '/iter_' + str(i+1))
                    if not os.path.exists(directory):
                            os.makedirs(directory)
                    if i == 0:
                        generate_mfiles(m, True, algorithm, guesstype, gradobj,
                                        gradconstr)
                    else:
                        prev_sol = sa.program.gps[i-1].result['freevariables']
                        generate_mfiles(m, True, algorithm, prev_sol, gradobj,
                                        gradconstr)
                    os.rename('main.m', directory + '/main.m')
                    os.rename('objfun.m', directory + '/objfun.m')
                    os.rename('confun.m', directory + '/confun.m')
                    os.rename('lookup.txt', directory + '/lookup.txt')
                    with open('run_mfiles.m', 'a') as outfile:
                        outfile.write('run ' + directory + '/main.m\n')
