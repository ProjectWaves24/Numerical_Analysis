import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
from funcexam12019_ode45_Python import funcexam12019_ode45
from func1exam12019_Python import func1exam12019
from func2exam12019_Python import func2exam12019


N=100
y0=[0,0]   #initial values
t0=0        #time interval
ts=1
t=np.linspace(t0,ts,N)

sol=isc.solve_ivp(funcexam12019_ode45,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'b-',label='y1, RK45')
plt.plot(t,sol.y[1],'r-',label='y2, RK45')
plt.xlabel('t')

plt.title('dy_1/dt=  sin(y_2)  +2t, dy_2/dt= cos(y_1) - 2t y_2,y_1(0)=0,y_2(0)=0')
plt.grid()

#Forward Euler method

h=(ts-t0)/N
y1=np.linspace(t0,ts,N)
y2=np.linspace(t0,ts,N)
y1[0]=0                 #initial values
y2[0]=0

for k in range(0,N-1):
    y1[k+1]=y1[k]+h*func1exam12019(t[k],y1[k],y2[k])
    y2[k+1]=y2[k]+h*func2exam12019(t[k],y1[k],y2[k])
    #t[k+1]=t[k]+h

plt.plot(t,y1,'b--',label='y1, expl.Euler')
plt.plot(t, y2,'r--',label='y2, expl.Euler')
plt.legend()
plt.title("Forward Euler method vs. RK45 (h={:.5g})".format(h))