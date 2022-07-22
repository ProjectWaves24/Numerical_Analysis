close all;
clear

N= 400;
y0 = [0 0]';  % begynnelsevarden
t0 = 5;          % begynnelsetid
ts = 10;         % slut-tid

[t, y] = ode45(@exam32019_ode45, linspace(t0, ts, N), y0);

figure(1); 
plot(t, y(:, 1), 'b-', t, y(:, 2), 'r-','LineWidth',2)
xlabel('t')

%title('dx/dt= 5x(t) - 2y(t) + 2t, dy/dt= x(t) + y(t) + t + 1, x(5)=0, y(5)=0')
grid on
hold on

%  framåt Eulers metod

 h=(ts-t0)/N;
 t = linspace(t0,ts,N);
 y1 = linspace(t0,ts,N);
 y2 = linspace(t0,ts,N);
 
y1(t0)= y0(1);  % begynnelsevarden
y2(t0)= y0(2);

for k = 1:N-1
	   y1(k+1) = y1(k) + h*exam32019_func1_sys(t(k),y1(k),y2(k));
       y2(k+1) = y2(k) + h*exam32019_func2_sys(t(k),y1(k),y2(k));
          % t(k+1) = t(k) + h;
end

 
plot(t, y1, 'b -- ', t,y2,'r--','LineWidth',2)


%  Bakåt Eulers metod


dt=(ts-t0)/N;
t = linspace(t0,ts,N);

A=[];
A=[1 - 5*dt, 2*dt; -dt, 1 - dt];

x = zeros(1,2);
xnew = zeros(1,2);
  
x(1)= y0(1); 
x(2)= y0(2);

 sol1 = linspace(t0,ts,N);
 sol2 = linspace(t0,ts,N);
 
 %for visualization
sol1(1) = x(1);
sol2(1) =  x(2);

for k = 1:N-1
    
	  rhs(1) = x(1) + 2*dt*t(k) + 2*dt*dt;
      rhs(2) = x(2) + dt*t(k) + dt*dt + dt;

	  xnew = A\rhs';
%  for visualization of results 
          sol1(k+1) = xnew(1);
          sol2(k+1) = xnew(2);
          x=xnew';
%t(k+1) = t(k) + dt;
end
 
plot(t, sol1, 'g -- ', t,  sol2,'g-','LineWidth',2);

legend('x, ode45', 'y, ode45','x, expl.Euler','y, expl.Euler','x impl.Euler','y impl.Euler')

str_xlabel = ['mesh size dt=', num2str(dt)];

title(['Nr.  points N=',num2str(N),', ',  str_xlabel
    ])


  



