close all;

tolerance = 10e-15;

fun = @(x) sqrt(x+2)

% definition av intervalet [n,p]

n= -1.0;
p=3.0;
it=0;


y=0;
iteration_fixpunkt = 0;
func_fixpunkt = 0;
error_fixpunkt = 0;

%Initialiseringen: init guess
y(1) = 1.5;

k=2;

iteration_fixpunkt(1) = 1;
func_fixpunkt(1) =fun(y(1));
%error_fixpunkt(1) = abs(10.0 - func_fixpunkt(1));

y(2) = fun(y(1));
  
% Main   fixpunkt's  iterations  
while abs( y(k) - y(k-1) ) > tolerance

y(k+1) = fun(y(k));
iteration_fixpunkt(k) = k;
func_fixpunkt(k) =fun(y(k));

k = k+1;

if k == 45
break
end
  end


figure
 % plot(iteration_fixpunkt,error_fixpunkt, 'o b-','LineWidth',2)
 plot(iteration_fixpunkt,func_fixpunkt, 'o b-','LineWidth',2)
  
  xlabel('iteration')
  ylabel('  konvergens')
grid on
 legend(['solution:',num2str(y(k))]);
 title(['Fixpunktsmetod, konvergens (iterations):',num2str(k)])

n= -1.0;
p=3.0;
x_exact = linspace(n, p);
fun = @(x) x^2 -   x - 2;

N = size(x_exact,2);
 for i = 1:N
	    func_exact(i) =fun(x_exact(i));
end

figure

plot(x_exact,func_exact, ' b-','LineWidth',2)
 legend(' x^2 - x - 2= 0 ');

  xlabel('  x')
  ylabel('function x^2 - x- 2 = 0  ')

grid on
iteration


 iteration_fixpunkt
