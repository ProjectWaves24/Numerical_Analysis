close all;
clear

N=100;
y0 = [2 3]';  % begynnelsevarden
t0 = 1;          % begynnelsetiden
ts = pi;         % slut-tid

[t, y] = ode45(@funcexam12022_ode45, linspace(t0, ts, N), y0);

figure(1); 
plot(t, y(:, 1), 'b-', t, y(:, 2), 'r-','LineWidth',2)
xlabel('t')

title('  dy_1/dt=  sin(2 \pi t)  + y_1, dy_2/dt= cos(2 \pi t) -  y_2, y_1(1)= 2, y_2(1)=3')
grid on
hold on


%  framåt Eulers metod

h=(ts-t0)/N;
  t = linspace(t0,ts,N);
  y1 = linspace(t0,ts,N);
 y2 = linspace(t0,ts,N);
 
y1(1)= 2;  % begynnelsevarden
y2(1)= 3;

for k = 1:N
	   y1(k+1) = y1(k) + h*func1exam12022(t(k),y1(k),y2(k));
       y2(k+1) = y2(k) + h*func2exam12022(t(k),y1(k),y2(k));
           t(k+1) = t(k) + h;
end

 
plot(t, y1, 'b -- ', t,y2,'r--','LineWidth',2)

legend('y1, ode45', 'y2, ode45','y1, expl.Euler','y2, expl.Euler')

str_xlabel = ['Framåt Eulers metod vs. ode45, h=', num2str(h)];

%title('Framåt Eulers metod vs. ode45')
title(str_xlabel)
