import os
from gpkit.models.gpkitmodels.aircraft.landing_gear import LandingGear
from gpkit.tools.fmincon import generate_mfiles
from gpkit import Model

algorithms = ['interior-point', 'SQP']
guesstypes = ['order-of-magnitude-floor', 'order-of-magnitude-round',
              'almost-exact-solution', 'ones']
gradobjs = ['on', 'off']
gradconstrs = ['on', 'off']

with open('run_mfiles.m', 'a') as outfile:
    outfile.write('\n')

for algorithm in algorithms:
    for guesstype in guesstypes:
        for gradobj in gradobjs:
            for gradconstr in gradconstrs:
                lg = LandingGear.standalone737()
                m = Model(lg.cost, lg.flat(constraintsets=False), lg.substitutions)
                directory = (algorithm + '/' + guesstype + '/' + gradobj + '/' +
                             gradconstr)
                if not os.path.exists(directory):
                        os.makedirs(directory)
                generate_mfiles(m, algorithm, guesstype, gradobj, gradconstr)
                os.rename('main.m', directory + '/main.m')
                os.rename('objfun.m', directory + '/objfun.m')
                os.rename('confun.m', directory + '/confun.m')
                os.rename('lookup.txt', directory + '/lookup.txt')
                with open('run_mfiles.m', 'a') as outfile:
                    outfile.write('run ' + directory + '/main.m\n')
