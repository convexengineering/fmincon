from simpleflight import simpleflight
sf = simpleflight()
constraints = sf
constraints.subinplace(constraints.substitutions)

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

