import os

algorithms = ['interior-point', 'SQP']
guesstypes = ['order-of-magnitude-floor', 'order-of-magnitude-round',
              'almost-exact-solution', 'ones']
gradobjs = ['on', 'off']
gradconstrs = ['on', 'off']

excludedcases = ['interior-point/order-of-magnitude-floor/on/on']

with open('results.txt', 'w') as outfile:
    outfile.write('#Results Table\n') 

for algorithm in algorithms:
    for guesstype in guesstypes:
        for gradobj in gradobjs:
            for gradconstr in gradconstrs:
                result = {}
                directory = (algorithm + '/' + guesstype + '/' + gradobj + '/' +
                             gradconstr + '/')
                with open('results.txt', 'a') as outfile:
                    outfile.write('{0:<48}'.format(directory) + ' ')
                if os.path.exists(directory):
                    for metric in ['cost', 'iterations', 'elapsed']:
                        if os.path.exists(directory + metric + '.txt'):
                            with open(directory + metric + '.txt', 'r') as f:
                                result[metric] = f.readline()

                            with open('results.txt', 'a') as outfile:
                                outfile.write('{0:>14}'.format(result[metric]) + ' ')
                with open('results.txt', 'a') as outfile:
                    outfile.write('\n')
                

