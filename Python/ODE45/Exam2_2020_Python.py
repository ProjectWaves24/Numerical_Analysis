import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
from funcsystem_ode45exam22020_Python import funcsystem_ode45exam22020
from func1_sysexam22020_Python import func1_sysexam22020
from func2_sysexam22020_Python import func2_sysexam22020
from func3_sysexam22020_Python import func3_sysexam22020

N=1000
y0=[0,-1,0]   #initial values

t0=0        #time interval
ts=0.3
t=np.linspace(t0,ts,N)

sol=isc.solve_ivp(funcsystem_ode45exam22020,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'b-',label='y1, RK45')
plt.plot(t,sol.y[1],'r-',label='y2, RK45')
plt.plot(t,sol.y[2],'c-',label='y3, RK45')
plt.xlabel('t')

plt.title('dy_1/dt= y_2  +2t, dy_2/dt= y_1 - 2t y_1 + y_2 -t +1,y_1(0)=0,y_2(0)=-1')
plt.grid()

#Forward Euler method

h=(ts-t0)/N
y1=np.linspace(t0,ts,N)
y2=np.linspace(t0,ts,N)
y3=np.linspace(t0,ts,N)
y1[0]=0                 #initial values
y2[0]=-1
y3[0]=0

for k in range(0,N-1):
    y1[k+1]=y1[k]+h*func1_sysexam22020(t[k],y1[k],y2[k],y3[k])
    y2[k+1]=y2[k]+h*func2_sysexam22020(t[k],y1[k],y2[k],y3[k])
    y3[k+1]=y3[k]+h*func3_sysexam22020(t[k],y1[k],y2[k],y3[k])
    #t[k+1]=t[k]+h

plt.plot(t,y1,'b--',label='y1, expl.Euler')
plt.plot(t, y2,'r--',label='y2, expl.Euler')
plt.plot(t, y3,'c--',label='y3, expl.Euler')
plt.legend()
plt.title("Forward Euler method vs. RK45 (h={:.5g})".format(h))