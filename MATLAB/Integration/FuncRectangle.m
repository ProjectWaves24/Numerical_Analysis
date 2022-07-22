 %--------------------------------------------------------------------
 %  Function for computation of integral int_a^b fun(x) dx
 %   using composite rectangle rule.
 %----------------------------------------------------------------------


function [int_rectangle] = FuncRectangle(fun, a,b, N)

int_rectangle = 0.0;

 h = (b-a)/(N-1);

x_exact = linspace(a,b,N);

final_index = N;


for i = 2:final_index
  int_rectangle =  int_rectangle  + (fun(x_exact(i-1)) +fun(x_exact(i)))/2.0;
 
end

int_rectangle =  int_rectangle*h;
