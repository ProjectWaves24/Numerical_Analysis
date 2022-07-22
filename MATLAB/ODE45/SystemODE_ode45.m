close all;
clear

N=200;
y0 = [0 -1]';  % begynnelsevarden
t0 = 0;          % begynnelsetid
ts = 5;         % slut-tid

[t, y] = ode45(@funcsystem_ode45, linspace(t0, ts, N), y0);

figure(1); 
plot(t, y(:, 1), 'b-', t, y(:, 2), 'r-','LineWidth',2)
xlabel('t')

title('  dy_1/dt= y_2  +2t, dy_2/dt= y_1 - 2t y_1 + y_2 -t +1,y_1(0)=0,y_2(0)=-1')
grid on
hold on


%  framåt Eulers metod

h=(ts-t0)/N;
  t = linspace(t0,ts,N);
  y1 = linspace(t0,ts,N);
 y2 = linspace(t0,ts,N);
 
y1(1)= 0;  % begynnelsevarden
y2(1)= -1;

for k = 1:N
	   y1(k+1) = y1(k) + h*func1_sys(t(k),y1(k),y2(k));
       y2(k+1) = y2(k) + h*func2_sys(t(k),y1(k),y2(k));
           t(k+1) = t(k) + h;
end

 
plot(t, y1, 'b -- ', t,y2,'r--','LineWidth',2)
legend('y1, ode45', 'y2, ode45','y1, expl.Euler','y2, expl.Euler')

title('Framåt Eulers metod vs. ode45 (h=0.025)')

t = text(0.5,-20,'dy_1/dt= y_2  +2t, dy_2/dt= y_1 - 2t y_1 + y_2 -t +1');
t = text(0.5,-23,'y_1(0)=0,y_2(0)=-1');
