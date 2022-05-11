def exam32019_ode45(t,y):
    y1,y2=y
    dydt=[5*y1-2*y2+2*t,y1+y2+t+1]
    return dydt