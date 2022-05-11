import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt
from func_example2_Python import func_example2

y0=[2,-1,0]     #initial values
t0=3
ts=10
t=np.linspace(t0,ts,100)

sol=isc.solve_ivp(func_example2,[t0,ts],y0,'RK45',t)

plt.plot(t,sol.y[0],'k-',label="y")
plt.plot(t,sol.y[1],'r-',label="y'")
plt.plot(t,sol.y[2],'b-',label="y''")
plt.legend()
plt.xlabel('t')
plt.title('System av ODE: exempel')
plt.grid()