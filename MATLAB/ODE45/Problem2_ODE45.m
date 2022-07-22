close all;
clear



y0 = 4.0;  % begynnelsevarden
t0 = 3;          % begynnelsetid
ts = 10;         % slut-tid

%steglängd h
h= 0.1;

N = (ts - t0)/h
[t, y] = ode45(@func_problem2, linspace(t0, ts, N), y0);

figure
plot(t, y, 'b -o', 'LineWidth',2)


  xlabel('t');
ylabel('y(t)')
legend('t_0= 3, y(3)= 4')

  title('ode45  för dy/dt = t^2 + sin(y)')

