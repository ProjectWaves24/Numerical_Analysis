close all;
clear

N=1000;
y0 = [0 -1  0]';  % begynnelsevarden


t0 = 0;          % begynnelsetid
ts = 0.3;         % slut-tid

[t, y] = ode45(@funcsystem_ode45exam22020, linspace(t0, ts, N), y0);

figure(1); 
plot(t, y(:, 1), 'b-', t, y(:, 2), 'r-',t, y(:, 3), 'c-', 'LineWidth',2)
xlabel('t')

%title('  dy_1/dt= y_2  +2t, dy_2/dt= y_1 - 2t y_1 + y_2 -t +1,y_1(0)=0,y_2(0)=-1')
grid on
hold on


%  framåt Eulers metod

h=(ts-t0)/N;
  t = linspace(t0,ts,N);
  y1 = linspace(t0,ts,N);
 y2 = linspace(t0,ts,N);
 y3 = linspace(t0,ts,N);
 
y1(1)= 0;  % begynnelsevarden
y2(1)= -1;
y3(1)= 0;

for k = 1:N-1
	  y1(k+1) = y1(k) + h*func1_sysexam22020(t(k),y1(k),y2(k),y3(k));
y2(k+1) = y2(k) + h*func2_sysexam22020(t(k),y1(k),y2(k),y3(k));
y3(k+1) = y3(k) + h*func3_sysexam22020(t(k),y1(k),y2(k),y3(k));
       
end

 
plot(t, y1, 'b -- ', t,y2,'r--',t,y3,'c--','LineWidth',2)

  legend('y1, ode45', 'y2, ode45', 'y3, ode45','y1, expl.Euler', 'y2, expl.Euler', 'y3, expl.Euler')



 % str_xlabel = ['  mesh size=', num2str(h)];
%title(['Framåt Eulers metod vs. ode45, h= ',num2str(h),', ',str_xlabel])
title(['Framåt Eulers metod vs. ode45, h= ',num2str(h)])

  
%t = text(0.5,-20,'dy_1/dt= y_2  +2t, dy_2/dt= y_1 - 2t y_1 + y_2 -t +1');
%t = text(0.5,-23,'y_1(0)=0,y_2(0)=-1');
