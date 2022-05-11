import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
import numpy.linalg as ln
from func_stabilitet_Python import func_stabilitet

y0=[1]   #initial values
t0=-2       #time interval
ts=10

#step-size h
h=0.01

N=int((ts-t0)/h)
t=np.linspace(t0,ts,N)
sol=isc.solve_ivp(func_stabilitet,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'b-',label='y(-2) = 1')

delta=1
y0=[1+delta]   #initial values

sol=isc.solve_ivp(func_stabilitet,[t0,ts],y0,'RK45',t)

#non-stiff ode
#sol=isc.solve_ivp(func_stabilitet,[t0,ts],y0,'RK23',t)

plt.plot(t,sol.y[0],'r-',label='y(-2) = 1+ 1')

plt.legend()
plt.title('Stabilitet dy/dt=exp(-0.1 t^2) sin(5t)')
