import os
from gpkit import Model
from gpkit.models.gpkitmodels.aircraft.vtail import VerticalTail
from gpkit.tools.fmincon import generate_mfiles

vt = VerticalTail.standalone737()
m = Model(vt.cost, vt.flat(constraintsets=False), vt.substitutions)
algorithm = 'interior-point'
guesstype = 'almost-exact-solution'
generate_mfiles(m, algorithm, guesstype)
#algorithms = ['interior-point', 'SQP']
#guesstypes = ['order-of-magnitude', 'almost-exact-solution', 'ones']

#for algorithm in algorithms:
#    for guesstype in guesstypes:
#        directory = algorithm + '/' + guesstype
#        if not os.path.exists(directory):
#                os.makedirs(directory)
#        generate_mfiles(m, algorithm, guesstype)
#        os.rename('main.m', directory + '/main.m')
