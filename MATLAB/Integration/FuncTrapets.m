
 %--------------------------------------------------------------------
 %  Function for computation of integral int_a^b fun(x) dx
 %   using composite trapezoidal rule.
 %----------------------------------------------------------------------


function [int_trapets] = FuncTrapets(fun, a,b, N)

int_trapets = 0.0;

 h = (b-a)/(N-1);

x_exact = linspace(a,b,N);

final_index = N;


for i = 2:final_index-1
  int_trapets =  int_trapets  + fun(x_exact(i));
 
end

int_trapets =  (int_trapets + ...
		fun(x_exact(1))/2.0 +  fun(x_exact(N))/2.0)*h;
