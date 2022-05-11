
# solution for min_(A,E,T0) || rhs - A*exp(E*(1./(t-T0))) ||
import numpy as np
import numpy.linalg as ln #Matrix solvers/eigenvalues
import matplotlib.pyplot as plt #Plotting
from scipy.stats import norm

#genererar högerleden
A = 1; E = 1; T0 = 200
t = np.linspace(210,270,50)

#genererar data punkter
b = A*np.exp(E*(1./(t-T0)))

#genererar observationer  med random brus
random1=norm.ppf(np.random.rand(len(b))) #random med normal distrobution
brus = 0.01
rhs =  b + brus*random1



def func(x):
    return x[0]*np.exp(x[1]*(1/(t-x[2])))  #här är python / samma som matlab ./

def residual(x):
    return rhs - x[0]*np.exp(x[1]*(1/(t-x[2])))   

B=1

def derfunA(x):
    return -1*np.exp(x[1]*(1/(t-x[2])))

def derfunE(x):
    return B*np.exp(x[1]*(1/(t-x[2])))

def derfunT0(x):
    return x[0]*np.exp(x[1]*(1/(t-x[2])))


# Newtons metod

iteration_newton =[]
func_newton = []


#Initialiseringen
tolerance=10**(-15)
z0 = np.array([1,1,201.0]) #starta som fult array
z = np.array([1,0,201.0]) #decimal behövs för att array inte auto till int
zold = z.copy() 

k=1
iteration_newton.append(1)
func_newton = 0


numerator =  residual(z)
 
B= -z[0]*(1/(t-z[2]));

denominator0 = [derfunA(z)] #Extra hawk för P-inv
denominator1 = [derfunE(z)]
denominator2 = [derfunT0(z)]

#Moore-Penrose pseudoinverse beräknas här
z[0] = z[0] - np.dot(numerator, ln.pinv(denominator0))[0]
z[1] = z[1] - np.dot(numerator, ln.pinv(denominator1))[0]
z[2] = z[2] - np.dot(numerator, ln.pinv(denominator2))[0]

while ln.norm(abs(z-zold))>tolerance:
    zold=z.copy() #copy för attt undvika tidigt stop
    
    numerator =  residual(z)

    B= -z[0]*(1/(t-z[2]))

    denominator0 = [derfunA(z)]
    denominator1 = [derfunE(z)]
    denominator2 = [derfunT0(z)]

    #Moore-Penrose pseudoinverse beräknas här
    z[0] = z[0] - np.matmul(numerator, ln.pinv(denominator0))[0]
    z[1] = z[1] - np.matmul(numerator, ln.pinv(denominator1))[0]
    z[2] = z[2] - np.matmul(numerator, ln.pinv(denominator2))[0] #z updateras
    
    k=k+1
    iteration_newton.append(k)
    if k>1000:
        break 
    
    func_newton = func(z)


plt.plot(t,func_newton, 'c-',label="Newtons metod")

plt.plot(t,b, 'r--',label="exact solution")
  
plt.plot(t,rhs, 'b--',label="noisy data")
  
plt.xlabel('t')
plt.ylabel('funktion')
plt.title("Inital guess =" f'{z0[0]}' ",E=" f'{z0[1]}' ",T0="f'{z0[2]}')
plt.legend()


print(iteration_newton)
