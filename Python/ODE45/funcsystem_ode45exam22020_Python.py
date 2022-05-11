import numpy as np

def funcsystem_ode45exam22020(t,y):
    y1,y2,y3=y
    dydt=[t**2+50*np.sin(y2)+y3,
          t+50*np.cos(y1)+y3,
          y1+y2+50*np.cos(y1)]
    return dydt