def func_system(t,y):
    y1,y2,y3,y4,y5=y
    dydt=[y2,
          2*y2*y4+y3**2+t,
          y4,
          y5,
          y1+y3+y5*y1]
    return dydt