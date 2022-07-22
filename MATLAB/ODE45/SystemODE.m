close all;
clear


y0 = [1 -1 2 3 -4]';  % begynnelsevarden
t0 = 0;          % begynnelsetid
ts = 2;         % slut-tid

  
%steglängd h
h= 0.1;

N = (ts - t0)/h
[t, y] = ode45(@func_system, linspace(t0, ts, N), y0);

figure
plot(t, y, ' -', 'LineWidth',2)

 hold on

[t, y] = ode45(@func_systemnoise, linspace(t0, ts, N), y0);

plot(t, y, ' --', 'LineWidth',2)

legend('f_1(t,y)','f_2(t,y)','f_3(t,y)','f_4(t,y)','f_5(t,y)','f_1(t,y) + 0.01 t','f_2(t,y)+ 0.01 t','f_3(t,y) +  0.01 t ','f_4(t,y) + 0.01 t ','f_5(t,y)+ 0.01 t')

xlabel('t')
ylabel('y(t)')

title('Stabilitet för system i övningen')
