import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
import numpy.linalg as ln
from func_stiff_Python import func_stiff

y0=[1]   #initial values
t0=0       #time interval
ts=1

#step-size h
h=0.2

N=int((ts-t0)/h)
t=np.linspace(t0,ts,N)
sol=isc.solve_ivp(func_stiff,[t0,ts],y0,'RK23',t)

plt.plot(t,sol.y[0],'r-',label='RK23')

y=0

#Forward Euler method

t=np.linspace(t0,ts,N+1)
y=np.linspace(t0,ts,N+1)

y[0]=1      #initial values

for k in range(0,N):
    y[k+1]=y[k]+h*func_stiff(t[k],y[k])
    t[k+1]=t[k]+h

plt.plot(t,y,'b-o',label='Explicit Euler ')

plt.legend()
plt.title('dy/dt= -15 y, y(0)=1, h={:.5g}'.format(h))
