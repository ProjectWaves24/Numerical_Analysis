close all;

tolerance = 10e-15;

%fun = @(x)x^10 - 10^10;
fun = @(x)x^3 - 2*x - 5;

% definition av intervalet [n,p]

n= -1.0;
p=3.0;
it=0;


% Halveringsmetoden

	  while abs(n - p) > tolerance
m = (n + p)/2;
         if fun(m) < 0 
  n = m;
         else
	   p = m;
        end

	it = it+1;

%func_val(it) = abs(fun(p) - 10.0);

func_val(it) = fun(p);

iteration(it) = it;
end

	
figure

plot(iteration,  func_val,'o r-',  'LineWidth',2)
 xlabel('iteration')
  ylabel('solution: x^{3} - 2x - 5=0')
 legend(['solution: ', num2str(p)]);
title(['Halveringsmetoden, konvergens (iterations):',num2str(it)]);


% Newtons metod

y=0;
iteration_newton = 0;
func_newton = 0;
error_newton = 0;

%Initialiseringen: init guess
y(1) = 1.5
%y(1) = 7;
k=2;

iteration_newton(1) = 1;
func_newton(1) =fun(y(1));
%error_newton(1) = abs(10.0 - func_newton(1));
numerator =  fun(y(1));
denominator = 3*(y(1))^2 -2;
y(2) = y(1) - numerator/denominator;
  
% Main Newton's iterations  
while abs( y(k) - y(k-1) ) > tolerance

numerator =  fun(y(k));
denominator = 3*(y(k))^2 -2;
y(k+1) = y(k) - numerator/denominator;
iteration_newton(k) = k;
func_newton(k) =fun(y(k));

%exact lösning är 10:
%error_newton(k) = abs(10 - func_newton(k));
k = k+1;
  end


figure
 % plot(iteration_newton,error_newton, 'o b-','LineWidth',2)
 plot(iteration_newton,func_newton, 'o b-','LineWidth',2)
  
  xlabel('iteration')
  ylabel('function  x^{3} - 2x - 5=0')
grid on
 legend(['solution:',num2str(y(k))]);
 title(['Newtonsmetod, konvergens (iterations):',num2str(k)])

n= -1.0;
p=3.0;
x_exact = linspace(n, p);
N = size(x_exact,2);
 for i = 1:N
	    func_exact(i) =fun(x_exact(i));
end

figure

plot(x_exact,func_exact, ' b-','LineWidth',2)
 legend(' x^{3} - 2x - 5=0 ');

  xlabel('  x')
  ylabel('function x^{3} - 2x - 5=0')

grid on
iteration


 iteration_newton
