close all;
clear

N= 100;
y0 = [0 0.1]';  % begynnelsevarden
t0 = 0;          % begynnelsetid
ts = 2;         % slut-tid

[t, y] = ode45(@func_exam32020, linspace(t0, ts, N), y0);

figure(1); 
plot(t, y(:, 1), 'b-', t, y(:, 2), 'r-','LineWidth',2)
xlabel('t')


grid on
hold on


%  Bakåt Eulers metod


dt=(ts-t0)/N;
  t = linspace(t0,ts,N);

A=[];
A=[1 - dt, dt; dt, 1 - dt];


x = zeros(1,2);
xnew = zeros(1,2);
x(1) = 0;
x(2) = 0.1;
 sol1 = linspace(t0,ts,N);
 sol2 = linspace(t0,ts,N);

sol1(1) = x(1);
sol2(1) = x(2);

for k = 1:N-1
	  xnew = A\x';
      
%xnew = inv(A)*x';
          sol1(k+1) = xnew(1);
          sol2(k+1) = xnew(2);
          % new right hand side
          x(1)=  dt*t(k) + dt*dt + xnew(1);
          x(2)=  dt*t(k) + dt*dt + xnew(2);
end
 
plot(t, sol1, 'g -- ', t,sol2,'g-','LineWidth',2)

  legend('x(t), ode45', 'y(t), ode45','x(t), impl.Euler','y(t), impl.Euler')

%title('Implicit Eulers metod vs. ode45 (h=0.02)')
title( ['Implicit Eulers metod vs. ode45 with dt = ',num2str(dt)])

t = text(0.25,16,'dx/dt= t+x-y, dy/dt=  t -x +y');
t = text(0.25,18,'x(0)=0,y(0)=0.1');


