function [dy] = exam32019_ode45(t,y)
dy = zeros(2,1);    % a column vector


dy(1) = 5*y(1) - 2*y(2) + 2*t;
dy(2) = y(1) + y(2) + t +1;
