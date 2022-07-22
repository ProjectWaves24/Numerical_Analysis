function [dy] = func_example1(t,y)
dy = zeros(3,1);    % a column vector
dy(1) = y(2) * y(3) + 0.001*t;
dy(2) = -y(1) * y(3) + 0.001*t;
dy(3) = -0.51 * y(1) * y(2) + 0.001*t;
