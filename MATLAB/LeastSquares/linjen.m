close all
%genererar högerleden
A=5;
B=3;


%  genererar data punkter
t = linspace(0,10,10);

% genererar exakt funktion i data punkter

vikt = 0.5;

b =   A + B*t;

% genererar observationer  med random brus

brus = 0.1;
rhs =  b + brus*40.0*randn(size(t));


%init gissning: fint gissning

%init gissning
x0 = [1,1];

%definition av funktion som vi vill anpassa till mätningar i rhs


fun = @(x)(x(1) + x(2)*t) - rhs;


% lower band  för A,B
lb = [1/2,1/2];

% upper bound för A,B
ub = [10.0,10.0];

[x, x2norm] = lsqnonlin(fun,x0,lb,ub)
%x = lsqnonlin(fun,x0)
  
figure

  
  plot(t,b,'r-', t,rhs, 'b o',t,fun(x)+rhs,'b -','LineWidth',2)
xlabel('t')
  legend('Exact function','Measured noisy data','Computed function, lsqnonlin')
  title('Least squares for recovering  b= A + Bt =5+3t ')


  
