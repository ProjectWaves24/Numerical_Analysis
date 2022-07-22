% BVP: Example 2. Vi löser  BVP
% u''(t) = 6 t
%  u(0)= 0, u(1)= 1
    % med hjälp av FEM i 3 punkter: t_1 = 0, t_2 = 0.5,  t_3 = 1.
   
close all;
clear

N=1001;
y0 = [0 1]';  % begynnelsevarden
t0 = 0;          % begynnelsetiden
ts = 1;         % slut-tid
qqb

% Exact solution


%  diskretiseringen


h=(ts-t0)/(N-1);
  t = linspace(t0,ts,N);

uex = linspace(t0,ts,N);
vv = linspace(t0,ts,N);
 
uex(1)= 0;  % begynnelsevarden
uex(N)= 1;


th=[0,0.5,1]';
ncolp = 3;
hh=(ts-t0)/(ncolp-1);

v = linspace(t0,ts,ncolp);



%exakt lösning i N punkter

for k = 1:N
	  uex(k) = t(k)^3;
end



% FEM metod i 3 punkter, se föreläsning 19 

uh = [0,0.125 , 1 ];

% testfunktioner

% fi_1 = (0.5-t)/tau  för t in (0,0.5)
  fi1 = [1,0,0];

% fi_2 = t/tau  för t in (0,0.5), eller  (1-t)/tau  för t in (0.5,1)
  fi2 = [0,1,0];

%  fi3 = (t- 0.5)/tau för t in (0.5,1).
  fi3 = [0,0,1];


  
% computation of FEM with P1: se exempel för FEM i föreläsning 19 
for k = 1:3
	  fem(k) =  uh(2)*fi2(k) + uh(3)*fi3(k);
end


% exakt lösning
plot(t, uex, 'r - ','LineWidth',2)

grid on
hold

% plotting FEM lösning
plot(th, fem, 'b --','LineWidth',2)


legend('exact  solution  u(t) = t^3, u(0)=0, u(1)=1 ','FEM med P1, h=0.5')


str_xlabel = ['FEM  i 3  punkter'];

title(str_xlabel)


figure

%plotting test funktioner  on [0,1]


% plotting  fi1

plot(th, fi1, 'b -','LineWidth',2)

hold on

% plotting  fi2

plot(th, fi2, 'm -','LineWidth',2)

% plotting  fi3

plot(th, fi3, 'r -','LineWidth',2)

legend('\phi_1','\phi_2','\phi_3')


title('Piecewise linear "hat" functions on [0,1]')


figure

%plotting test funktioner on [-0.5,1.5]

th=[-0.5,0,0.5,1,1.5]';
fi1 = [0,1,0,0,0];
fi2 = [0,0,1,0,0];
fi3 = [0,0,0,1,0];


% plotting  fi1

plot(th, fi1, 'b -','LineWidth',2)

hold on

% plotting  fi2

plot(th, fi2, 'm -','LineWidth',2)

% plotting  fi3

plot(th, fi3, 'r -','LineWidth',2)

legend('\phi_1','\phi_2','\phi_3')


title('Piecewise linear "hat" functions on [-0.5,1.5]')
