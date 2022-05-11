
import numpy as np
import matplotlib.pyplot as plt #Plotting
# ----------------------------------------
# Linear interpolation for 3 points
#   Matrix $A$ is constructed using linear splines.
#   The program performs approximation to the function
# $y = \sin(\pi*x/5) + x/5 $ by using values  in three points
# ----------------------------------------


# Define the number of measurements or data points.
# It is also the number of rows in matrix $A$.
m = 3
# number of coefficients to determine
K = 4
A = np.zeros([m, K])

x = np.linspace(0.0, 9.0, m)
T = np.linspace(0.0, 9.0, K)

# function which we want to fit
b = np.sin(np.pi*x/5) + x/5

# First approach:  constructing matrix A using linear splines
A[0]=[x[0],1,0,0]; A[1]=[x[1],1,0,0]; A[2]=[x[1],1, x[2], 1]


#solution of the system Ax=b using method of normal equations
x_computed = np.linalg.pinv(A)@b

print(' Computed  error in the interpolated function in the  first approach ')
print('     absolute error          relative error')
print(np.linalg.norm(A@x_computed-b), " " ,np.linalg.norm(A@x_computed-b)/np.linalg.norm(b))


interpolation = A@x_computed

# Second approach:  constructing matrix A using linear splines
B = np.zeros([K, K])
B = [[x[0],1,0,0], [x[1],1,0,0], [0,0, x[1], 1], [0,0,  x[2], 1]]

rhs =[b[0], b[1], b[1], b[2]]

#solution of the system Ax=b
x_computed2 = np.linalg.solve(B,rhs)

print(' Computed  error in the interpolated function in the  first approach ')
print('     absolute error          relative error')
print(np.linalg.norm(B@x_computed2 -rhs), " " ,np.linalg.norm(B@x_computed2 -rhs)/np.linalg.norm(rhs))

interpolation2 = B@x_computed2

# function which we wanted to approximate in 3 points
T = np.linspace(0.0, 9.0, 100)
exact = np.sin(np.pi*T/5) + T/5

plt.figure(0)
plt.plot(T, exact, 'r',label='exact function')

plt.plot(x, interpolation, 'bo-',label='interpolation 1')

points =[x[0], x[1], x[1], x[2]]
plt.plot(points, interpolation2, 'go-',label='interpolation 2')

plt.legend()
