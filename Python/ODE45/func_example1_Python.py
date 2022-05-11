def func_example1(t,y):
    y1,y2,y3=y
    dydt=[y2*y3,-y1*y3,-0.51*y1*y2]
    return dydt