close all;
clear



y0 = 1.0;  % begynnelsevarden
t0 = 0;          % begynnelsetid
ts = 1;         % slut-tid

  
%steglängd h
h= 0.2;

N = (ts - t0)/h
[t, y] = ode23s(@func_stiff, linspace(t0, ts, N), y0);

figure
plot(t, y, 'r -', 'LineWidth',2)

  hold on

 y=0;

%  framåt Eulers metod

  t = linspace(t0,ts,N);
  y = linspace(t0,ts,N);

y(1) = 1.0;  % begynnelsevarden

for k = 1:N
	   y(k+1) = y(k) + h*func_stiff(t(k),y(k));
           t(k+1) = t(k) + h;
 end

 
plot(t, y, 'b -o ', 'LineWidth',2)



legend('ode23s',' Explicit Euler ')

  
%  title('Stabilitet dy/dt=f(t,y), y(-2)=1')
   title([' dy/dt= -15 y, y(0)=1, h= ',num2str(h)])

   xlabel('t')
   ylabel('y(t)')
