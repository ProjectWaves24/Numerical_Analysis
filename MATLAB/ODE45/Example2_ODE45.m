close all;
clear


y0 = [2 -1 0]';  % begynnelsevarden
t0 = 3;          % begynnelsetid
ts = 10;         % slut-tid

[t, y] = ode45(@func_example2, linspace(t0, ts, 100), y0);

figure(1); hold off
plot(t, y(:, 1), 'k-', t, y(:, 2), 'r-', ...
     t, y(:,3), 'b-', 'LineWidth',2)
legend({'y', 'y''', 'y'''''}, ...
       'Location', 'NorthWest')
xlabel('t')

title(' System av ODE: exempel')
grid on
