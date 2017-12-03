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
                cumiterations = 0
                cumelapsed = 0
                for iteri in ['iter_1', 'iter_2', 'iter_3', 'iter_4']:
                    result = {}
                    directory = (algorithm + '/' + guesstype + '/' + gradobj + '/' +
                                 gradconstr + '/' + iteri + '/')
                    with open('results.txt', 'a') as outfile:
                        outfile.write('{0:<55}'.format(directory) + ' ')
                    if os.path.exists(directory):
                        for metric in ['cost', 'iterations', 'elapsed']:
                            if os.path.exists(directory + metric + '.txt'):
                                with open(directory + metric + '.txt', 'r') as f:
                                    result[metric] = f.readline()

                                with open('results.txt', 'a') as outfile:
                                    outfile.write('{0:>14}'.format(result[metric]) + ' ')
                    with open('results.txt', 'a') as outfile:
                        outfile.write('\n')

                    # Cumulative measures
                    finalcost = float(result['cost']) # only want final
                    cumiterations += float(result['iterations'])
                    cumelapsed += float(result['elapsed'])
                directory0 = (algorithm + '/' + guesstype + '/' + gradobj + '/' +
                              gradconstr + '/')
                with open(directory0 + 'cost.txt', 'w') as outfile:
                    outfile.write(str(finalcost))
                with open(directory0 + 'iterations.txt', 'w') as outfile:
                    outfile.write(str(cumiterations))
                with open(directory0 + 'elapsed.txt', 'w') as outfile:
                    outfile.write(str(cumelapsed))

                

