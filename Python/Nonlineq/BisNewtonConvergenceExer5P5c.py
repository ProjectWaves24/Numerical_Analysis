
import numpy as np #Basic linear algebra
import matplotlib.pyplot as plt #Plotting

tol = 10*10**(-15)
def f(x):
    return x*np.sin(x) -1
def f_prime(x):
    return x*np.cos(x) + np.sin(x)

#Halveringsmetoden

n=-1 #intervall
p=11
halvering_x=[]
halvering=[]
k=0
while abs(n-p)>tol:
    m = (n+p)/2
    if f(m)<0:
        n=m
    else:
        p=m
    halvering_x.append(p)
    halvering.append(f(p))
    k += 1

i=np.linspace(1,k,k) #stara från 1 iteration
plt.figure(0) #Index figur
plt.plot(i,halvering,"r.-",label="Halveringsmetoden")
plt.xlabel('iteration')
plt.ylabel('function x*np.sin(x)-1=0')
plt.title('Halveringsmetoden, konvergens (iterations):' f'{k}')
plt.legend()


y0=1.5 #första gissning 
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
plt.figure(1)
plt.plot(i3,newton,"c*-",label="Newtons metod")
plt.xlabel('iteration')
plt.ylabel('function x*np.sin(x)-1=0')
plt.title('Newtons metod, konvergens (iterations):' f'{k3}')
plt.legend()


n = -1.0
p = 3.0
x_exact = np.linspace(n,p,100);
func_exact=np.ones(len(x_exact))
N = len(x_exact)
for i in range(0,N):
    func_exact[i] =f(x_exact[i])
plt.figure(2)
plt.plot(x_exact,func_exact,"b-",label="x*np.sin(x)-1=0")
plt.xlabel('x')
plt.ylabel('function x*np.sin(x)-1=0')
plt.legend()

