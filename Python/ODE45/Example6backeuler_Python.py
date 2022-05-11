import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
import numpy.linalg as ln
from func_example6_Python import func_example6


y0=[1]   #initial values
t0=0        #time interval
ts=1.5

#step-size h

h=0.1
N=int((ts-t0)/h)
t=np.linspace(t0,ts,N+1)
sol=isc.solve_ivp(func_example6,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'b-o',label='h=0.1 (RK45)')

sol=isc.solve_ivp(func_example6,[t0,ts],y0,'RK23',t)

plt.plot(t,sol.y[0],'b--',label='h=0.1 (RK23)')

#Forward Euler method

h=0.01
N=1+int((ts-t0)/h)
y=np.linspace(t0,ts,N)
t=np.linspace(t0,ts,N)
y[0]=1                 #initial values

for k in range(0,N-1):
    y[k+1]=y[k]+h*func_example6(t[k],y[k])
    t[k+1]=t[k]+h

plt.plot(t,y,'g-o',label='h=0.01 (explicit Euler)')

#Backward Euler method

h=0.1
N=1+int((ts-t0)/h)
t=np.linspace(ts,t0,N)
y=np.linspace(ts,t0,N)
y[0]=1          #initial values
t[0]=0

for k in range(0,N-1):
    y[k+1]=y[k]/(1+20*h)
    t[k+1]=t[k]+h

plt.plot(t,y,'r--',label='h=0.1 (backward Euler)')

plt.legend()
plt.xlabel('t')
plt.title('Explicit vs. backward Euler, RK45, RK23 ')
plt.grid()