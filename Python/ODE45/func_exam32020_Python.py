def func_exam32020(t,y):
    y1,y2=y
    dydt=[t+y1-y2,t-y1+y2]
    return dydt