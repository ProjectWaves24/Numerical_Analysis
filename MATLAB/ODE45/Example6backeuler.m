close all;
clear


y0 = 1;  % begynnelsevarden
t0 = 0;          % begynnelsetid
ts = 1.5;         % slut-tid

%steglängd h

h= 0.1;
N = (ts - t0)/h
[t, y] = ode45(@func_example6, linspace(t0, ts, N), y0);

figure

hold on
plot(t, y(:, 1), 'b -o', 'LineWidth',2)

[t, y] = ode23s(@func_stiff, linspace(t0, ts, N), y0);

plot(t, y(:, 1), 'b --', 'LineWidth',2)

%  framåt Eulers metod

h= 0.01;
N = (ts - t0)/h
  t = linspace(t0,ts,N);
  y = linspace(t0,ts,N);
y(1) = 1;  % begynnelsevarden

for k = 1:N
	   y(k+1) = y(k) + h*func_example6(t(k),y(k));
           t(k+1) = t(k) + h;
 end


plot(t, y, 'g -o ', 'LineWidth',2)


% backward Eulers method
   
h= 0.05;
N = (ts - t0)/h
  t = linspace(t0,ts,N);
  y = linspace(t0,ts,N);
y=0;
y(1) = 1;  % begynnelsevarden
t(1)=0;

for k = 1:N

	 y(k+1) = y(k)/(1.0 + 20.0*h);
           t(k+1) = t(k) + h;
 end
 
plot(t, y, 'r -- ', 'LineWidth',2)
   
   legend('h=0.1(ode45)','h=0.1(ode23s)','h=0.01(explicit Eulers)','h=0.1(backward Euler)')
 xlabel('t')
   title('Explicit vs. backward Euler, ode45, ode23s ')
  grid on
