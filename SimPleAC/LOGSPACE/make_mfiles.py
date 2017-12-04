import os
from SimPleAC import SimPleAC
from gpkit.tools.fmincon import generate_mfiles
from gpkit import Model
from math import log10, floor, log
from gpkit.small_scripts import mag

algorithms = ['interior-point', 'SQP']
guesstypes = ['order-of-magnitude-floor', 'order-of-magnitude-round',
              'almost-exact-solution', 'ones']
gradobjs = ['off']
gradconstrs = ['off']

with open('run_mfiles.m', 'w') as outfile:
    outfile.write('\n')

m = SimPleAC()
sol = m.localsolve(modifylastgp=False)

for algorithm in algorithms:
    for guesstype in guesstypes:
        # Create x0
        x0 = {}
        for vk in sol['freevariables'].keys():
            xf = mag(sol['freevariables'][vk])
            if guesstype == "almost-exact-solution":
                x0[vk] = round(xf, -int(floor(log10(abs(xf))))) # rounds to 1sf
            elif guesstype == "order-of-magnitude-floor":
                x0[vk] = 10**floor(log10(xf))
            elif guesstype == "order-of-magnitude-round":
                x0[vk] = 10**round(log10(xf))
            elif guesstype == "ones":
                x0[vk] = 1
        for gradobj in gradobjs:
            for gradconstr in gradconstrs:
                m = SimPleAC()
                sol = m.localsolve(x0=x0, modifylastgp=False)
                numgps = len(m.program.gps)
                for i in range(numgps):
                    sa = SimPleAC()
                    sol = sa.localsolve(x0=x0, modifylastgp=False)
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
                        outfile.write('clear\n')
                        outfile.write('disp \'' + directory + '\'\n')
                        outfile.write('cd ' + directory + '\n')
                        outfile.write('main\n')
                        outfile.write('cd ../../../../\n')
