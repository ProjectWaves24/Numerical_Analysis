function [dy] = func_stabilitet(t,y)
  dy = 0;

dy =  exp(-0.1*t.^2).*sin(5*t);
%dy =  exp(3*sin(t)).*sin(5*t);
