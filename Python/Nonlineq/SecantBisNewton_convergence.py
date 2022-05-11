
import numpy as np #Basic linear algebra
import matplotlib.pyplot as plt #Plotting


tol = 10*10**(-15)
def f(x):
    return x**10 - 10**10 
def f_prime(x):
    return 10*x**9
#%%
#Halveringsmetoden

n=0 #intervall
p=10**10
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
plt.plot(i,halvering,"r.-",label="Halveringsmetoden")
plt.legend()
#%%
x0 = 5
x1 = 7
sekant_x=[]
sekant=[]
sekant_x.append(x0);sekant_x.append(x1)
sekant.append(f(x0));sekant.append(f(x1))
k2 = 2 #gissningar räknas som iteration
while abs(x1-x0)>tol:
    x = x1-f(x1)*((x0-x1)/(f(x0)-f(x1)))
    x0 = x1
    x1 = x
    sekant_x.append(x)
    sekant.append(f(x)) #spara f(x) i array för senare plot
    k2 += 1
i2=np.linspace(1,k2,k2) #stara från 1 iteration
plt.plot(i2,sekant,"bo-",label="Sekantmetoden") #plotta antal iteration och f(x)
plt.legend()
#%%

y0=10**10 #första gissning 
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
plt.plot(i3,newton,"c*-",label="Newtons metod")
plt.legend()

plt.xlabel('iteration')
plt.ylabel('funktion x**10 - 10**10')

plt.title('Sekant, halvering  och Newton  för x(1)=' f'{sekant_x[0]}' ',x(2)=' f'{sekant_x[1]}')