close all;
clear

fun = @(x) exp(-0.1*x.^2).*sin(5*x)
%fun = @(x) exp(-x.^2)

% definition av integration intervalet [n,p]

n= 0;
p= 5.0

 

% gammalt  matlab-funktion
 Q1 =  quadl(fun,n,p);

Q =  integral(fun,n,p);


fun_exact = 0;
fun_calc = 0;

x_exact = linspace(n, p,71);
N = size(x_exact,2)
  
 h = (p-n)/(N-1);

  for i = 1:N
	    func_exact(i) =fun(x_exact(i));

%fellog(i) = log10(abs(Lagrange_pol(i) - func_exact(i)));
%fel(i) = abs(Lagrange_pol(i) - func_exact(i));

end


int_simpson = 0.0;

final_index = (N-1)/2;

%Simpson's method
for i = 1:final_index
	   int_simpson =  int_simpson  + (fun(x_exact(2*i-1)) + 4*fun(x_exact(2*i)) + fun(x_exact(2*i+1)));

end

int_simpson =  (int_simpson*h)/3.0

