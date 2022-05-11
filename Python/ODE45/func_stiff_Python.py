import numpy as np

def func_stiff(t,y):
    dydt=-15*y
    #dydt=np.exp(-0.1*t**2)*np.sin(5*t)
    #dydt=np.exp(3*np.sin(t))*np.sin(5*t)
    return dydt