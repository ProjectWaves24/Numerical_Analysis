
import numpy as np
#
#   Construction of columns in matrix A  using linear splines.
#   Input arguments: T - column vector with junction points, 
#   x are measurement ponts (discretization points).
#   Returns column with number k to the matrix A. 
#

def linearfunc(k,x,T):
    h=np.diff(T)
    N=len(T)
    f=np.zeros_like(x)

    if k>0 or k==N-1:
        #print(' if k >1')
        I=np.argwhere((x>=T[k-1]) & (x<=T[k]))
        #x[I]
        #T[k] 
        f[I]=x[I]
    if k<N-1:
        #print(' if k <N')
        I=np.argwhere((x>=T[k]) & (x<=T[k+1]))
        #x[I]
        #T[k] 
        f[I]=1
    return f

