close all;
clear
set(gca, 'YScale', 'log');
set(gca, 'XScale', 'log');

%fun = @(x) exp(-x.^2)
exact = @(x) exp(x)
  
h=[0.015625, 0.03125, 0.0625, 0.125];


%h=[0.015625, 0.03125, 0.0625, 0.125,0.25,0.5];
%h=[0.03125, 0.0625, 0.125,0.25,0.5];



% to plot h*h


% for 4 meshes

h2= [h(1)*h(1),h(2)*h(2),h(3)*h(3),h(4)*h(4)];
h1 = [h(1),h(2),h(3),h(4)];


h1

% Where to compute derivative:

x = 10;

% Computation of approximation of derivative which has first order convergence
% compute approximation of derivative for f(x) = exp(x) as
  %  f(x) = (f(x+h) - f(x))/h  what means for f(x) = exp(x):
  % f'(x) =  (exp(x + h)  - exp(x))/h
  
 approxim1 = (exp(x)*(exp(h) - 1))./h
  
% Computation of approximation of derivative which has second order convergence
% compute approximation of derivative for f(x) = exp(x) as
  %  f(x) = (f(x+h) - f(x-h))/2h  what means for f(x) = exp(x):
  % f'(x) =  (exp(x + h)  - exp(x-h))/2*h
  
 
 approxim2 = (exp(x)*(exp(h) - exp(-h)))./(2.0*h)
  
%***********************************************************************
% computation of relative error
%***********************************************************************

  
error1 =  abs(exact(x) - approxim1)/abs(exact(x));

error2 =   abs(exact(x) - approxim2)/abs(exact(x));


%******************************



plot(h, error1,'r -- d', 'Linewidth',2, "MarkerSize", 7, "MarkerFaceColor", "r");

hold on

plot(h,error2,'b -- d', 'Linewidth',2, "MarkerSize", 7, "MarkerFaceColor", "r");


% plot mesh size h 

plot(h,h1,'g -- d', 'Linewidth',2, "MarkerSize", 7, "MarkerFaceColor", "c");


% plot mesh size h*h

plot(h,h2,'c : s', 'Linewidth',2, "MarkerSize", 7, "MarkerFaceColor", "c");

set(gca, 'XScale', 'log', 'YScale', 'log');

%title('f(x) = exp(x)')

title('Convergence of  relative error for derivative of f(x) = exp(x)')


legend('O(h)','O(h^2)','h','h^2')

xlabel("mesh size h", "Interpreter", "Latex")
ylabel("relative error", "Interpreter", "Latex")

font_size = 10;
set(gca, "FontSize", font_size)

set(gcf, "Units", "Inches", "Position", [0, 0, 7, 7], ...
       "PaperUnits", "Inches", "PaperSize", [7, 7])

 %saveas(gcf, sprintf("convergexp.pdf"))






