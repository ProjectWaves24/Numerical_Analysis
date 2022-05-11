import numpy as np
import scipy.integrate as isc
import matplotlib.pyplot as plt

#fun=lambda x:np.exp(-0.1*x**2)*np.sin(5*x)
fun=lambda x:np.exp(-x**2)

# definition av integration intervalet [n,p]

n= -3
p= 3

#Snabbare men mindre exakt variant
Q1 =  isc.quadrature(fun,n,p)[0];
#Generell integraleräknare
Q =  isc.quad(fun,n,p)[0];


fun_exact = 0
fun_calc = 0

x_exact = np.linspace(n, p, 100)
N = len(x_exact)
func_exact=np.zeros(N)

for i in range (0,N):
    func_exact[i]=fun(x_exact[i])

#fellog[i]=np.log10(np.abs(Lagrange_pol[i]-func_exact[i]))
#fel[i]=np.abs(Lagrange_pol[i]-func_exact[i])

N_calc=219

# ekvidistanta punkter
x_calc = np.linspace(n, p, N_calc);

#******************  Chebyshevpunkterna

cheb=np.zeros(N_calc)
fun_calc = np.zeros(N_calc)

for i in range(1,N_calc+1):
    cheb[i-1]=-((p-n)/2)*np.cos(((2*i-1)*np.pi)/(2*N_calc))+(n+p)/2
    x_calc[i-1]=cheb[i-1]
    fun_calc[i-1]=fun(x_calc[i-1])
    
int_calc = isc.trapezoid(fun_calc, x_calc);

plt.figure()
plt.plot(x_exact,func_exact,'r-',label='exact  e^{-x^2}')

for i in range(N_calc-1):
    plt.fill([x_calc[i],x_calc[i],x_calc[i+1],x_calc[i+1]],[0,fun_calc[i],fun_calc[i+1],0],'lime',edgecolor='k')
plt.fill([x_calc[0],x_calc[0],x_calc[1],x_calc[1]],[0,fun_calc[0],fun_calc[1],0],'lime',edgecolor='k',label='area (integral  av e^{-x^2})')

plt.plot(x_calc,fun_calc,'b',label='approximation')

plt.xlabel('x')
plt.ylabel('funktion f(x)')
plt.legend(loc=1,prop={'size':8})
plt.title('Trapetsmetoden i Chebyshevpunkter, Integral={:.5g}, N={}'.format(int_calc,N_calc))

plt.figure()
plt.plot(x_exact,func_exact,'r-')

plt.xlabel('x')
plt.ylabel('funktion f(x)=e^(-x^2)')
plt.title('exact f(x)=e^(-x^2)')

