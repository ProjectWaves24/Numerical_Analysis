import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
import numpy.linalg as ln
from exam32019_ode45_Python import exam32019_ode45
from exam32019_func1_sys_Python import exam32019_func1_sys
from exam32019_func2_sys_Python import exam32019_func2_sys

N=400
y0=[0,0]   #initial values
t0=5        #time interval
ts=10
t=np.linspace(t0,ts,N)

sol=isc.solve_ivp(exam32019_ode45,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'b-',label='x, RK45')
plt.plot(t,sol.y[1],'r-',label='y, RK45')
plt.xlabel('t')

plt.title('dx/dt= 5x(t) - 2y(t) + 2t, dy/dt= x(t) + y(t) + t + 1, x(5)=0, y(5)=0')
plt.grid()

#Forward Euler method


h=(ts-t0)/N
t=np.linspace(t0,ts,N)
y1=np.linspace(t0,ts,N)
y2=np.linspace(t0,ts,N)
y1[0]=y0[0]                #initial values
y2[0]=y0[1]

for k in range(0,N-1):
    y1[k+1]=y1[k]+h*exam32019_func1_sys(t[k],y1[k],y2[k])
    y2[k+1]=y2[k]+h*exam32019_func2_sys(t[k],y1[k],y2[k])
    #t[k+1]=t[k]+h

plt.plot(t,y1,'b--',label='x, expl.Euler')
plt.plot(t, y2,'r--',label='y, expl.Euler')

#Backward Euler method

dt=(ts-t0)/N
t=np.linspace(t0,ts,N)

A=[]
A=np.array([[1-5*dt,2*dt],[-dt,1-dt]])

x=np.zeros(2)
xnew=np.zeros(2)
x[0]=y0[0]
x[1]=y0[1]
sol1=np.linspace(t0,ts,N)
sol2=np.linspace(t0,ts,N)
    #for visualization
sol1[0]=x[0]
sol2[0]=x[1]

rhs=[0,0]

for k in range(0,N-1):
    
    rhs[0]=x[0]+2*dt*t[k]+2*dt*dt
    rhs[1]=x[1]+dt*t[k]+dt*dt+dt
    
    xnew=np.dot(ln.inv(A),rhs)
#  for visualization of results     
    sol1[k+1]=xnew[0]
    sol2[k+1]=xnew[1]
    x=xnew
    #t[k+1]=t[k]+dt

plt.plot(t,sol1,'g--',label='x, impl.Euler')
plt.plot(t,sol2,'g-',label='y, impl.Euler')

plt.legend()
plt.title("Nr. points N={:.5g}, mesh size dt={:.5g}".format(N,dt))