function [dy] = func2_sysexam22020(t,y1,y2,y3)
  dy = 0;

dy = y1 + y2 + 50.0*cos(y1);

