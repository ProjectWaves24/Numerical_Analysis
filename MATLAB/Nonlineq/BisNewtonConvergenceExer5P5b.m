close all;

tolerance = 10e-15;

%fun = @(x)x^10 - 10^10;
%fun = @(x)x^3 - 2*x - 5;
fun =  @(x)exp(-x) -x;


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
denominator =  -exp(-y(1))-1;
y(2) = y(1) - numerator/denominator;
  
% Main Newton's iterations  
while abs( y(k) - y(k-1) ) > tolerance

numerator =  fun(y(k));
denominator = -exp(-y(k))-1;
y(k+1) = y(k) - numerator/denominator;
iteration_newton(k) = k;
func_newton(k) =fun(y(k));

k = k+1;
  end


figure
 % plot(iteration_newton,error_newton, 'o b-','LineWidth',2)
 plot(iteration_newton,func_newton, 'o b-','LineWidth',2)
  
  xlabel('iteration')
  ylabel('function   e^{-x} - x = 0')
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
 legend('  e^{-x} - x = 0');

  xlabel('  x')
  ylabel('function  e^{-x} - x = 0')

grid on
iteration


 iteration_newton
