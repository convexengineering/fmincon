import os
from simpleflight import simpleflight
from gpkit.tools.fmincon import generate_mfiles

algorithms = ['interior-point', 'SQP']
guesstypes = ['order-of-magnitude-floor', 'order-of-magnitude-round',
              'almost-exact-solution', 'ones']
gradobjs = ['off']
gradconstrs = ['off']

with open('run_mfiles.m', 'a') as outfile:
    outfile.write('\n')

for algorithm in algorithms:
    for guesstype in guesstypes:
        for gradobj in gradobjs:
            for gradconstr in gradconstrs:
                sf = simpleflight()
                directory = (algorithm + '/' + guesstype + '/' + gradobj + '/' +
                             gradconstr)
                if not os.path.exists(directory):
                        os.makedirs(directory)
                generate_mfiles(sf, logspace=True, algorithm=algorithm,
                                guesstype=guesstype)
                os.rename('main.m', directory + '/main.m')
                os.rename('objfun.m', directory + '/objfun.m')
                os.rename('confun.m', directory + '/confun.m')
                os.rename('lookup.txt', directory + '/lookup.txt')
                with open('run_mfiles.m', 'a') as outfile:
                    outfile.write('run ' + directory + '/main.m\n')
