import numpy as np
import scipy.integrate as isc

#fun = lambda x: np.exp(-0.1*x**2)*np.sin(5*x)
#fun = lambda x: np.exp(-x**2)
#fun = lambda x: x**(0.3)
fun = lambda x: x+5

#Definitionen av integration över intervallet [n,p]

n=0;
p=5

print('Computed integral using Pythons function isc.quad')
Q = isc.quad(fun,n,p)
print(Q[0])

print('Computed integral using Pythons function isc.quadrature')
Adapt = isc.quadrature(fun,n,p)
print(Adapt[0])


x=[0,0,0]

x[0]=-np.sqrt(3/5)
x[1]=0
x[2]=np.sqrt(3/5)

t=[0,0,0]

for i in range(0,3):
    t[i]=((p-n)/2)*x[i]+(p+n)/2

omega=[0,0,0]
omega[0]=5/9
omega[1]=8/9
omega[2]=5/9

print('Computed integral via 3 Gauss points')

Int=((p-n)/2)*(omega[0]*fun(t[0])+omega[1]*fun(t[1])+omega[2]*fun(t[2]))
print(Int)