clear
close all

m = 10;
%  genererar data punkter
t = linspace(210,270,m);

% genererar exakt funktion  y=log(b) i data punkter

A = 1;
E = 1;
T0 = 200;


x_exact = [A,E,T0];

%linear model
y = log(A) + E*(1./(t-T0));
%y = (A*exp(E*(1./(t-T0))));


%init gissning
x0 = [1,1,1];

x0 = [0.5,0.5,1];

%init gissning 
%x0 = [log10(y'), t', ones(m, 1)] \ (t'.* log10(y'));

%x(1) = x0(1);
%x(2)= exp(x0(2));
%x(3) = x0(3) + T0 * x0(2);

%definition av funktion som vi vill anpassa till mätningar i rhs
fun = @(x)log(x(1)) + x(2)*(1./(t-x(3))) - y;

% viktat
%vikt = 0.5;
%fun = @(x)(log(x(1)) + x(2)*(1./(t-x(3))) - y)*vikt;

% lower band  för A,E,T0
lb = [1/2,1/2,1/2];

% upper bound för A,E,T0
ub = [2.0,3.0,400.0];

x = lsqnonlin(fun,x0,lb,ub)
%x1 = lsqnonlin(fun1,x0)
%x2 = lsqnonlin(fun2,x0)

% construction of a matrix in the linear model

for i=1:1:m
  for j=1:1:3
    MA(i,1)=  y(i);
     MA(i,2)=  t(i);
       MA(i,3)=  1;
  end
end

%solution of normal equations using pinv
sol = pinv(MA)*(t.*y)';

% then we need compute actual coefficients T0, A and E  by knowing sol: see lecture 8

ls(1) = 10^sol(2);
ls(2) = sol(3) + sol(1)*sol(2);
 ls(3) = sol(1);
 
ls
figure

% exact solution
plot(t,y,'b -','LineWidth',2);
hold on;
% computed solution by lsqnonlin: plotting results

funres = @(x)log(x(1)) + x(2)*(1./(t-x(3)));
 plot(t,funres(x),'r -', 'LineWidth',2)
 
 plot(t,funres(ls),'*- c', 'linewidth',2)
 
xlabel('t')
  %legend('Exact function', 'Computed function for linear problem','Computed function for nonlinear problem')
 legend('Exact function', 'Computed function for linear problem lsqnonlin','Computed solution by normal equations')


 
 for i=1:3
error_lsqnonlin(i) = abs(x(i) - x_exact(i))/abs(x_exact(i));
error_leastsquares(i) = abs(ls(i) - x_exact(i))/abs(x_exact(i));
 end
 
 error_lsqnonlin
 error_leastsquares