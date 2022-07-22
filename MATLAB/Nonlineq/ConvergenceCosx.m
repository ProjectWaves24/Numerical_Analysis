close all;

tolerance = 10e-15;

fun = @(x)x - cos(x);

% definition av intervalet [n,p]

n= -1;
p=1;
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

func_val(it) = fun(p);


iteration(it) = it;
end

	
figure

plot(iteration,  func_val,'o r-',  'LineWidth',2)
 xlabel('iteration')
  ylabel(' x^k -  cos(x^k)')
 legend('Halveringsmetoden');
title(['Halveringsmetoden, konvergens (iterations):',num2str(it)]);

%Sekantmetoden

x=0;
iteration_sekant = 0;
func_sekant = 0;
error_sekant = 0;

k=2;
%Initialiseringen
x(1) = 0;
x(2) = 0.1;


iteration_sekant(1) = 1;
iteration_sekant(2) = 2;
func_sekant(1) =fun(x(1));
func_sekant(2) =fun(x(2));

while  abs(x(k) - x(k-1)) > tolerance

numerator =  fun(x(k))*(x(k-1) - x(k));
denominator = fun(x(k-1)) - fun(x(k));

x(k+1) = x(k) - numerator/denominator;

if (k > 2)
  errorsec(k+1) = abs(x(k+1)-x(k));
errorsec(k) = abs(x(k) -x(k-1));
errorsec(k-1) = abs(x(k-1)- x(k-2));
num = log(errorsec(k+1)/errorsec(k));
denum = log(errorsec(k)/errorsec(k-1));
rsec(k) = num/denum;
rsecant(k) = num;
end


disp([rsec(k), k])



k = k+1;
  iteration_sekant(k) = k;
func_sekant(k) =fun(x(k));


end

%disp([rsec(1:end)', k])
  
 % hold on
figure
plot(iteration_sekant,func_sekant, 'o b-',  'LineWidth',2)
 xlabel('iteration')
  ylabel(' x^k - cos(x^k)')
 legend('Sekantmetoden');
title(['Sekantmetoden, konvergens (iterations):',num2str(k)]);


% Newtons metod

y=0;
iteration_newton = 0;
func_newton = 0;


%Initialiseringen
y(1) = 1.0;
k=2;

iteration_newton(1) = 1;
func_newton(1) =fun(y(1));

numerator =  fun(y(1));
denominator = 1 + sin(y(1));
y(2) = y(1) - numerator/denominator;
  
% Main Newton's iterations  
while abs( y(k) - y(k-1) ) > tolerance

numerator =  fun(y(k));
denominator = 1 + sin(y(k));

newtonerror = numerator/denominator

y(k+1) = y(k) -  newtonerror;

func_newton(k) =fun(y(k));
iteration_newton(k) = k;
fel_newton(k) = newtonerror;

if (k > 2)
  error(k+1) = abs(y(k+1)-y(k));
error(k) = abs(y(k) -y(k-1));
error(k-1) = abs(y(k-1)- y(k-2));
num = log(error(k+1)/error(k));
denum = log(error(k)/error(k-1));
r(k) = num/denum;
ratenum(k) = num;
ratedenum(k) = denum;
end
disp([r(k),  k])
  
k = k+1;



if k == 2000
break
end
  end

figure
  plot(iteration_newton,func_newton, 'o b-','LineWidth',2)

  
  xlabel('iteration')
  ylabel(' x^k - cos(x^k)')
%  legend('Halveringsmetoden','Sekantmetoden','Newtons metod')
%  title(['Sekant, halvering  och Newton  för x(1)=',num2str(x(1)),', x(2)= ',num2str(x(2))])
 legend('Newtonsmetod ');
 title(['Newtonsmetod, konvergens (iterations):',num2str(k)])

iteration

 iteration_sekant

 iteration_newton

p

x

y
 

figure

 % resultat för Halveringsmetod
 
 plot(iteration,  func_val,'o r-',  'LineWidth',2)

 hold on

 % Resultat för Sekantmetod
 
plot(iteration_sekant,func_sekant, 'o g-',  'LineWidth',2)

 % Resultat för Newtons metod
 
  plot(iteration_newton,func_newton, 'o b-','LineWidth',2)

 %legend('Halveringsmetod','Sekantmetoden','Newtons metod');
legend (['Halveringsmetod metod, konvergens (iterations):',num2str(size(iteration,2))],['Sekantmetod, konvergens (iterations):',num2str(size(iteration_sekant,2))], ['Newtons metod, konvergens (iterations):',num2str(size(iteration_newton,2))]);

  xlabel('iteration')
  ylabel(' x^k - cos(x^k)')
  title('Konvergens för f(x) = x - cos(x) = 0')

%print a table  for Sekantmetoden
fprintf (' Sek.  x         cos(x)        x - cos(x)  \n')
disp([x(1:end)',(cos(x))',(x-cos(x))'])



%print a table  for Newtons metod
fprintf (' Sek.  y        cos(y)        y - cos(y)   \n')
  disp([y(1:end)',(cos(y))',(y - cos(y))'])
 
