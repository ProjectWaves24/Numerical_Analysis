import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
import numpy.linalg as ln
from func_example4_Python import func_example4

y0=[1]   #initial values
t0=0        #time interval
ts=2

#step-size h

h=0.5
N=int((ts-t0)/h)
t=np.linspace(t0,ts,N+1)
sol=isc.solve_ivp(func_example4,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'b-o',label='h=0.5 (RK45)')

h=0.25
N=int((ts-t0)/h)
t=np.linspace(t0,ts,N+1)
sol=isc.solve_ivp(func_example4,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'g-o',label='h=0.25 (RK45)')

h=0.125
N=int((ts-t0)/h)
t=np.linspace(t0,ts,N+1)
sol=isc.solve_ivp(func_example4,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'r-*',label='h=0.125 (RK45)')

plt.legend()


tode45=t
y_ode45=sol.y[0]

#sol=isc.solve_ivp(func_example4,[-1,5],[1],'RK45',tode45,rtol=1e-4,atol=[1e-4]))

plt.xlabel('t')

plt.title('RK45: exempel')
plt.grid()

#Forward Euler method

h=0.5
N=1+int((ts-t0)/h)
y=np.linspace(t0,ts,N)
t=np.linspace(t0,ts,N)
y[0]=1                 #initial values

for k in range(0,N-1):
    y[k+1]=y[k]+h*func_example4(t[k],y[k])
    t[k+1]=t[k]+h

plt.figure()
plt.plot(t,y,'g-o',label='h=0.5 (Euler)')

h=0.25
N=1+int((ts-t0)/h)
y=np.linspace(t0,ts,N)
t=np.linspace(t0,ts,N)
y[0]=1                 #initial values

for k in range(0,N-1):
    y[k+1]=y[k]+h*func_example4(t[k],y[k])
    t[k+1]=t[k]+h

plt.plot(t,y,'b-o',label='h=0.25 (Euler)')

h=0.125
N=1+int((ts-t0)/h)
y=np.linspace(t0,ts,N)
t=np.linspace(t0,ts,N)
y[0]=1                 #initial values

for k in range(0,N-1):
    y[k+1]=y[k]+h*func_example4(t[k],y[k])
    t[k+1]=t[k]+h

plt.plot(t,y,'r-o',label='h=0.125 (Euler)')

plt.plot(tode45,y_ode45,'r-',label='h=0.125 (RK45)')

#Backward Euler method

h=0.125
N=1+int((ts-t0)/h)
t=np.linspace(ts,t0,N)
y=np.linspace(ts,t0,N)
y[0]=1          #initial values
t[0]=0

for k in range(0,N-1):
    y[k]=y[k]+h*t[k]+h*h
    y[k+1]=y[k]/(1-2*h)
    
    t[k+1]=t[k]+h

plt.plot(t,y,'c--',label='h=0.125 (backward Euler)')

plt.legend()
plt.title('Eulers metod vs. RK45')
plt.grid()