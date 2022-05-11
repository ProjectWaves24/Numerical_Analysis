def func_example2(t,y):
    y1,y2,y3=y
    dydt=[y2,
          y3,
          y3-2*t*y2+y1**2-t+1]
    return dydt