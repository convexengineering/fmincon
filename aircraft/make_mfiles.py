#from gpkitmodels.aircraft.aircraft import Aircraft
from gpkit.models.gpkitmodels.aircraft.aircraft import Aircraft
from gpkit import Model
from gpkit.tools.fmincon import generate_mfiles

ac = Aircraft()
m = Model(ac.cost, ac.flat(constraintsets=False), ac.substitutions)
generate_mfiles(m, guesstype='order-of-magnitude')
