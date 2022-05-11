import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
from funcexam12022_ode45_Python import funcexam12022_ode45
from func1exam12022_Python import func1exam12022
from func2exam12022_Python import func2exam12022

N=100
y0=[2,3]   #initial values
t0=1        #time interval
ts=np.pi
t=np.linspace(t0,ts,N)

sol=isc.solve_ivp(funcexam12022_ode45,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'b-',label='y1, RK45')
plt.plot(t,sol.y[1],'r-',label='y2, RK45')
plt.xlabel('t')

plt.title('dy_1/dt=  sin(2 \pi t)  + y_1, dy_2/dt= cos(2 \pi t) -  y_2, y_1(1)= 2, y_2(1)=3')
plt.grid()

#Forward Euler method

h=(ts-t0)/N
y1=np.linspace(t0,ts,N)
y2=np.linspace(t0,ts,N)
y1[0]=2                 #initial values
y2[0]=3

for k in range(0,N-1):
    y1[k+1]=y1[k]+h*func1exam12022(t[k],y1[k],y2[k])
    y2[k+1]=y2[k]+h*func2exam12022(t[k],y1[k],y2[k])
    #t[k+1]=t[k]+h

plt.plot(t,y1,'b--',label='y1, expl.Euler')
plt.plot(t, y2,'r--',label='y2, expl.Euler')
plt.legend()
plt.title("Forward Euler method vs. RK45 (h={:.5g})".format(h))