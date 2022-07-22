 %--------------------------------------------------------------------
 %  Function for computation of integral int_a^b fun(x) dx
 %   using composite Simpson's rule.
 %----------------------------------------------------------------------


function [int_simpson] = FuncSimpson(fun, a,b, N)

int_simpson = 0.0;


 h = (b-a)/(N-1);

x_exact = linspace(a,b,N);

final_index = (N-1)/2;

%Simpson's method
for i = 1:final_index
	   int_simpson =  int_simpson  + (fun(x_exact(2*i-1)) + 4*fun(x_exact(2*i)) + fun(x_exact(2*i+1)));

end

int_simpson =  (int_simpson*h)/3.0;

