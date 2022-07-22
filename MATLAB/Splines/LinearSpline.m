% ----------------------------------------
%   Solution of the least squares problem $ \min_x || Ax - y ||_2 $
%   using the method of normal equations, QR decomposition
%   and SVD decomposition.
%   Matrix $A$ is constructed using linear splines.
%   The program performs fitting to the function $y = \sin(\pi*x/5) + x/5 $
% ----------------------------------------

clc
clear
clf
format long
close all

% Define the number of measurements or data points.
% It is also the number of columns in matrix $A$.
m = 21;

% the number of junction points
K = 21;

x = linspace(-10, 10.0, m)';
T = linspace(-10, 10.0, K)';

% function which we want to fit
b = sin(pi*x/5) + x/5;

A = zeros(m, K);

% construct matrix A using linear splines
for k = 1:K
 % A(:,k) = fihatt(k, x, T);
A(:,k) = linearfunc(k, x, T);
end
% compute condition number of A

A
cond(A)


% solution of linear system $Ax = b$ by different methods

% using method of normal equations
xHatChol = LLSChol(A, b);


disp(' Computed  error in the interpolated function ')
disp('     absolute error          relative error')
disp('')



disp([norm(A*xHatChol-b)   norm(A*xHatChol-b)/norm(b)   ])

interpolation = A*xHatChol;

figure (1)

% we plot exact function in 100 points
xexact = linspace(-10, 10.0, 100)';
b = sin(pi*xexact/5) + xexact/5;
plot(xexact, b, '- r', 'linewidth', 2)
hold on

plot(x, interpolation, ' -o b', 'linewidth', 2)
legend('exact function  f(x) = sin(pi*x/5) + x/5 ', 'interpolated by linear  splines');


str_xlabel = ['Nr. of interp.points ', num2str(m)];


title(' Interpolation by linear splines', str_xlabel);
