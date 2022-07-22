function [dy] = func2_sys(t,y1,y2)
  dy = 0;

dy = cos(y1) - 2*t*y2;

