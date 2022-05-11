import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
from funcsystem_ode45_Python import funcsystem_ode45
from func1_sys_Python import func1_sys
from func2_sys_Python import func2_sys

N=200
y0=[0,-1]   #initial values
t0=0        #time interval
ts=5
t=np.linspace(t0,ts,N)

sol=isc.solve_ivp(funcsystem_ode45,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'b-',label='y1, RK45')
plt.plot(t,sol.y[1],'r-',label='y2, RK45')
plt.xlabel('t')

plt.title('dy_1/dt= y_2  +2t, dy_2/dt= y_1 - 2t y_1 + y_2 -t +1,y_1(0)=0,y_2(0)=-1')


#Forward Euler method

h=(ts-t0)/N
y1=np.linspace(t0,ts,N)
y2=np.linspace(t0,ts,N)
y1[0]=0                 #initial values
y2[0]=-1

for k in range(0,N-1):
    y1[k+1]=y1[k]+h*func1_sys(t[k],y1[k],y2[k])
    y2[k+1]=y2[k]+h*func2_sys(t[k],y1[k],y2[k])
    #t[k+1]=t[k]+h

plt.plot(t,y1,'b--',label='y1, expl.Euler')
plt.plot(t, y2,'r--',label='y2, expl.Euler')
plt.legend()
plt.title("Forward Euler method vs. RK45 (h=0.025)")


plt.text(0,-11,'dy_1/dt= y_2  +2t, dy_2/dt= y_1 - 2t y_1 + y_2 -t +1')
plt.text(0,-13,'y_1(0)=0,y_2(0)=-1');