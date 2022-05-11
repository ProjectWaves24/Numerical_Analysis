
import numpy as np #Basic linear algebra
import matplotlib.pyplot as plt #Plotting


tolerance = 10**(-15)
def f(x):
    return x**2 -x -2

def f2(x):
    return np.sqrt(x +2)


N=100 #start array of 100-ones 
y=np.ones(N)
y[0]=-1 #start guess


iteration_fixpunkt = []
func_fixpunkt = np.ones(N)
k=0 #index for array + interation

while abs(y[k]-y[k-1])>tolerance: #Fixtpoint iteration
    y[k+1] = f2(y[k]) #
    func_fixpunkt[k] =f2(y[k])
    k = k+1
    iteration_fixpunkt.append(k)
    if k > 100: break

func_fixpunkt=func_fixpunkt[:k] #remove extra ones from array after loop

plt.figure(0)
plt.plot(iteration_fixpunkt,func_fixpunkt, 'bo-',label="solution:" f'{func_fixpunkt[k-1]}')
plt.xlabel('iteration')
plt.ylabel('konvergens')
plt.legend()
plt.title('Fixpunktmetod, konvergens (iterations):' f'{k}')
plt.grid()

n= -2.0
p=3.0
x_exact = np.linspace(n,p,100)
N = len(x_exact)
func_exact=np.zeros(N)

for i in range(0,N):
    func_exact[i] =f(x_exact[i])

plt.figure(1)

plt.plot(x_exact,func_exact, 'b-',label=' x^2 - x - 2= 0 ')

plt.xlabel('  x')
plt.ylabel('function x^2 - x- 2 = 0 ')
plt.legend()
plt.grid()

