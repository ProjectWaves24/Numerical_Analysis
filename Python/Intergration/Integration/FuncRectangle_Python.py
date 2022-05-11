#--------------------------------------------------------------------
#  Function for computation of integral int_a^b fun(x) dx
#  using composite rectangle rule.
#--------------------------------------------------------------------

import numpy as np

def FuncRectangle(fun,a,b,N):
    
    int_rectangle=0
    
    h=(b-a)/(N-1)
    
    x_exact=np.linspace(a,b,N)
    
    final_index=N
    
    for i in range(1,final_index):
        int_rectangle=int_rectangle+(fun(x_exact[i-1])+fun(x_exact[i]))/2        
    return int_rectangle*h