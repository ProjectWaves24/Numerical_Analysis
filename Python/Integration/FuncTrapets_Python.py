#--------------------------------------------------------------------
#  Function for computation of integral int_a^b fun(x) dx
#  using composite trapezoidal rule.
#--------------------------------------------------------------------

import numpy as np

def FuncTrapets(fun,a,b,N):
    
    int_trapets=0
    
    h=(b-a)/(N-1)
    
    x_exact=np.linspace(a,b,N)
    
    final_index=N
    
    for i in range(1,final_index-1):
        int_trapets=int_trapets+fun(x_exact[i])
    
    return (int_trapets+fun(x_exact[0])/2+fun(x_exact[N-1])/2)*h