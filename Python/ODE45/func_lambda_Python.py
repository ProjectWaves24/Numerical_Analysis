import numpy as np

def func_lambda(t,y):
    dydt=-1*y
    #dydt=np.exp(3*np.sin(t))*np.sin(5*t)+0.01*t
    return dydt