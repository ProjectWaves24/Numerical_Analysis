close all;

tolerance = 10e-10;

fun = @(x)x^3 - 3*x -5;

% definition av intervalet [n,p]

n= 0;
p=3;
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

func_val(it) =fun(p);
iteration(it) = it;
end

%Sekantmetoden

x=0;
iteration_sekant = 0;
func_sekant = 0;
k=2;
%Initialiseringen
x(1) = 3.0;
x(2) = 1.0;


iteration_sekant(1) = 1;
iteration_sekant(2) = 2;
func_sekant(1) =fun(x(1));
func_sekant(2) =fun(x(2));


while  abs(x(k) - x(k-1)) > tolerance

numerator =  fun(x(k))*(x(k-1) - x(k));
denominator = fun(x(k-1)) - fun(x(k));

x(k+1) = x(k) - numerator/denominator;

k = k+1
  iteration_sekant(k) = k;
func_sekant(k) =fun(x(k));


end

	
figure

plot(iteration,  func_val,'o r-',  'LineWidth',2)

  hold on
plot(iteration_sekant,func_sekant, 'o b-',  'LineWidth',2)


% Newtons metod

y=0;
iteration_newton = 0;
func_newton = 0;


%Initialiseringen
y(1) = 3.0;
k=2;

iteration_newton(1) = 1;
func_newton(1) =fun(y(1));
numerator =  fun(y(1));
denominator =  3.0*y(1)^2 -2.0;
y(2) = y(1) - numerator/denominator;
  
% Main Newton's iterations  
while abs( y(k) - y(k-1) ) > tolerance

numerator =  fun(y(k));
denominator =  3.0*y(k)^2 -2.0;
y(k+1) = y(k) - numerator/denominator;
iteration_newton(k) = k;
func_newton(k) =fun(y(k));
k = k+1;
  end

  plot(iteration_newton,func_newton, 'o c-','LineWidth',2)

  
  xlabel('iteration')
  ylabel('funktion x_k^3 - 3x_k -5')
  legend('Halveringsmetoden','Sekantmetoden','Newtons metod')
  title(['Convergence  för f(x) =  x^3 - 3x -5 = 0,  x(1)=',num2str(x(1)),', x(2)= ',num2str(x(2))])

 iteration_sekant

 iteration_newton
