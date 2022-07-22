function [dy] = funcsystem_ode45(t,y)
dy = zeros(3,1);    % a column vector


dy(1) = t^2 + 50*sin(y(2))  + y(3);
dy(2) =  t + 50*cos(y(1)) + y(3);
dy(3) =   y(1) + y(2)  + 50*cos(y(1));
