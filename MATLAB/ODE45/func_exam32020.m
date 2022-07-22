function [dy] = func_exam32020(t,y)
dy = zeros(2,1);    % a column vector
dy(1) =  t +  y(1) - y(2);
dy(2) = t  - y(1)   + y(2);
