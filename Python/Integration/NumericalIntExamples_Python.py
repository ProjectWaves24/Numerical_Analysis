 #--------------------------------------------------------------------
 # Python code which illustrates
 # how to compute integral int_a^b fun(x) dx
 # using  Python's functions quad, trapezoid, as well as composite
 # trapezoidal rule, composite rectangle  method,
 # and composite Simpson's rule.
 #----------------------------------------------------------------------
import numpy as np
import scipy.integrate as isc
from FuncTrapets_Python import FuncTrapets
from FuncRectangle_Python import FuncRectangle
from FuncSimpson_Python import FuncSimpson

fun =lambda x: np.exp(-0.1*x**2)*np.sin(5*x)
#fun =lambda x: np.exp(-x**2)

# definition av integration intervalet [n,p]

a= 0
b= 5

#Snabbare men mindre exakt variant
int_quadrature =  isc.quadrature(fun,a,b)[0];
#Generell integraleräknare
int_quad =  isc.quad(fun,a,b)[0];

x_calc = np.linspace(a, b, 101);
fun_calc=np.zeros(101)

for i in range(1,101):
    fun_calc[i] =fun(x_calc[i]);

int_trapz =  isc.trapezoid(fun_calc,x_calc)
print(int_trapz)

int_trapets = FuncTrapets(fun,a,b,101)
print(int_trapets)

int_rectangle = FuncRectangle(fun,a,b,101)
print(int_rectangle)
  
int_simpson = FuncSimpson(fun,a,b,101)
print(int_simpson)
  
