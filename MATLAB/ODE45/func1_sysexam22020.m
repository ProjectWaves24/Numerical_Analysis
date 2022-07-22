function [dy] = func1_sysexam22020(t,y1,y2,y3)
  dy = 0;

dy =  t^2 + 50.0*sin(y2) + y3;

