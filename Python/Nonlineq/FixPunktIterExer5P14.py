
import numpy as np #Basic linear algebra
import matplotlib.pyplot as plt #Plotting


tolerance = 10**(-15)
def f(x):
    return x**2 -x -2

def f2(x):
    return np.sqrt(x +2)

def f3(x):
    return 1 + 2/x

def f4(x):
    return (x**2 + 2)/(2*x -1)

N=100 #start array of 100-ones 
y2=np.ones(N); y3=np.ones(N); y4=np.ones(N)
y2[0]=2.5; y3[0]=2.5; y4[0]=2.5 #start guess


iteration_fixpunkt = []
func_fixpunkt = np.ones(N)
k=0 #index for array + interation

#y2
while abs(y2[k]-y2[k-1])>tolerance: #Fixtpoint iteration
    y2[k+1] = f2(y2[k]) #
    func_fixpunkt[k] =f2(y2[k])
    k = k+1
    iteration_fixpunkt.append(k)
    if k > 100: break

func_fixpunkt=func_fixpunkt[:k] #remove extra ones from array after loop
plt.figure(0)
plt.plot(iteration_fixpunkt,func_fixpunkt, 'bo-',label="y2 konv.iter:"
         f'{k}' ",solution:" f'{func_fixpunkt[k-1]}')

#y3
iteration_fixpunkt = [] #reset
func_fixpunkt = np.ones(N)
k=0
while abs(y3[k]-y3[k-1])>tolerance: 
    y3[k+1] = f3(y3[k]) #
    func_fixpunkt[k] =f3(y3[k])
    k = k+1
    iteration_fixpunkt.append(k)
    if k > 100: break

func_fixpunkt=func_fixpunkt[:k] 
plt.plot(iteration_fixpunkt,func_fixpunkt, 'co--',label="y3 konv.iter:"
         f'{k}' ",solution:" f'{func_fixpunkt[k-1]}')

#y4
iteration_fixpunkt = [] #reset
func_fixpunkt = np.ones(N)
k=0
while abs(y4[k]-y4[k-1])>tolerance: 
    y4[k+1] = f4(y4[k]) #
    func_fixpunkt[k] =f4(y4[k])
    k = k+1
    iteration_fixpunkt.append(k)
    if k > 100: break

func_fixpunkt=func_fixpunkt[:k] 

plt.plot(iteration_fixpunkt,func_fixpunkt, 'ro-',label="y4 konv.iter:"
         f'{k}' ",solution:" f'{func_fixpunkt[k-1]}')
plt.xlabel('iteration')
plt.ylabel('function ')
plt.grid()
plt.legend()


n = -1.0
p = 3.0
x_exact = np.linspace(n,p,100);
func_exact=np.ones(len(x_exact))
M = len(x_exact)
for i in range(0,M):
    func_exact[i] =f(x_exact[i])
plt.figure(1)
plt.plot(x_exact,func_exact,"b-",label="x*np.sin(x)-1=0")
plt.xlabel('x')
plt.ylabel('function x**2-x-2=0')
plt.legend()