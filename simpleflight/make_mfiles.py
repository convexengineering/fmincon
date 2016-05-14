import os
from simpleflight import simpleflight
from gpkit.tools.fmincon import generate_mfiles

sf = simpleflight()
algorithms = ['interior-point', 'SQP']
guesstypes = ['order-of-magnitude', 'almost-exact-solution', 'ones']
gradobjs = ['on', 'off']
gradconstrs = ['on', 'off']

for algorithm in algorithms:
    for guesstype in guesstypes:
        for gradobj in gradobjs:
            for gradconstr in gradconstrs:
                directory = (algorithm + '/' + guesstype + '/' + gradobj + '/' +
                             gradconstr)
                if not os.path.exists(directory):
                        os.makedirs(directory)
                generate_mfiles(sf, algorithm, guesstype, gradobj, gradconstr)
                os.rename('main.m', directory + '/main.m')
                os.rename('objfun.m', directory + '/objfun.m')
                os.rename('confun.m', directory + '/confun.m')
                os.rename('lookup.txt', directory + '/lookup.txt')
