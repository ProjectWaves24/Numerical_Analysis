close all

%  genererar data punkter
t = linspace(20,100,50);

% genererar exakt funktion  y=log(b) i data punkter

%y = log(A) + E*(1./(t-T0));

alfa = 1;
beta = 1;
gamma = 5;

y = 10^alfa*exp((alfa*beta)./(t-gamma));

%y = log(y)*gamma + alfa*log(10).*t  -alfa*log(10)*gamma + alfa*beta;

%init gissning
x0 = [0,0,0];

%definition av funktion som vi vill anpassa till mätningar i rhs
%fun = @(x)log(x(1)) + x(2)*(1./(t-x(3))) - rhs;

fun1 = @(x)log(y)*x(1) + x(2)*log(10)*t -  x(2)*log(10)*x(1) + x(2)*x(3) - y;

fun2 = @(x) 10^x(1)*exp((x(1)*x(2))./(t-x(3))) - y;

funy1 = @(x)log(y)*x(1) + x(2)*log(10)*t -  x(2)*log(10)*x(1) + x(2)*x(3);


 
funy2 = @(x)@(x) 10^x(1)*exp((x(1)*x(2))./(t-x(3)));

% lower band  för A,E,T0
%lb = [1/2,1/2,0.0];

% upper bound för A,E,T0
%ub = [2.0,3.0,400.0];

%x = lsqnonlin(fun,x0,lb,ub)
x1 = lsqnonlin(fun1,x0)
x2 = lsqnonlin(fun2,x0)
  
figure
 plot(t,y,'r-',t,funy1(x1),'LineWidth',2)
 hold on
  plot(t,funy2(x2),'b :','LineWidth',2)
xlabel('t')
  legend('Exact function', 'Computed function for linear problem','Computed function for nonlinear problem')

  title('Exam 1 2019')
