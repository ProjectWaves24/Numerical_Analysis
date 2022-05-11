import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
import numpy.linalg as ln
from func_problem2_Python import func_problem2

y0=[4]   #initial values
t0=3        #time interval
ts=10

#step-size h
h=0.1

N=int((ts-t0)/h)
t=np.linspace(t0,ts,N)
sol=isc.solve_ivp(func_problem2,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'b-o',label='t_0= 3, y(3)= 4')


plt.xlabel('t')
plt.ylabel('y(t)')
plt.legend()
plt.title('ode45  för dy/dt = t^2 + sin(y)')
