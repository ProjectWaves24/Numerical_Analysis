close all;
clear



y0 = 1;  % begynnelsevarden
t0 = 0.0;          % begynnelsetid
ts = 10;         % slut-tid

%steglängd h
h= 0.01;

N = (ts - t0)/h
[t, y] = ode45(@func_lambda, linspace(t0, ts, N), y0);

figure
plot(t, y, 'b -', 'LineWidth',2)

  hold on
  delta = 10;
  
y0 = y0 + delta;  % begynnelsevarden

[t, y] = ode45(@func_lambda, linspace(t0, ts, N), y0);

% non-stiff ode
%[t, y] = ode23(@func_stabilitet, linspace(t0, ts, N), y0);
 
plot(t, y, 'r -', 'LineWidth',2)

legend('y(0) = 1',' y(0) = 1+ 10')
%legend('f(t,y)=  exp(3 sin(t)) sin(5t)',' f(t,y) + 0.1 t ')
%legend('ode45',' ode23 ')

  
  title('Stabilitet dy/dt = -y, y(0) =1')
%title(' dy/dt=exp(3 sin(t)) sin(5t), y(-2)=1')

