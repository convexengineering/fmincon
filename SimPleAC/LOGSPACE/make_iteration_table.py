import os

algorithms = ['interior-point', 'SQP']
guesstypes = ['ones', 'almost-exact-solution', 'order-of-magnitude-floor',
              'order-of-magnitude-round']
guesstypesdict = dict(zip(guesstypes, ['A','B','C','D']))
gradobjs = ['off']
gradconstrs = ['off']

#with open('run_mfiles.m', 'a') as outfile:
#    outfile.write('\n')

for algorithm in algorithms:
    string = ''
    for guesstype in guesstypes:
        if guesstype != "ones":
            string += '\\midrule\n'
        string += guesstypesdict[guesstype] + '&\n'
        for gradobj in gradobjs:
            for gradconstr in gradconstrs:
                for i in range(1,5):
                    directory = (algorithm + '/' + guesstype + '/' + gradobj + '/' +
                                 gradconstr + '/' + 'iter_{0}'.format(i) + '/')
                    if os.path.exists(directory):
                        if i != 1:
                            string += '&'
                        string += '{0} &\n'.format(i)
                        string += '\\input{\\SAdirlog/' + directory + 'cost.txt} &\n'
                        string += '\\input{\\SAdirlog/' + directory + 'elapsed.txt} &\n'
                        string += '\\input{\\SAdirlog/' + directory + 'iterations.txt}'
                        string += '\\\\ \n'

    with open('iterationtable_{0}.tex'.format(algorithm.replace("interior-point",
              "IP")), 'w') as f:
        f.write(string)
