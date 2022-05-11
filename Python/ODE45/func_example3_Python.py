import numpy as np

def func_example3(t,y):
    dydt=np.sin(t*y)
    #dydt=t**2+np.sin(t*y)
    return dydt