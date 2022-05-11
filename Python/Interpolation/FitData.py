
import numpy as np
from scipy.stats import norm
import matplotlib.pyplot as plt

# ----------------------------------------
#   Solution of least squares  problem  min_x || Ax - y ||_2
#   using the method of normal equations.
#   Matrix  A is constructed as a Vandermonde matrix.
#   Program performs fitting to the function y = 5x+7
# --------------------------------------------------------------


d=13  # degree of the polynomial
m=13 #number of discretization points or rows in the matrix A

x=np.zeros(m)
y=np.zeros(m)
b=np.zeros(m)

x = np.linspace(0,10.0,m)

A=np.zeros([m,d])
brus = 0.1
random1=norm.ppf(np.random.rand(len(x))) #random with normal distrobution
brus = brus*60.0*random1

for i in range(0,m):
    
  #  exact function which should be approximated
  b[i] = 5*x[i] + 7;
  
  #generate observations with random brus
  y[i] =  b[i] + brus[i]

# construction of a Vandermonde matrix
for i in range(0,m):
    for j in range(0,d):
        A[i][j]=np.power(x[i],j)


# computing the right hand side in the method of normal equations
c=np.transpose(A)@y

# computing matrix in the left hand side in the method of normal equations
C=np.transpose(A)@A

l=np.zeros([d,m])

# solution of the normal equation using Cholesky decomposition
for j in range(0,d):
    s1=0
    for k in range(0,j):
        s1=s1+l[j][k]*l[j][k]
    l[j][j]=(C[j][j]-s1)**(1/2)
    for i in range(j,d):
        s2=0
        for k in range(0,j):
            s2=s2+l[i][k]*l[j][k]
        l[i][j]=(C[i][j]-s2)/l[j][j]
        
# computed coefficients
c
for i in range(0,d):
    for k in range(0,i):
        c[i]=c[i]-c[k]*l[i][k]
    c[i]=c[i]/l[i][i]
for i in range(d-1,-1,-1): #start with n-1 and end at 0 as range end 1-step before
    for k in range(d-1,i,-1):
        c[i]=c[i]-c[k]*l[k][i]
    c[i]=c[i]/l[i][i]


# compute approximation to this exact polynomial with comp. coefficients c
approx = A@c

plt.plot(x,approx,"b*-",label="poly.degree d=" f'{d}')

# plot of noisy  data
plt.plot(x,y,"ro",label="noisy data")

str_xlabel = 'Polynomial fitting of random data, m=' f'{m}'

plt.xlabel('x')
plt.legend()
#  plt.title('Polynomial fitting of random data  ',str_xlabel)
plt.title(str_xlabel)

# computation of the relative error  in coefficients to be recovered as
#  norm(approx. value - true value) / norm(true value)
# computation of the relative error  in function to be recovered as
#  norm(approx. value - true value) / norm(true value)


#relerror_func = norm(y'- approx)/norm(y')

