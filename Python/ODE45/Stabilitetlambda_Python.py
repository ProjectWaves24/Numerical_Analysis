import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
import numpy.linalg as ln
from func_lambda_Python import func_lambda

y0=[1]   #initial values
t0=0       #time interval
ts=10

#step-size h
h=0.01

N=int((ts-t0)/h)
t=np.linspace(t0,ts,N)
sol=isc.solve_ivp(func_lambda,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'b-',label='y(0) = 1')

delta=10
y0=[y0[0]+delta]   #initial values

sol=isc.solve_ivp(func_lambda,[t0,ts],y0,'RK45',t)

#non-stiff ode
#sol=isc.solve_ivp(func_stabilitet,[t0,ts],y0,'RK23',t)

plt.plot(t,sol.y[0],'r-',label='y(0) = 1+ 10')

plt.legend()
plt.title('Stabilitet dy/dt = -y, y(0) =1')
