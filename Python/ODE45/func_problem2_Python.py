import numpy as np

def func_problem2(t,y):
    dydt=t**2+np.sin(y)
    return dydt