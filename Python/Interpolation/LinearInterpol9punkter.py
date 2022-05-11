
import numpy as np
import matplotlib.pyplot as plt #Plotting
def fun(x):
    return np.exp(-1*x**2)

#definition of interpolation interval [n,p]

n= -3.0
p= 3.0

fun_exact = 0;
fun_val = 0;

# Want to interpolera in N points
N = 20

x = np.linspace(n, p, N);

x_exact = np.linspace(n, p,100);


func_val=np.zeros(N)
l=np.zeros(N)
l_nom=np.zeros(N)
l_denom=np.zeros(N)

# calc y_k = func_val(x(i)) for interpolation
for i in range(0,N):
    func_val[i] =fun(x[i])
    l[i] = 1
    l_nom[i] = 1
    l_denom[i]=1

func_exact = np.zeros(len(x_exact))
Linear_spline = np.zeros(len(x_exact))

for i in range(0,len(x_exact)):
    func_exact[i] =fun(x_exact[i])

    for k in range(0,N-1):
        
        if (x_exact[i] <= x[k+1] and x_exact[i] >= x[k]):
            nom = fun(x[k+1]) -fun(x[k])
            denom = x[k+1]-x[k]
            Linear_spline[i] = fun(x[k]) + (x_exact[i] - x[k])*(nom/denom)
    
    #fellog(i) = log10(abs(Lagrange_pol(i) - func_exact(i)));
    #fel(i) = abs(Lagrange_pol(i) - func_exact(i));

plt.plot(x_exact,func_exact, 'r-',label='exact  exp(-x^2)')

plt.plot(x, func_val,'bo',label='interpolation points')

plt.plot(x_exact,Linear_spline,'g-',label='linear interpolation')

plt.xlabel('x')
plt.ylabel('funktion f(x)')

plt.legend()

plt.title('Linear spline interpolation av exp(-x^2)  för N=' f'{N}' ' interpol.p.')




