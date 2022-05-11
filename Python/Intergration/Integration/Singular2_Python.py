import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt

fun=lambda x: x**(1/0.3)

# definition av integration intervalet [n,p]

n= 0
p= 1

#Snabbare men mindre exakt variant
Q1 =  isc.quadrature(fun,n,p)[0];
#Generell integraleräknare
Q =  isc.quad(fun,n,p)[0];

fun_exact = 0
x_exact = np.linspace(n, p, 100)
N = len(x_exact)

fun_calc=[0,0,0]
m=(n+p)/2
x_calc=[n,m,p]
N_calc=3

func_exact=np.zeros(N)

#Simpsons formel: 1 - simpsons formula har vi p.g.a. parametriseringen

int_simpson=((p-n)/6)*(fun(n)+4*fun(m)+fun(p))

for i in range(0,N):
    func_exact[i]=1-fun(x_exact[i])


for i in range(0,N_calc):
    frac1=((x_calc[i]-m)*(x_calc[i]-p))/((n-m)*(n-p))
    
    frac2=((x_calc[i]-n)*(x_calc[i]-p))/((m-n)*(m-p))
    
    frac3=((x_calc[i]-n)*(x_calc[i]-m))/((p-n)*(p-m))
    
    fun_calc[i]=1-(fun(n)*frac1+fun(m)*frac2+fun(p)*frac3)

# trapetsmetoden
int_trap = isc.trapezoid(fun_calc,  x_calc);

int_trap=1-int_trap

plt.plot(x_exact,func_exact,'r-',label='exact')

for i in range(N_calc-1):
    plt.fill([x_calc[i],x_calc[i],x_calc[i+1],x_calc[i+1]],[0,fun_calc[i],fun_calc[i+1],0],'lime',edgecolor='k')
plt.fill([x_calc[0],x_calc[0],x_calc[1],x_calc[1]],[0,fun_calc[0],fun_calc[1],0],'lime',edgecolor='k',label='Area (integral)')

plt.plot(x_calc,fun_calc,'b',label='approximation')

error1=np.abs(Q-int_simpson)
error2=np.abs(Q-int_trap)

plt.xlabel('x')
plt.ylabel('funktion f(x)=x^0.3')
plt.legend(loc=1,prop={'size':10})
plt.title('Trapetsmetoden:{:.5g} Adaptive integral:{:.5g} error:{:.5g}'.format(int_trap,Q,error2))