function [dy] = funcsystem_ode45(t,y)
dy = zeros(2,1);    % a column vector
dy(1) = y(2) + 2*t;
dy(2) = y(1)  - 2*t*y(1) + y(2) -t+1;
