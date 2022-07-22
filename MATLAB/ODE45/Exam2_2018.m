close all;
clear

N=100;
y0 = [0 -1]';  % begynnelsevarden
t0 = 0;          % begynnelsetid
ts = 2;         % slut-tid

[t, y] = ode45(@func_exam22018, linspace(t0, ts, N), y0);

figure(1); 
plot(t, y(:, 1), 'b-', t, y(:, 2), 'r-','LineWidth',2)
xlabel('t')

title('  dy_1/dt= y_2, dy_2/dt= y_1 + y_2,y_1(0)=0,y_2(0)=-1')
grid on
hold on


%  framåt Eulers metod

h=(ts-t0)/N;
  t = linspace(t0,ts,N);
  y1 = linspace(t0,ts,N);
 y2 = linspace(t0,ts,N);
 
y1(1)= 0;  % begynnelsevarden
y2(1)= -1;

for k = 1:N -1
	   y1(k+1) = y1(k) + h*func1_exam22018(t(k),y1(k),y2(k));
       y2(k+1) = y2(k) + h*func2_exam22018(t(k),y1(k),y2(k));
         
end

 
plot(t, y1, 'b -- ', t,y2,'r--','LineWidth',2)


%  Bakåt Eulers metod

N=100;
dt=(ts-t0)/N;
  t = linspace(t0,ts,N);

A=[];
A=[1, -dt; -dt, 1 - dt];


x = zeros(1,2);
xnew = zeros(1,2);
x(1) = 0;
x(2) = -1;
 sol1 = linspace(t0,ts,N);
 sol2 = linspace(t0,ts,N);

sol1(1) = x(1);
sol2(1) = x(2);

for k = 1:N-1
	  xnew = A\x';
%xnew = inv(A)*x';
          sol1(k+1) = xnew(1);
          sol2(k+1) = xnew(2);
          x=xnew';
end

 
plot(t, sol1, 'g -- ', t,sol2,'g-','LineWidth',2)



  legend('y1, ode45', 'y2, ode45','y1, expl.Euler','y2, expl.Euler','y1, impl.Euler','y2, impl.Euler')





title('Explicit and implicit Eulers metod vs. ode45 (h=0.02)')

t = text(0.25,-16,'dy_1/dt= y_2, dy_2/dt= y_1 + y_2');
t = text(0.25,-18,'y_1(0)=0,y_2(0)=-1');


