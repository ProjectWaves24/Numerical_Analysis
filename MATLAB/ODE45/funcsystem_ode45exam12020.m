function [dy] = funcsystem_ode45(t,y)
dy = zeros(2,1);    % a column vector


dy(1) = t^2 + 30*sin(y(2));
dy(2) =  t + 30*cos(y(1));
