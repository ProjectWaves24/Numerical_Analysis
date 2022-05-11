import numpy  as np

def func_problem1(t,y):
    dydt=np.sin(t*y)
    return dydt