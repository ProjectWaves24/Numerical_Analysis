import numpy as np

def funcexam12019_ode45(t,y):
    y1,y2=y
    dydt=[np.sin(y2)+2*t,
          np.cos(y1)-2*t*y2]
    return dydt