function [dy] = func_noise(t,y)
  dy = 0;

dy =  exp(-0.1*t.^2).*sin(5*t) + 0.1*t;
%dy =  exp(3*sin(t)).*sin(5*t) + 0.01*t;

xlabel('t')
ylabel('y')
