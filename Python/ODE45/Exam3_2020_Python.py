import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
import numpy.linalg as ln
from func_exam32020_Python import func_exam32020


N=100
y0=[0,.1]   #initial values
t0=0        #time interval
ts=2
t=np.linspace(t0,ts,N)

sol=isc.solve_ivp(func_exam32020,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'b-',label='y1, RK45')
plt.plot(t,sol.y[1],'r-',label='y2, RK45')
plt.xlabel('t')

plt.title('dy_1/dt= y_2, dy_2/dt= y_1 + y_2,y_1(0)=0,y_2(0)=-1')
plt.grid()

#Backward Euler method

dt=(ts-t0)/N
t=np.linspace(t0,ts,N)

A=[]
A=np.array([[1-dt,dt],[dt,1-dt]])

x=np.zeros(2)
xnew=np.zeros(2)
x[0]=0
x[1]=0.1
sol1=np.linspace(t0,ts,N)
sol2=np.linspace(t0,ts,N)

sol1[0]=x[0]
sol2[0]=x[1]

for k in range(0,N-1):
    xnew=np.dot(ln.inv(A),x)
    sol1[k+1]=xnew[0]
    sol2[k+1]=xnew[1]
    # new right hand side
    x[0]=  dt*t[k] + dt*dt + xnew[0];
    x[1]=  dt*t[k] + dt*dt + xnew[1];

plt.plot(t,sol1,'g--',label='y1, impl.Euler')
plt.plot(t,sol2,'g-',label='y2, impl.Euler')

plt.legend()
plt.title("Implicit Eulers metod vs. ode45 with dt ={:.5g}".format(dt))