function [dy] = func_system(t,y)
 
dy = zeros(5,1);    % a column vector

dy(1) = y(2);
dy(2) = 2*y(2)*y(4) + y(3)^2 + t;
dy(3) = y(4);
dy(4) = y(5);
dy(5) = y(1) + y(3) + y(5)*y(1);
