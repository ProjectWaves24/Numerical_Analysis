import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
import numpy.linalg as ln
from func_exam22018_Python import func_exam22018
from func1_exam22018_Python import func1_exam22018
from func2_exam22018_Python import func2_exam22018

N=100
y0=[0,-1]   #initial values
t0=0        #time interval
ts=2
t=np.linspace(t0,ts,N)

sol=isc.solve_ivp(func_exam22018,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'b-',label='y1, RK45')
plt.plot(t,sol.y[1],'r-',label='y2, RK45')
plt.xlabel('t')

plt.title('dy_1/dt= y_2, dy_2/dt= y_1 + y_2,y_1(0)=0,y_2(0)=-1')


#Forward Euler method

h=(ts-t0)/N
y1=np.linspace(t0,ts,N)
y2=np.linspace(t0,ts,N)
y1[0]=0                #initial values
y2[0]=-1

for k in range(0,N-1):
    y1[k+1]=y1[k]+h*func1_exam22018(t[k],y1[k],y2[k])
    y2[k+1]=y2[k]+h*func2_exam22018(t[k],y1[k],y2[k])
    #t[k+1]=t[k]+h

plt.plot(t,y1,'b--',label='y1, expl.Euler')
plt.plot(t, y2,'r--',label='y2, expl.Euler')

#Backward Euler method

N=100
dt=(ts-t0)/N
t=np.linspace(t0,ts,N)

A=[]
A=np.array([[1,-dt],[-dt,1-dt]])

x=np.zeros(2)
xnew=np.zeros(2)
x[0]=0
x[1]=-1
sol1=np.linspace(t0,ts,N)
sol2=np.linspace(t0,ts,N)

sol1[0]=x[0]
sol2[0]=x[1]

for k in range(0,N-1):
    xnew=np.dot(ln.inv(A),x)
    sol1[k+1]=xnew[0]
    sol2[k+1]=xnew[1]
    x=xnew

plt.plot(t,sol1,'g--',label='y1, impl.Euler')
plt.plot(t,sol2,'g-',label='y2, impl.Euler')

plt.legend(loc=6)
plt.title("Forward Euler method vs. RK45 (h={:.5g})".format(h))

plt.text(0.25,-16,'dy_1/dt= y_2, dy_2/dt= y_1 + y_2')
plt.text(0.25,-18,'y_1(0)=0,y_2(0)=-1')