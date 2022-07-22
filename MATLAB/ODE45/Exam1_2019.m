close all;
clear

N=100;
y0 = [0 0]';  % begynnelsevarden
t0 = 0;          % begynnelsetid
ts = 1.0;         % slut-tid

[t, y] = ode45(@funcexam12019_ode45, linspace(t0, ts, N), y0);

figure(1); 
plot(t, y(:, 1), 'b-', t, y(:, 2), 'r-','LineWidth',2)
xlabel('t')

title('  dy_1/dt=  sin(y_2)  +2t, dy_2/dt= cos(y_1) - 2t y_2,y_1(0)=0,y_2(0)=0')
grid on
hold on


%  framåt Eulers metod

h=(ts-t0)/N;
  t = linspace(t0,ts,N);
  y1 = linspace(t0,ts,N);
 y2 = linspace(t0,ts,N);
 
y1(1)= 0;  % begynnelsevarden
y2(1)= 0;

for k = 1:N
	   y1(k+1) = y1(k) + h*func1exam12019(t(k),y1(k),y2(k));
       y2(k+1) = y2(k) + h*func2exam12019(t(k),y1(k),y2(k));
           t(k+1) = t(k) + h;
end

 
plot(t, y1, 'b -- ', t,y2,'r--','LineWidth',2)

legend('y1, ode45', 'y2, ode45','y1, expl.Euler','y2, expl.Euler')

str_xlabel = ['Framåt Eulers metod vs. ode45, h=', num2str(h)];

%title('Framåt Eulers metod vs. ode45')
title(str_xlabel)
