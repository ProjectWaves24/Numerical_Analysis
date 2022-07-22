close all;
clear

%fun = @(x) exp(-0.1*x.^2).*sin(5*x)
% fun = @(x) exp(-x.^2)
% fun = @(x) x.^(0.3)
  fun = @(x) x +5

% definition av integration intervalet [n,p]

n= 0.0;
p= 5.0

% gammalt  matlab-funktion
% Q =  quadl(fun,n,p);


disp('Computed   integral using Matlabs  function  integral ')

Q =  integral(fun,n,p)

  disp('Computed   integral using Matlabs function quadgk')

Adapt = quadgk(fun,n,p)

x(1) = -sqrt(3/5);
x(2) = 0;
x(3) = sqrt(3/5);

for i=1:3
	t(i) = ((p-n)/2.0)*x(i) + (p+n)/2.0;
end
	
omega(1)= 5/9;
omega(2)= 8/9;
omega(3) = 5/9;

disp('Computed   integral via 3  Gauss points ')


Int = ((p-n)/2.0)*(omega(1)*fun(t(1))  + omega(2)*fun(t(2)) + omega(3)*fun(t(3)))


  
