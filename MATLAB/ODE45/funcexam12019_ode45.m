function [dy] = funcsystem_ode45(t,y)
dy = zeros(2,1);    % a column vector
dy(1) = sin(y(2)) + 2*t;
dy(2) = cos(y(1))  - 2*t*y(2);
