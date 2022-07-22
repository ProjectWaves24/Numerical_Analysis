 %--------------------------------------------------------------------
 %  Matlab code which illustrates
 % how to compute integral  int_a^b fun(x) dx
 %   using  Matlab's functions integral, trapz, as well as composite
 %   trapezoidal rule, composite rectangle  method,
 %   and composite Simpson's rule.
 %----------------------------------------------------------------------



close all;
clear

fun = @(x) exp(-0.1*x.^2).*sin(5*x)
%fun = @(x) exp(-x.^2)

% definition av integration intervalet [n,p]

a= 0;
b= 5.0

 

% gammalt  matlab-funktion
int_quadl =  quadl(fun,a,b)

int_integral =  integral(fun,a,b)

   x_calc = linspace(a, b, 101);
  
for i = 1:101
	  fun_calc(i) =fun(x_calc(i));
end
int_trapz =  trapz(x_calc, fun_calc)

  int_trapets = FuncTrapets(fun,a,b,101)

  int_rectangle = FuncRectangle(fun,a,b,101)
  
  int_simpson = FuncSimpson(fun,a,b,101)

  
