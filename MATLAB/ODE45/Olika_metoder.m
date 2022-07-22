close all;
clear


y0 = 0.1;  % begynnelsevarden
t0 = 0;          % begynnelsetid
ts = 2;         % slut-tid

%steglängd h


h= 0.1;
N = (ts - t0)/h
[t, y] = ode45(@func, linspace(t0, ts, N), y0);

figure
hold on
plot(t, y(:, 1), 'b -o', 'LineWidth',2)

  y=0;

%  framåt Eulers metod

  t = linspace(t0,ts,N);
  y = linspace(t0,ts,N);

y(1) = 0.1;  % begynnelsevarden

for k = 1:N
	   y(k+1) = y(k) + h*func(t(k),y(k));
           t(k+1) = t(k) + h;
 end

 
plot(t, y, 'g -o ', 'LineWidth',2)


% Två-stegs metod  som har ordning 2 
 y=0;
 y = linspace(t0,ts,N);
 t = linspace(t0,ts,N);
y(1) = 0.1;  % begynnelsevarden


for k = 1:N
	  if k ==1
	   y(k+1) = y(k) + h*func(t(k),y(k));
          else
	  y(k+1) = y(k) + (3/2)*h*func(t(k),y(k)) - 0.5*h*func(t(k-1),y(k-1));
          end
           t(k+1) = t(k) + h;
 end

plot(t, y, 'c -o ', 'LineWidth',2)

% Tre-stegs metod  som har ordning 3 
  
 y=0;
 y = linspace(t0,ts,N);
 y(1) = 0.1;  % begynnelsevarden
 

for k = 1:N
  if k ==1 || k == 2
	  y(k+1) = y(k) + h*func(t(k),y(k));
          else
	    y(k+1) = y(k) + (23/12)*h*func(t(k),y(k)) - ...
                4/3*h*func(t(k-1),y(k-1)) + (5/12)*h*func(t(k-2),y(k-2));
          end
          t(k+1) = t(k) + h;
 end
 
plot(t, y, 'r -o ', 'LineWidth',2)

% Heuns metod
   
  t = linspace(t0,ts,N);
  y = linspace(t0,ts,N);

y(1) = 0.1;  % begynnelsevarden

for k = 1:N
	  val = y(k) + h*func(t(k),y(k));
	  y(k+1) = y(k) + 0.5*h*(func(t(k),y(k)) + ...
				 func(t(k)+h, val));

           t(k+1) = t(k) + h;
 end

 
plot(t, y, 'y -o ', 'LineWidth',2)

   legend('ode45','Explicit Eulers','Two-step','Three-step','Heuns')

   title(' dy/dt=y, h=0.1')


   
