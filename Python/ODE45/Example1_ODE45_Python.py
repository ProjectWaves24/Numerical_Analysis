import scipy.integrate as isc
import matplotlib.pyplot as plt
import numpy as np
from func_example1_Python import func_example1
from funcstabil_example1_Python import funcstabil_example1


t=np.linspace(0,12,100)

sol=isc.solve_ivp(func_example1,[0,12],[0,1,1],'RK45',t,rtol=1e-4,atol=[1e-4,1e-4,1e-5])

plt.plot(sol.t,sol.y[0],'b-',label='y_1')
plt.plot(sol.t,sol.y[1],'r-',label='y_2')
plt.plot(sol.t,sol.y[2],'g-',label='y_3')

sol=isc.solve_ivp(funcstabil_example1,[0,12],[0,1,1],'RK45',t,rtol=1e-4,atol=[1e-4,1e-4,1e-5])

plt.plot(sol.t,sol.y[0],'b--',label='y_1')
plt.plot(sol.t,sol.y[1],'r--',label='y_2')
plt.plot(sol.t,sol.y[2],'g--',label='y_3')

plt.legend()
plt.title('System av ODE: dy_1/dt=y_2 y_3,dy_2/dt=-y_1 y_3,dy_3/dt=-0.51y_1 y_2, y_1(0)=0,y_2(0)=1,y_3(0)=1')
plt.grid()
