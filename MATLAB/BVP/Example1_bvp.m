% BVP: Example 1. Vi löser  BVP:
% u''(t) = 9 u(t)
%  u(0)= 0, u(1)=9.
% med hjälp av collocation metod.
   
close all;
clear

N=1001;
y0 = [0 9]';  % begynnelsevarden
t0 = 0;          % begynnelsetiden
ts = 1;         % slut-tid


% Exact solution


%  diskretiseringen


h=(ts-t0)/(N-1);
  t = linspace(t0,ts,N);

uex = linspace(t0,ts,N);
vv = linspace(t0,ts,N);
 
uex(1)= 0;  % begynnelsevarden
uex(N)= 9;

%collocation metod för 3 collocation  punkter:
th=[0,0.5,1]';
ncolp = 3;
hh=(ts-t0)/(ncolp-1);

v = linspace(t0,ts,ncolp);

% konstruerar matrix och höger led från villkor i 3 collocation punkter,
%se föreläsning  19
  
A=[-9,-4.5,-0.25; 1,0,0; 1,1,1];
b = [0,0,9];

uh = A\b';


% lösning i collocation method i 3 punkter:
for k = 1:ncolp
	  v(k) = uh(1) +  uh(2)*th(k) + uh(3)*(th(k)^2);
end



%exakt lösning och collocation metod i N punkter

for k = 1:N
    uex(k) = 0.4492*(exp(3*t(k)) - exp(-3*t(k)));
    vv(k) = uh(1) +  uh(2)*t(k) + uh(3)*(t(k)^2);
end

	  
plot(t, uex, 'r - ','LineWidth',2)

grid on
hold on;

plot(th, v, 'b --','LineWidth',2)

plot(t, vv, 'c --','LineWidth',2)

legend('exact  solution', 'collocation metod, h=0.5', 'collocation metod, h= 0.001')

%str_xlabel = ['Collocation metod med 3 collocation punkter, h=', num2str(hh)];
str_xlabel = ['Collocation metod med 3 collocation punkter'];

title(str_xlabel)
