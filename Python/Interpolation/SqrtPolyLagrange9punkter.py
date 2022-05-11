
import numpy as np
import matplotlib.pyplot as plt


def fun(x):
    return np.sqrt(x)

# definition av interpolation intervalet [n,p]

n= 0
p= 4

fun_exact = 0
fun_val = 0

# vi vill interpolera i 9 punkter
N = 9
x = np.linspace(n, p, N)

#x[2] = -2.75
#x[8] = 2.75

#x[2] = -2.6
#x[3] = -1.9
#x[7] = 1.9
#x[8] = 2.6

x_exact=np.linspace(n,p,100)

func_val=np.zeros(N)
l=np.zeros(N)
l_nom=np.zeros(N)
l_denom=np.zeros(N)

# beräknar y_k = func_val(x(i)) för interpolation
for i in range(0,N):
    func_val[i] =fun(x[i])
    l[i] = 1
    l_nom[i] = 1
    l_denom[i]=1

func_exact=np.zeros(len(x_exact))

Lagrange_pol_nom1=np.zeros(len(x_exact))
Lagrange_pol_denom1=np.zeros(len(x_exact))
Lagrange_pol1=np.zeros(len(x_exact))

Lagrange_pol_nom2=np.zeros(len(x_exact))
Lagrange_pol_denom2=np.zeros(len(x_exact))
Lagrange_pol2=np.zeros(len(x_exact))

Lagrange_pol_nom3=np.zeros(len(x_exact))
Lagrange_pol_denom3=np.zeros(len(x_exact))
Lagrange_pol3=np.zeros(len(x_exact))

Lagrange_pol_nom4=np.zeros(len(x_exact))
Lagrange_pol_denom4=np.zeros(len(x_exact))
Lagrange_pol4=np.zeros(len(x_exact))

Lagrange_pol_nom5=np.zeros(len(x_exact))
Lagrange_pol_denom5=np.zeros(len(x_exact))
Lagrange_pol5=np.zeros(len(x_exact))

Lagrange_pol_nom6=np.zeros(len(x_exact))
Lagrange_pol_denom6=np.zeros(len(x_exact))
Lagrange_pol6=np.zeros(len(x_exact))

Lagrange_pol_nom7=np.zeros(len(x_exact))
Lagrange_pol_denom7=np.zeros(len(x_exact))
Lagrange_pol7=np.zeros(len(x_exact))

Lagrange_pol_nom8=np.zeros(len(x_exact))
Lagrange_pol_denom8=np.zeros(len(x_exact))
Lagrange_pol8=np.zeros(len(x_exact))

Lagrange_pol_nom9=np.zeros(len(x_exact))
Lagrange_pol_denom9=np.zeros(len(x_exact))
Lagrange_pol9=np.zeros(len(x_exact))

Lagrange_pol=np.zeros(len(x_exact))

fellog=np.zeros(len(x_exact))
fel=np.zeros(len(x_exact))

for i in range(0,len(x_exact)):
    func_exact[i]=fun(x_exact[i])

    Lagrange_pol_nom1[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom1[i] = (x[1-1]- x[2-1])*(x[1-1]-x[3-1])*(x[1-1]-x[4-1])*(x[1-1]-x[5-1])*(x[1-1]-x[6-1])*(x[1-1]-x[7-1])*(x[1-1]-x[8-1])*(x[1-1]-x[9-1]);
    Lagrange_pol1[i] = fun(x[1-1])*(Lagrange_pol_nom1[i]/Lagrange_pol_denom1[i]);
    
    Lagrange_pol_nom2[i] =    (x_exact[i] -x[1-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom2[i] = (x[2-1]- x[1-1])*(x[2-1]-x[3-1])*(x[2-1]-x[4-1])*(x[2-1]-x[5-1])*(x[2-1]-x[6-1])*(x[2-1]-x[7-1])*(x[2-1]-x[8-1])*(x[2-1]-x[9-1]);
    Lagrange_pol2[i] = fun(x[2-1])*(Lagrange_pol_nom2[i]/Lagrange_pol_denom2[i]);
        
    Lagrange_pol_nom3[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[1-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom3[i] = (x[3-1]- x[2-1])*(x[3-1]-x[1-1])*(x[3-1]-x[4-1])*(x[3-1]-x[5-1])*(x[3-1]-x[6-1])*(x[3-1]-x[7-1])*(x[3-1]-x[8-1])*(x[3-1]-x[9-1]);
    Lagrange_pol3[i] = fun(x[3-1])*(Lagrange_pol_nom3[i]/Lagrange_pol_denom3[i]);
    
    Lagrange_pol_nom4[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[1-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom4[i] = (x[4-1]- x[2-1])*(x[4-1]-x[3-1])*(x[4-1]-x[1-1])*(x[4-1]-x[5-1])*(x[4-1]-x[6-1])*(x[4-1]-x[7-1])*(x[4-1]-x[8-1])*(x[4-1]-x[9-1]);
    Lagrange_pol4[i] = fun(x[4-1])*(Lagrange_pol_nom4[i]/Lagrange_pol_denom4[i]);
    
    Lagrange_pol_nom5[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[1-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom5[i] = (x[5-1]- x[2-1])*(x[5-1]-x[3-1])*(x[5-1]-x[4-1])*(x[5-1]-x[1-1])*(x[5-1]-x[6-1])*(x[5-1]-x[7-1])*(x[5-1]-x[8-1])*(x[5-1]-x[9-1]);
    Lagrange_pol5[i] = fun(x[5-1])*(Lagrange_pol_nom5[i]/Lagrange_pol_denom5[i]);
    
    Lagrange_pol_nom6[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[1-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom6[i] = (x[6-1]- x[2-1])*(x[6-1]-x[3-1])*(x[6-1]-x[4-1])*(x[6-1]-x[5-1])*(x[6-1]-x[1-1])*(x[6-1]-x[7-1])*(x[6-1]-x[8-1])*(x[6-1]-x[9-1]);
    Lagrange_pol6[i] = fun(x[6-1])*(Lagrange_pol_nom6[i]/Lagrange_pol_denom6[i]);
    
    Lagrange_pol_nom7[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[1-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom7[i] = (x[7-1]- x[2-1])*(x[7-1]-x[3-1])*(x[7-1]-x[4-1])*(x[7-1]-x[5-1])*(x[7-1]-x[6-1])*(x[7-1]-x[1-1])*(x[7-1]-x[8-1])*(x[7-1]-x[9-1]);
    Lagrange_pol7[i] = fun(x[7-1])*(Lagrange_pol_nom7[i]/Lagrange_pol_denom7[i]);
    
    Lagrange_pol_nom8[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[1-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom8[i] = (x[8-1]- x[2-1])*(x[8-1]-x[3-1])*(x[8-1]-x[4-1])*(x[8-1]-x[5-1])*(x[8-1]-x[6-1])*(x[8-1]-x[7-1])*(x[8-1]-x[1-1])*(x[8-1]-x[9-1]);
    Lagrange_pol8[i] = fun(x[8-1])*(Lagrange_pol_nom8[i]/Lagrange_pol_denom8[i]);
    
    Lagrange_pol_nom9[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[1-1])
    Lagrange_pol_denom9[i] = (x[9-1]- x[2-1])*(x[9-1]-x[3-1])*(x[9-1]-x[4-1])*(x[9-1]-x[5-1])*(x[9-1]-x[6-1])*(x[9-1]-x[7-1])*(x[9-1]-x[8-1])*(x[9-1]-x[1-1]);
    Lagrange_pol9[i] = fun(x[9-1])*(Lagrange_pol_nom9[i]/Lagrange_pol_denom9[i]);    
    
    Lagrange_pol[i] = Lagrange_pol1[i]+Lagrange_pol2[i]+Lagrange_pol3[i]+Lagrange_pol4[i]+Lagrange_pol5[i]+Lagrange_pol6[i]+Lagrange_pol7[i]+Lagrange_pol8[i]+Lagrange_pol9[i];

    fellog[i]=np.log10(np.abs(Lagrange_pol[i]-func_exact[i])) 
    fel[i]=np.abs(Lagrange_pol[i]-func_exact[i])

plt.figure(0)
plt.plot(x_exact,func_exact,'r-',label='exat')
plt.plot(x,func_val,'b-o',label='linear interpolation')
plt.plot(x_exact,Lagrange_pol,'g-',label='interpolation på Lagranges form')

plt.xlabel('x')
plt.ylabel('funktion f(x)')
plt.legend()


#******************** plot för föreläsningar

plt.figure(1)
plt.plot(x_exact,func_exact,'r-',label='exakt f(x)')
plt.plot(x,func_val,'go',label='interp.punkter')

t=[1.22,1.23,1.24,1.25,1.26,1.27]
y=[1.1045,  1.1091, 1.1136, 1.1180,  1.1225,  1.1269]
plt.plot(t,y,'bo',label='mätdata')

plt.xlabel('x')
plt.ylabel('funktion f(x)')
plt.legend()

# interpolation i Chebyshevpunkterna

cheb=np.zeros(N)
func_cheb=np.zeros(N)

for k in range(0,N):
    #cheb[k] = ((p-n)/2)*(-1.0 + (k-1)*(2/(N-1))) + (n+p)/2
    cheb[k]=-((p-n)/2)*np.cos(((2*k+1)*np.pi)/(2*N))+(n+p)/2
    
    x[k]=cheb[k]
    func_cheb[k]=fun(x[k])
    
    fellog_cheb=np.zeros(len(x_exact))
    fel_cheb=np.zeros(len(x_exact))
    
for i in range(0,len(x_exact)):
    func_exact[i]=fun(x_exact[i])

    
    Lagrange_pol_nom1[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom1[i] = (x[1-1]- x[2-1])*(x[1-1]-x[3-1])*(x[1-1]-x[4-1])*(x[1-1]-x[5-1])*(x[1-1]-x[6-1])*(x[1-1]-x[7-1])*(x[1-1]-x[8-1])*(x[1-1]-x[9-1]);
    Lagrange_pol1[i] = fun(x[1-1])*(Lagrange_pol_nom1[i]/Lagrange_pol_denom1[i]);
    
    Lagrange_pol_nom2[i] =    (x_exact[i] -x[1-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom2[i] = (x[2-1]- x[1-1])*(x[2-1]-x[3-1])*(x[2-1]-x[4-1])*(x[2-1]-x[5-1])*(x[2-1]-x[6-1])*(x[2-1]-x[7-1])*(x[2-1]-x[8-1])*(x[2-1]-x[9-1]);
    Lagrange_pol2[i] = fun(x[2-1])*(Lagrange_pol_nom2[i]/Lagrange_pol_denom2[i]);
        
    Lagrange_pol_nom3[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[1-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom3[i] = (x[3-1]- x[2-1])*(x[3-1]-x[1-1])*(x[3-1]-x[4-1])*(x[3-1]-x[5-1])*(x[3-1]-x[6-1])*(x[3-1]-x[7-1])*(x[3-1]-x[8-1])*(x[3-1]-x[9-1]);
    Lagrange_pol3[i] = fun(x[3-1])*(Lagrange_pol_nom3[i]/Lagrange_pol_denom3[i]);
    
    Lagrange_pol_nom4[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[1-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom4[i] = (x[4-1]- x[2-1])*(x[4-1]-x[3-1])*(x[4-1]-x[1-1])*(x[4-1]-x[5-1])*(x[4-1]-x[6-1])*(x[4-1]-x[7-1])*(x[4-1]-x[8-1])*(x[4-1]-x[9-1]);
    Lagrange_pol4[i] = fun(x[4-1])*(Lagrange_pol_nom4[i]/Lagrange_pol_denom4[i]);
    
    Lagrange_pol_nom5[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[1-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom5[i] = (x[5-1]- x[2-1])*(x[5-1]-x[3-1])*(x[5-1]-x[4-1])*(x[5-1]-x[1-1])*(x[5-1]-x[6-1])*(x[5-1]-x[7-1])*(x[5-1]-x[8-1])*(x[5-1]-x[9-1]);
    Lagrange_pol5[i] = fun(x[5-1])*(Lagrange_pol_nom5[i]/Lagrange_pol_denom5[i]);
    
    Lagrange_pol_nom6[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[1-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom6[i] = (x[6-1]- x[2-1])*(x[6-1]-x[3-1])*(x[6-1]-x[4-1])*(x[6-1]-x[5-1])*(x[6-1]-x[1-1])*(x[6-1]-x[7-1])*(x[6-1]-x[8-1])*(x[6-1]-x[9-1]);
    Lagrange_pol6[i] = fun(x[6-1])*(Lagrange_pol_nom6[i]/Lagrange_pol_denom6[i]);
    
    Lagrange_pol_nom7[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[1-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom7[i] = (x[7-1]- x[2-1])*(x[7-1]-x[3-1])*(x[7-1]-x[4-1])*(x[7-1]-x[5-1])*(x[7-1]-x[6-1])*(x[7-1]-x[1-1])*(x[7-1]-x[8-1])*(x[7-1]-x[9-1]);
    Lagrange_pol7[i] = fun(x[7-1])*(Lagrange_pol_nom7[i]/Lagrange_pol_denom7[i]);
    
    Lagrange_pol_nom8[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[1-1])*(x_exact[i]-x[9-1])
    Lagrange_pol_denom8[i] = (x[8-1]- x[2-1])*(x[8-1]-x[3-1])*(x[8-1]-x[4-1])*(x[8-1]-x[5-1])*(x[8-1]-x[6-1])*(x[8-1]-x[7-1])*(x[8-1]-x[1-1])*(x[8-1]-x[9-1]);
    Lagrange_pol8[i] = fun(x[8-1])*(Lagrange_pol_nom8[i]/Lagrange_pol_denom8[i]);
    
    Lagrange_pol_nom9[i] =    (x_exact[i] -x[2-1])*(x_exact[i]-x[3-1])*(x_exact[i]-x[4-1])*(x_exact[i]-x[5-1])*(x_exact[i]-x[6-1])*(x_exact[i]-x[7-1])*(x_exact[i]-x[8-1])*(x_exact[i]-x[1-1])
    Lagrange_pol_denom9[i] = (x[9-1]- x[2-1])*(x[9-1]-x[3-1])*(x[9-1]-x[4-1])*(x[9-1]-x[5-1])*(x[9-1]-x[6-1])*(x[9-1]-x[7-1])*(x[9-1]-x[8-1])*(x[9-1]-x[1-1]);
    Lagrange_pol9[i] = fun(x[9-1])*(Lagrange_pol_nom9[i]/Lagrange_pol_denom9[i]);    
    
    Lagrange_pol[i] = Lagrange_pol1[i]+Lagrange_pol2[i]+Lagrange_pol3[i]+Lagrange_pol4[i]+Lagrange_pol5[i]+Lagrange_pol6[i]+Lagrange_pol7[i]+Lagrange_pol8[i]+Lagrange_pol9[i];

    fellog_cheb[i]=np.log10(np.abs(Lagrange_pol[i]-func_exact[i]))
    fel_cheb[i]=np.abs(Lagrange_pol[i]-func_exact[i])
    
plt.figure(2)
plt.plot(x_exact,func_exact,'r-',label='exakt')
plt.plot(x,func_cheb,'b-o',label='Chebyshevpunkter linear interpolation')
plt.plot(x_exact,Lagrange_pol, 'g-',label='interpolation på Lagranges form i Chebyshevpunkter')

plt.xlabel('x')
plt.ylabel('funktion f(x)')
plt.legend(prop={'size':9})



plt.figure(3)
plt.plot(x_exact,fel_cheb,'r-',label='Fel med Chebyshevpunkter')
plt.plot(x_exact,fel,'b-',label='Fel med ekvidistanta punkter')

plt.xlabel('x')
plt.ylabel('fel:|LagrangePolyn-exakt|')
plt.legend()



plt.figure(4)
plt.plot(x_exact,fellog_cheb,'r-',label='Log10-fel med Chebyshevpunkter')
plt.plot(x_exact,fellog,'b-',label='Log10-fel med ekvidistanta punkter')

plt.xlabel('x')
plt.ylabel('fel:log10|LagrangePolyn-exakt|')
plt.legend()



plt.figure(5)
plt.plot(x_exact,fel, 'b-',label='Fel med ekvidistanta punkter')
plt.xlabel('x')
plt.ylabel('fel: |LagrangePolyn - sqrt(x)|; ')
plt.legend()


 
plt.figure(6)
plt.plot(x_exact,fellog, 'b-',label="Log10-fel med ekvidistanta punkter")
plt.xlabel('x')
plt.ylabel('fel: log10|LagrangePolyn - sqrt(x)|; ')
plt.legend()


