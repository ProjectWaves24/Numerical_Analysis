close all;

tolerance = 10e-10;

fun = @(x)x^10 - 10^10;

% definition av intervalet [n,p]

n= 0;
p=10^10;
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
x(1) = 5;
x(2) = 7;


iteration_sekant(1) = 1;
iteration_sekant(2) = 2;
func_sekant(1) =fun(x(1));
func_sekant(2) =fun(x(2));


while  abs(x(k) - x(k-1)) > tolerance

numerator =  fun(x(k))*(x(k-1) - x(k));
denominator = fun(x(k-1)) - fun(x(k));

x(k+1) = x(k) - numerator/denominator;

k = k+1;
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
y(1) = 10^10;
k=2;

iteration_newton(1) = 1;
func_newton(1) =fun(y(1));
numerator =  fun(y(1));
denominator = 10*y(1)^9;
y(2) = y(1) - numerator/denominator;
  
% Main Newton's iterations  
while abs( y(k) - y(k-1) ) > tolerance

numerator =  fun(y(k));
denominator = 10*y(k)^9;
y(k+1) = y(k) - numerator/denominator;
iteration_newton(k) = k;
func_newton(k) =fun(y(k));
k = k+1;
  end

  plot(iteration_newton,func_newton, 'o c-','LineWidth',2)

  
  xlabel('iteration')
  ylabel('funktion x^{10} - 10^{10}')
  legend('Halveringsmetoden','Sekantmetoden','Newtons metod')
  title(['Sekant, halvering  och Newton  för x(1)=',num2str(x(1)),', x(2)= ',num2str(x(2))])

iteration

 iteration_sekant

 iteration_newton
