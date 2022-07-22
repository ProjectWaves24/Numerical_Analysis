close all;
clear

%fun = @(x) exp(-0.1*x.^2).*sin(5*x)
 fun = @(x) exp(-x.^2)

% definition av integration intervalet [n,p]

n= -3;
p= 3.0

% gammalt  matlab-funktion
% Q =  quadl(fun,n,p);

Q =  integral(fun,n,p);
Adapt = quadgk(fun,n,p);

fun_exact = 0;
fun_calc = 0;

x_exact = linspace(n, p);
N = size(x_exact,2)


  for i = 1:N
	    func_exact(i) =fun(x_exact(i));

%fellog(i) = log10(abs(Lagrange_pol(i) - func_exact(i)));
%fel(i) = abs(Lagrange_pol(i) - func_exact(i));

end

  N_calc = 219;

% ekvidistanta punkter
  %x_calc = linspace(n, p, N_calc);


%******************  Chebyshevpunkterna

for i = 1:N_calc
	  cheb(i)  = -((p-n)/2.0)*cos(((2.0*i-1)*pi)/(2.0*N_calc))+ (n+p)/2.0;
          x_calc(i) =cheb(i);
	  fun_calc(i) =fun(x_calc(i));
end

int_calc = trapz(x_calc,  fun_calc);

	
figure
plot(x_exact,func_exact, ' r-',  'LineWidth',2)

xverts = [x_calc(1:end-1);x_calc(1:end-1);x_calc(2:end);x_calc(2:end)];
yverts = [zeros(1,N_calc-1);fun_calc(1:end-1);fun_calc(2:end);zeros(1,N_calc-1)];
hold on


patch(xverts, yverts,'g','LineWidth',1.5)

plot(x_calc,  fun_calc,'b','LineWidth',3);

  
  xlabel('x')
  ylabel('funktion f(x)')
  legend('exact  e^{-x^2}','area (integral  av e^{-x^2})','approximation ');
title(['Trapetsmetoden i Chebyshevpunkter, Integral=',num2str(int_calc),', N=',num2str(N_calc)]);


figure
plot(x_exact,func_exact, ' r-',  'LineWidth',2)
  
 xlabel('x')
  ylabel('funktion f(x)= e^{-x^2}')
  
  title('exact f(x)= e^{-x^2}')
