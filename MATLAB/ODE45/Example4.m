close all;
clear


y0 = 1;  % begynnelsevarden
t0 = 0;          % begynnelsetid
ts = 2;         % slut-tid

%steglängd h

h= 0.1;
N = (ts - t0)/h
[t, y] = ode45(@func_example4, linspace(t0, ts, N), y0);

figure

hold on
plot(t, y(:, 1), 'b -o', 'LineWidth',2)

  y=0;
h=0.25;
N = (ts - t0)/h
[t, y] = ode45(@func_example4, linspace(t0, ts, N), y0);

plot(t, y(:, 1), 'g -o', 'LineWidth',2)

y=0;
h=0.125;
N = (ts - t0)/h
[t, y] = ode45(@func_example4, linspace(t0, ts, N), y0);

plot(t, y(:, 1), 'r -*', 'LineWidth',2)

legend('h=0.5 (ODE45)','h=0.25  (ODE45)','h=0.125  (ODE45)')


  
  tode45 = t;
  y_ode45= y(:, 1);

%Toptions = odeset('RelTol',1e-4,'AbsTol',[1e-4]);
%[t,y] = ode45(@func_example4,[-1 5],[1],options);


xlabel('t')

title(' ode45: exempel')
grid on

hold off

%  framåt Eulers metod

h= 0.5;
N = (ts - t0)/h
  t = linspace(t0,ts,N);
  y = linspace(t0,ts,N);
y(1) = 1;  % begynnelsevarden

for k = 1:N
	   y(k+1) = y(k) + h*func_example4(t(k),y(k));
           t(k+1) = t(k) + h;
 end

 figure
plot(t, y, 'g -o ', 'LineWidth',2)
hold on

h= 0.25;
N = (ts - t0)/h
  t = linspace(t0,ts,N);
  y = linspace(t0,ts,N);
y(1) = 1;  % begynnelsevarden


for k = 1:N
	   y(k+1) = y(k) + h*func_example4(t(k),y(k));
           t(k+1) = t(k) + h;
 end

 
plot(t, y, 'b -o ', 'LineWidth',2)


h= 0.125;
N = (ts - t0)/h
  t = linspace(t0,ts,N);
  y = linspace(t0,ts,N);
y(1) = 1;  % begynnelsevarden


for k = 1:N
	   y(k+1) = y(k) + h*func_example4(t(k),y(k));
           t(k+1) = t(k) + h;
 end
 
plot(t, y, 'r -o ', 'LineWidth',2)


   plot(tode45, y_ode45, 'r -', 'LineWidth',2)

   legend('h=0.5 (Eulers)','h=0.25(Eulers)','h=0.125(Eulers)', 'h=0.125 (ODE45)')

   title('Eulers metod vs. ode45')
  grid on
