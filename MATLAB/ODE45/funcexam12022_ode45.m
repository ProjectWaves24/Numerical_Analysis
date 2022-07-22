function [dy] = funcexam12022_ode45(t,y)
dy = zeros(2,1);    % a column vector
dy(1) = sin(2*pi*t) + y(1);
dy(2) = cos(2*pi*t) - y(2);
