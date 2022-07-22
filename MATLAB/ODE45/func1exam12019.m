function [dy] = func1_sys(t,y1,y2)
  dy = 0;

dy = sin(y2) + 2*t;

