import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
import numpy.linalg as ln
from func_problem1_Python import func_problem1

y0=[-0.6]   #initial values
t0=-2        #time interval
ts=3

#step-size h
h=0.1

N=int((ts-t0)/h)
t=np.linspace(t0,ts,N)
sol=isc.solve_ivp(func_problem1,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'b-o',label='t_0=-2, y(t_0)=-0.6')

y0=[1]   #initial values
t0=-3        #time interval
ts=4

N=int((ts-t0)/h)
t=np.linspace(t0,ts,N)
sol=isc.solve_ivp(func_problem1,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'r-o',label='t_0=-3, y(t_0)= 1')

plt.legend()
plt.title('RK45 för dy/dt =sin(ty)')
