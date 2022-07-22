close all;
clear

fun = @(x) exp(-0.1*x.^2).*sin(5*x)
%fun = @(x) exp(-x.^2)

% definition av integration intervalet [n,p]

n= 0;
p= 5.0

% gammalt  matlab-funktion
% Q =  quadl(fun,n,p);

Q =  integral(fun,n,p);


fun_exact = 0;
fun_calc = 0;

x_exact = linspace(n, p);
N = size(x_exact,2)


  for i = 1:N
	    func_exact(i) =fun(x_exact(i));

%fellog(i) = log10(abs(Lagrange_pol(i) - func_exact(i)));
%fel(i) = abs(Lagrange_pol(i) - func_exact(i));

end

  N_calc = 81;
  x_calc = linspace(n, p, N_calc);


for i = 1:N_calc
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

error = abs(Q-int_calc)

  
  xlabel('x')
  ylabel('funktion f(x)')
 % legend('exact  e^{-x^2}','area (integral  av e^{-x^2})','approximation ');
legend('exact e^{-0.1 x^2} sin(5x)','area (integral  av e^{-0.1 x^2} sin(5x))','approximation ');
title(['Trapetsmetoden, Integral=',num2str(int_calc),', N=',num2str(N_calc),'error:',num2str(error)]);
