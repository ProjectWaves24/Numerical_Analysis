function [dy] = func_exam22018(t,y)
dy = zeros(2,1);    % a column vector
dy(1) = y(2);
dy(2) = y(1)  + y(2);
