close all;
clear

 fun = @(x) x.^(0.3)
   
  
% definition av integration intervalet [n,p]

n= 0;
p= 1.0

% gammalt  matlab-funktion
 Q1 =  quadl(fun,n,p);

Q =  integral(fun,n,p);

fun_exact = 0;
x_exact = linspace(n, p);
N = size(x_exact,2)

  fun_calc = 0;
m= (n+p)/2.0;
x_calc = [n,m,p];
N_calc = 3;

% Simpsons formel

int_simpson  = ((p-n)/6.0)*(fun(n) +  4.0*fun(m) +  fun(p));
  
  for i = 1:N
	    func_exact(i) =fun(x_exact(i));
end


for i = 1:N_calc
	  frac1 = ((x_calc(i)- m)*(x_calc(i)- p))/((n - m)*(n-p));

          frac2 = ((x_calc(i)- n)*(x_calc(i)- p))/(( m - n)*(m  - p));
	    
          frac3 = ((x_calc(i)- n)*(x_calc(i)- m))/((p-n)*(p - m));
	    
         fun_calc(i) = fun(n)*frac1 + fun(m)*frac2 + fun(p)*frac3;

end

% trapetsmetoden
int_trap = trapz(x_calc,  fun_calc);


figure
plot(x_exact,func_exact, ' r-',  'LineWidth',2)

  
xverts = [x_calc(1:end-1);x_calc(1:end-1);x_calc(2:end);x_calc(2:end)];
yverts = [zeros(1,N_calc-1);fun_calc(1:end-1);fun_calc(2:end);zeros(1,N_calc-1)];
hold on


patch(xverts, yverts,'g','LineWidth',1.5)

plot(x_calc, fun_calc ,'b','LineWidth',3);

error1 = abs(Q-int_simpson)
error2 = abs(Q-int_trap)
  
  xlabel('x')
  ylabel('funktion f(x)= x^{0.3}')
  legend('exact ','Area (integral)','approximation ');

           title(['Trapetsmetoden:',num2str(int_trap), 'Adaptive :',num2str(Q),'error:',num2str(error2)]);
