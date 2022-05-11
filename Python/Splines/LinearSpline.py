
import numpy as np
import matplotlib.pyplot as plt #Plotting
from LLSChol import LLSChol #Import already define fuctions
from linearfunc import linearfunc
from fihatt import fihatt

# ----------------------------------------
#   Solution of the least squares problem $ \min_x || Ax - y ||_2 $
#   using the method of normal equations, QR decomposition
#   and SVD decomposition.
#   Matrix $A$ is constructed using linear splines.
#   The program performs fitting to the function $y = \sin(\pi*x/5) + x/5 $
# ----------------------------------------

# Define the number of measurements or data points.
# It is also the number of columns in matrix $A$.
m = 21

# the number of junction points
K = 21

x = np.linspace(-10, 10.0, m)
T = np.linspace(-10, 10.0, K)

# function which we want to fit
b = np.sin(np.pi*x/5) + x/5

# construct matrix A using linear splines
A = np.zeros([m,K]);

for k in range(K):
    A[:,k] = linearfunc(k,x,T) #kolum vector
    #A[:,k] = fihatt(k, x, T)

# compute condition number of A
np.linalg.cond(A)

# solution of linear system $Ax = b$ by different methods

# using method of normal equations
xHatChol = LLSChol(A,b)

print(' Computed  error in the interpolated function ')
print('     absolute error          relative error')
print(np.linalg.norm(A@xHatChol-b), " " ,np.linalg.norm(A@xHatChol-b)/np.linalg.norm(b))


interpolation = A@xHatChol

# we plot exact function in 100 points
plt.figure(0)
xexact = np.linspace(-10, 10.0, 100)
b = np.sin(np.pi*xexact/5) + xexact/5;


plt.plot(xexact, b, 'r-',label='exact function  f(x) = sin(pi*x/5) + x/5 ')
plt.plot(x, interpolation,'bo-',label='interpolated by linear  splines')
plt.legend(loc=2)
str_xlabel = 'Nr. of interp.points: ' f'{m}'
plt.title(' Interpolation by linear splines, ' + str_xlabel)
