#--------------------------------------------------------------------
#  Function for computation of integral int_a^b fun(x) dx
#  using composite Simpson's rule.
#--------------------------------------------------------------------

import numpy as np

def FuncSimpson(fun,a,b,N):
    
    int_simpson=0
    
    h=(b-a)/(N-1)
    
    x_exact=np.linspace(a,b,N)
    
    final_index=int((N-1)/2)
    
    #Simpson's method
    for i in range(1,final_index+1):
        int_simpson=int_simpson+(fun(x_exact[2*i-2])+4*fun(x_exact[2*i-1])+fun(x_exact[2*i]))
    
    return (int_simpson*h)/3