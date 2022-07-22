close all;

tolerance = 10e-15;

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
x(1) = 2.0;
x(2) =  1.0;

iteration_sekant(1) = 1;
iteration_sekant(2) = 2;
func_sekant(1) =fun(x(1));
func_sekant(2) =fun(x(2));


while abs( x(k) - x(k-1) ) > tolerance

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
  
  xlabel('iteration')
  ylabel('funktion x^3 - 3x -5')
  legend('Halveringsmetoden','Sekantmetoden')
  title(['Sekant och halvering  på [0,3]  för x(1)=',num2str(x(1)),', x(2)= ',num2str(x(2))])


  iteration
  
iteration_sekant

  p

  x
