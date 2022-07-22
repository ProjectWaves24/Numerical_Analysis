close all;
clear



y0 = 1.0;  % begynnelsevarden
t0 = -2;          % begynnelsetid
ts = 10;         % slut-tid

%steglängd h
h= 0.01;

N = (ts - t0)/h
[t, y] = ode45(@func_stabilitet, linspace(t0, ts, N), y0);

figure
plot(t, y, 'b -', 'LineWidth',2)

  hold on
  delta = 1.0;
  
y0 = 1.0 + delta;  % begynnelsevarden

[t, y] = ode45(@func_stabilitet, linspace(t0, ts, N), y0);

% non-stiff ode
%[t, y] = ode23(@func_stabilitet, linspace(t0, ts, N), y0);
 
plot(t, y, 'r -', 'LineWidth',2)

legend('y(-2) = 1',' y(-2) = 1+ 1')
%legend('f(t,y)=  exp(3 sin(t)) sin(5t)',' f(t,y) + 0.01 t ')
%legend('ode45',' ode23 ')

  
  title('Stabilitet dy/dt=exp(-0.1 t^2) sin(5t)')
%title(' dy/dt=exp(3 sin(t)) sin(5t), y(-2)=1')

