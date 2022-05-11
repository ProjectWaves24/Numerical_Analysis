import numpy as np
import matplotlib.pyplot as plt


fun =lambda x:((x-1)*(x-2)*(x-3)*(x-4))/(1*2*3*4)

fun=lambda x:x/np.abs(x)

    #Interpolation interval
n= -2
p= 2

    #Number of interpolation points
N = 10
x = np.linspace(n, p, N)
x_exact=np.linspace(n,p,1000)

func_val=np.zeros(N)
l=np.zeros(N)
l_nom=np.zeros(N)
l_denom=np.zeros(N)

# beräknar y_k = func_val(x(i)) för interpolation
for i in range(0,N):
    func_val[i] =fun(x[i])

def interpolationFunc(xvalue):
    value=0
    for term in range(0,N):
        basisPol=1
        for product in range(0,N):
            if product!=term:
                basisPol=basisPol*(xvalue-x[product])/(x[term]-x[product])
        value=value+fun(x[term])*basisPol
    return value

func_exact=np.zeros(len(x_exact))
Lagrange_pol=np.zeros(len(x_exact))
fellog=np.zeros(len(x_exact))
fel=np.zeros(len(x_exact))


for i in range(0,len(x_exact)):
    func_exact[i]=fun(x_exact[i])
    
    Lagrange_pol[i]=interpolationFunc(x_exact[i])
    
    fellog[i]=np.log10(np.abs(Lagrange_pol[i]-func_exact[i]))
    fel[i]=np.abs(Lagrange_pol[i]-func_exact[i])

plt.figure()
plt.plot(x_exact,func_exact,'r-',label='exact')

plt.plot(x,func_val,'b-o',label='linear interpolation')

plt.plot(x_exact,Lagrange_pol,'g-',label='interpolation på Lagranges form')

plt.xlabel('x')
plt.ylabel('funktion f(x)')
plt.legend()
plt.title('(t-1)(t-2)(t-3)(t-4)/4!')

#******************** plot för föreläsningar

plt.figure()

plt.plot(x_exact,func_exact,'r-',label='exakt f(x)')

plt.plot(x,func_val,'g-o',label='interp.punkter')

plt.xlabel('x')
plt.ylabel('funktion f(x)')
plt.legend()
plt.title('(t-1)(t-2)(t-3)(t-4)/4!')

# interpolation i Chebyshevpunkterna

cheb=np.zeros(N)
func_cheb=np.zeros(N)

for k in range(0,N):
    cheb[k]=-((p-n)/2)*np.cos(((2*k+1)*np.pi)/(2*N))+(n+p)/2
    
    x[k]=cheb[k]
    func_cheb[k]=fun(x[k])
    
fellog_cheb=np.zeros(len(x_exact))
fel_cheb=np.zeros(len(x_exact))
    
for i in range(0,len(x_exact)):
    func_exact[i]=fun(x_exact[i])

    Lagrange_pol[i] = interpolationFunc(x_exact[i])

    fellog_cheb[i]=np.log10(np.abs(Lagrange_pol[i]-func_exact[i]))
    fel_cheb[i]=np.abs(Lagrange_pol[i]-func_exact[i])
    
plt.figure()
    
plt.plot(x_exact,func_exact,'r-',label='exakt')

plt.plot(x,func_cheb,'b-o',label='Chebyshevpunkter linear interpolation')

plt.plot(x_exact,Lagrange_pol, 'g-',label='interpolation på Lagranges form i Chebyshevpunkter')

plt.xlabel('x')
plt.ylabel('funktion f(x)')
plt.legend(prop={'size':9})

#plt.title('x(1)={:.5g}, x(2)={:.5g}'.format(x[0],x[1]))
plt.title('(t-1)(t-2)(t-3)(t-4)/4!')

plt.figure()

plt.plot(x_exact,fel_cheb,'r-',label='Fel med Chebyshevpunkter')

plt.plot(x_exact,fel,'b-',label='Fel med ekvidistanta punkter')
plt.xlabel('x')
plt.ylabel('fel:|LagrangePolyn-exakt|')
plt.legend()

plt.title('(t-1)(t-2)(t-3)(t-4)/4!')

plt.figure()

plt.plot(x_exact,fellog_cheb,'r-',label='Log10-fel med Chebyshevpunkter')

plt.plot(x_exact,fellog,'b-',label='Log10-fel med ekvidistanta punkter')
plt.xlabel('x')
plt.ylabel('fel:log10|LagrangePolyn-exakt|')
plt.legend()