function [dy] = func_lambda(t,y)
  dy = 0;

dy = -1*y;
%dy =  exp(3*sin(t)).*sin(5*t) + 0.01*t;
