import numpy as np
import matplotlib.pyplot as plt
from SimPleAC import SimPleAC

sa = SimPleAC()
n = 20
sa.substitutions.update({'V_f_wing': 0.5, 'V_f_fuse': 0.5})
sol = sa.solve()
sa.substitutions.update({'V_f_wing': ('sweep', np.linspace(0.0005, 0.5, n)),
			 'V_f_fuse': ('sweep', np.linspace(0.05, 0.7, n))})
sol = sa.solve(skipsweepfailures=True)
Vfw = sol('V_f_wing')
Vff = sol('V_f_fuse')
cost = sol['cost']
#cost = sol('A')

X = Vfw.reshape(n,n)
Y = Vff.reshape(n,n)
Z = cost.reshape(n,n)

f, ax = plt.subplots()
levels = [3600, 3800, 4000, 4200, 4400, 4600, 4800,
          5000, 5200, 5400, 5600, 5800, 6000, 6500, 7000]
#levels = [4, 5, 6, 7, 8, 9, 10, 11, 12]
CS = plt.contour(X, Y, Z, levels=levels, colors='k')
plt.clabel(CS, inline=1, fontsize=10, fmt='%1.0f')
ax.plot(0.1047, 0.4613, 'o', color='r', markersize=10)
ax.plot(0.1050, 0.4630, 's', color='g', markersize=10)
ax.plot(0.1602, 0.4813, '^', color='b', markersize=10)
ax.set_xlabel(r'$V_{f_{wing}} [m^3]$', fontsize=16)
ax.set_ylabel(r'$V_{f_{fuse}} [m^3]$', fontsize=16)
ax.set_title(r'$W_f [N]$', fontsize=16)
ax.legend(['Solution (I)', 'Solution (II)', 'Solution (III)'], numpoints=1, loc="best")
#ax.set_xscale("log")
#ax.set_yscale("log")
f.savefig('contour1.png')
plt.show()
