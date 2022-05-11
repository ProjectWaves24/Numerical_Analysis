def funcsystem_ode45(t,y):
    y1,y2=y
    dydt=[y2+2*t,
          y1-2*t*y1+y2-t+1]
    return dydt