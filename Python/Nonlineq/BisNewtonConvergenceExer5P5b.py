
import numpy as np #Basic linear algebra
import matplotlib.pyplot as plt #Plotting

tol = 10*10**(-16)
def f(x):
    return np.exp(-x) -x
def f_prime(x):
    return -1*np.exp(-x) -1

t=np.linspace(-1,1,50)
b=f(t)

y0=0.5 #första gissning 
y=y0-f(y0)/f_prime(y0)
newton_x=[]
newton=[]
newton_x.append(y0); newton_x.append(y)
newton.append(f(y0)); newton.append(f(y))
k3=2

while abs(y-y0)>tol:
    y0=y
    y=y0-f(y0)/f_prime(y0)
    newton_x.append(y)
    newton.append(f(y))
    k3 += 1

i3=np.linspace(1,k3,k3) #stara från 1 iteration
plt.figure(0)
plt.plot(i3,newton,"c*-",label="Newtons metod")
plt.xlabel('iteration')
plt.ylabel('function e**(-x)-x=0')
plt.title('Newtons metod, konvergens (iterations):' f'{k3}')
plt.legend()
plt.grid()


n = -1.0
p = 1.0
x_exact = np.linspace(n,p,100);
func_exact=np.ones(len(x_exact))
N = len(x_exact)
for i in range(0,N):
    func_exact[i] =f(x_exact[i])
plt.figure(1)
plt.plot(x_exact,func_exact,"b-",label="e**(-x)-x=0")
plt.xlabel('x')
plt.ylabel('function e**(-x)-x=0')
plt.title('Exact function e**(-x)-x')
plt.legend()
plt.grid()

