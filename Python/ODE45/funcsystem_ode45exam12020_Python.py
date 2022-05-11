import numpy as np

def funcsystem_ode45exam12020(t,y):
    y1,y2=y
    dydt=[t**2+30*np.sin(y2),
          t+30*np.cos(y1)]
    return dydt