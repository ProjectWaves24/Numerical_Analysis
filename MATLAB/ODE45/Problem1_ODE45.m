close all;
clear



y0 = -0.6;  % begynnelsevarden
t0 = -2;          % begynnelsetid
ts = 3;         % slut-tid

%steglängd h
h= 0.1;

N = (ts - t0)/h
[t, y] = ode45(@func_problem1, linspace(t0, ts, N), y0);

figure
plot(t, y, 'b -o', 'LineWidth',2)

  hold on

y0 = 1.0;  % begynnelsevarden
t0 = -3;          % begynnelsetid
ts = 4;         % slut-tid


N = (ts - t0)/h
[t, y] = ode45(@func_problem1, linspace(t0, ts, N), y0);

 
plot(t, y, 'r -o', 'LineWidth',2)

legend('t_0=-2, y(t_0)=-0.6','t_0=-3, y(t_0)= 1 ')

  title('ode45  för dy/dt =sin(ty)')

