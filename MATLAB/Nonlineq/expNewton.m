% solution for min_(A,E,T0) || rhs - A*exp(E*(1./(t-T0))) ||

close all;

%genererar högerleden
A=1;
E=1;
T0 =200;

%  genererar data punkter
t = linspace(210,270,50);

% genererar exakt funktion i data punkter

b = A*exp(E*(1./(t-T0)));


% genererar observationer  med random brus

brus = 0.01;
rhs =  b + brus*randn(size(t));



func = @(x)x(1)*exp(x(2)*(1./(t-x(3))));
residual= @(x)rhs - x(1)*exp(x(2)*(1./(t-x(3))));

B =1;
C=1;

derfunA = @(x)-exp(x(2)*(1./(t-x(3))));
derfunE = @(x)B*exp(x(2)*(1./(t-x(3))));
%derfunT0 = @(x)x(1)*exp(x(2)*(1./(t-x(3))));
derfunT0 = @(x)C*exp(x(2)*(1./(t-x(3))));

% Newtons metod



z=0;
iteration_newton = 0;
func_newton = 0;


%Initialiseringen
%z = [1,1,201];
z = [1,1,190];

z0 = [0,0,150];

k=2;

iteration_newton(1) = 1;
func_newton = residual(z);
numerator =  residual(z);

 
denominator1 = derfunA(z);

B= -z(1)*(1./(t-z(3)));

C = -z(1)*z(2)*(1./(t - z(3)).^2);

denominator2 = derfunE(z);
denominator3 = derfunT0(z);

znew(1) = z(1) - numerator/denominator1;
znew(2) = z(2) - numerator/denominator2;
znew(3) = z(3) - numerator/denominator3;

 zold = z; 
% Main Newton's iterations  
while abs(znew - zold) > tolerance

numerator =  residual(z);

denominator1 = derfunA(z);

B= -z(1)*(1./(t-z(3)));

denominator2 = derfunE(z);
denominator3 = derfunT0(z);

znew(1) = z(1) - numerator/denominator1;
znew(2) = z(2) - numerator/denominator2;
znew(3) = z(3) - numerator/denominator3;


iteration_newton(k) = k;

func_newton =  func(z);

k = k+1;


zold = z;
z= znew;

if k > 10000
    break
end
  end

  plot(t,func_newton, '- c','LineWidth',2)
hold on

  plot(t,b, '-- r','LineWidth',2)
  
  plot(t,rhs, '-- b','LineWidth',2)
  
  
  xlabel('t')
  ylabel('funktion')
  legend('Newtons metod','exact solution','noisy data')
title([' Initial guess A=',num2str(z0(1)),', E= ',num2str(z0(2)),', T0= ',num2str(z0(3))])

 iteration_newton
