import numpy as np
import scipy.integrate as isc

fun =lambda x: np.exp(-0.1*x**2)*np.sin(5*x)
#fun =lambda x: np.exp(-x**2)

# definition av integration intervalet [n,p]

n= 0
p= 5

#Snabbare men mindre exakt variant
Q1 =  isc.quadrature(fun,n,p)[0];
#Generell integraleräknare
Q =  isc.quad(fun,n,p)[0];


fun_exact = 0
fun_calc = 0

x_exact = np.linspace(n, p, 71)
N = len(x_exact)

func_exact=np.zeros(N)

h=(p-n)/(N-1)

for i in range(1,N):
    func_exact[i]=fun(x_exact[i])
    
    #fellog[i]=np.log10(np.abs(Lagrange_pol[i]-func_exact[i]))
    #fel[i]=np.abs(Lagrange_pol[i]-func_exact[i])
    
int_simpson=0

final_index=int((N-1)/2)

#Simpson's method
for i in range(1,final_index+1):
    int_simpson=int_simpson+(fun(x_exact[2*i-2])+4*fun(x_exact[2*i-1])+fun(x_exact[2*i]))

int_simpson=(int_simpson*h)/3
print(int_simpson)