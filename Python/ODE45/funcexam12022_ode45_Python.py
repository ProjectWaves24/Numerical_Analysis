import numpy as np

def funcexam12022_ode45(t,y):
    y1,y2=y
    dydt=[np.sin(2*np.pi*t)+y1,
          np.cos(2*np.pi*t)-y2]
    return dydt