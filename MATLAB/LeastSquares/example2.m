close all
%genererar högerleden
A=1;
E=1;
T0 =200;

%  genererar data punkter
t = linspace(210,270,50);

% genererar exakt funktion  y=log(b) i data punkter

y = log(A) + E*(1./(t-T0));

% genererar observationer  med random brus

brus = 0.01;
rhs =  y + brus*randn(size(t));

%init gissning: fint gissning
x0 = [A,E,T0];

%init gissning
x0 = [1,1,1];

%definition av funktion som vi vill anpassa till mätningar i rhs
fun = @(x)log(x(1)) + x(2)*(1./(t-x(3))) - rhs;

% lower band  för A,E,T0
%lb = [1/2,1/2,0.0];

% upper bound för A,E,T0
%ub = [2.0,3.0,400.0];

%x = lsqnonlin(fun,x0,lb,ub)
x = lsqnonlin(fun,x0)
  
figure

  plot(t,y,'r-', t,rhs, 'b o',t,fun(x)+rhs,'b -','LineWidth',2)
xlabel('t')
  legend('Exact function','Measured data','Computed function')

  title('Example 2')
