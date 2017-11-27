from simpleflight import simpleflight
sf = simpleflight()
model = sf


# Create a new dictionary mapping variables to x(i)'s for use w/ fmincon
i = 1
newdict = {}
lookup = []
newlist = []
original_varkeys = model.varkeys
for key in model.varkeys:
    if key not in model.substitutions:
	newdict[key] = 'y({0})'.format(i)
	newlist += [key.str_without(["units"])]
	lookup += ['y_{0}: '.format(i) + key.str_without(["units"])]
	i += 1
#x0string = make_initial_guess(model, newlist, guesstype)

cost = model.cost # needs to be before subinplace()
constraints = model
constraints.subinplace(constraints.substitutions)
constraints.subinplace(newdict)

for constraint in constraints:
    expdicttuple = constraint.as_posyslt1()[0].exps
    clist = constraint.as_posyslt1()[0].cs.magnitude

    constraintstring = ['log(']
    for expdict, c in zip(expdicttuple, clist):
        constraintstring += ['+ {0} exp('.format(c)]
        for k, v in expdict.iteritems():
            constraintstring += ['+{0} * {1}'.format(v, k)]
        constraintstring += [')']
    constraintstring += [')']
    print ' '.join(constraintstring)

