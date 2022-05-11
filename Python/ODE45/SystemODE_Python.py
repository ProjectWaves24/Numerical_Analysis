import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
import numpy.linalg as ln
from func_system_Python import func_system
from func_systemnoise_Python import func_systemnoise

y0=[1,-1,2,3,-4]   #initial values
t0=0       #time interval
ts=2

#step-size h
h=0.1

N=int((ts-t0)/h)
t=np.linspace(t0,ts,N)
sol=isc.solve_ivp(func_system,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'r-',label='f_1(t,y)')
plt.plot(t,sol.y[1],'g-',label='f_2(t,y)')
plt.plot(t,sol.y[2],'b-',label='f_3(t,y)')
plt.plot(t,sol.y[3],'y-',label='f_4(t,y)')
plt.plot(t,sol.y[4],'k-',label='f_5(t,y)')

sol=isc.solve_ivp(func_systemnoise,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'r--',label='f_1(t,y)+ 0.01 t')
plt.plot(t,sol.y[1],'g--',label='f_2(t,y)+ 0.01 t')
plt.plot(t,sol.y[2],'b--',label='f_3(t,y)+ 0.01 t')
plt.plot(t,sol.y[3],'y--',label='f_4(t,y)+ 0.01 t')
plt.plot(t,sol.y[4],'k--',label='f_5(t,y)+ 0.01 t')

plt.legend()

plt.xlabel('t')
plt.ylabel('y(t)')

plt.title('Stabilitet för system i övningen')
