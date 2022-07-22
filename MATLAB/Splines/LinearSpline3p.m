% ----------------------------------------
% Linear interpolation for 3 points
%   Matrix $A$ is constructed using linear splines.
%   The program performs approximation to the function
% $y = \sin(\pi*x/5) + x/5 $ by using values  in three points
% ----------------------------------------

clc
clear
clf
format long
close all

% Define the number of measurements or data points.
% It is also the number of rows in matrix $A$.
m = 3;
% number of coefficients to determine
K = 4;
A = zeros(m, K);

x = linspace(0.0, 9.0, m)';
T = linspace(0.0, 9.0, K)';

% function which we want to fit
b = sin(pi*x/5) + x/5;

% First approach:  constructing matrix A using linear splines

A = [x(1),1,0,0; x(2),1,0,0; x(2),1, x(3), 1];

%solution of the system Ax=b using method of normal equations
x_computed = pinv(A)*b;

disp(' Computed  error in the interpolated function in the  first approach ')
disp('     absolute error          relative error')
disp('')

disp([norm(A*x_computed - b)   norm(A*x_computed - b)/norm(b)   ])


interpolation = A*x_computed;

% Second approach:  constructing matrix A using linear splines
B = zeros(K, K);
B = [x(1),1,0,0; x(2),1,0,0; 0,0, x(2), 1; 0,0,  x(3), 1];

rhs =[b(1), b(2), b(2), b(3)]';

%solution of the system Ax=b
  x_computed2 = B\rhs;


disp(' Computed  error in the interpolated function in the second approach ')
disp('     absolute error          relative error')
disp('')

disp([norm(B*x_computed2 - rhs)   norm(B*x_computed2 - rhs)/norm(rhs)   ])

interpolation2 = B*x_computed2;


% function which we wanted to approximate in 3 points
T = linspace(0.0, 9.0, 100)';
exact = sin(pi*T/5) + T/5;

figure (1)
plot(T, exact, ' r', 'linewidth', 1)
hold on


plot(x, interpolation, ' -o b', 'linewidth', 2)
legend('exact function', 'interpolated by linear  splines');

points =[x(1), x(2), x(2), x(3)]';	  
plot(points, interpolation2, ' -o g', 'linewidth', 2)
legend('exact function', 'interpolation 1', 'interpolation 2');
