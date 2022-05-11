import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
import numpy.linalg as ln

from func_Python import func

y0=[0.1]   #initial values
t0=0        #time interval
ts=2

#step-size h

h=0.1
N=int((ts-t0)/h)
t=np.linspace(t0,ts,N)
sol=isc.solve_ivp(func,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'b-o',label='RK45')

y=0

#Forward Euler method

t=np.linspace(t0,ts,N+1)
y=np.linspace(t0,ts,N+1)

y[0]=0.1        #initial values

for k in range(0,N):
    y[k+1]=y[k]+h*func(t[k],y[k])
    t[k+1]=t[k]+h

plt.plot(t,y,'g-o',label='Explicit Eulers')

#Two-step method of order 2
y=0
y=np.linspace(t0,ts,N+1)
t=np.linspace(t0,ts,N+1)
y[0]=0.1        #initial values
for k in range(0,N):
    if k==0:
        y[k+1]=y[k]+h*func(t[k],y[k])
    else:
        y[k+1]=y[k]+(3/2)*h*func(t[k],y[k])-0.5*h*func(t[k-1],y[k-1])
    t[k+1]=t[k]+h

plt.plot(t,y,'c-o',label='Two-step')

#Three-step method of order 3
y=0
y=np.linspace(t0,ts,N+1)
y[0]=0.1        #initial values

for k in range(0,N):
    if k==0 or k==1:
        y[k+1]=y[k]+h*func(t[k],y[k])
    else:
        y[k+1]=y[k]+(23/12)*h*func(t[k],y[k])-4/3*h*func(t[k-1],y[k-1])+(5/12)*h*func(t[k-2],y[k-2])
    t[k+1]=t[k]+h

plt.plot(t,y,'r-o',label='Three-step')

#Heuns metod

y=np.linspace(t0,ts,N+1)
t=np.linspace(t0,ts,N+1)

y[0]=0.1        #initial values

for k in range(0,N):
    val=y[k]+h*func(t[k],y[k])
    y[k+1]=y[k]+0.5*h*(func(t[k],y[k])+func(t[k]+h,val))
    t[k+1]=t[k]+h

plt.plot(t,y,'y-o',label='Heuns')

plt.legend()

plt.title('dy/dt=y, h=0.1')