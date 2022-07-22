close all;
clear

fun = @(x)exp(-x^2);

% definition av interpolation intervalet [n,p]

n= -3.0;
p= 3.0

fun_exact = 0;
fun_val = 0;

% vi vill interpolera i N punkter
N = 3;
 x = linspace(n, p, N);
x_exact = linspace(n, p);




% beräknar y_k = func_val(x(i)) för interpolation
for i = 1:N
	  func_val(i) =fun(x(i));
l(i) = 1;
l_nom(i) = 1;
l_denom(i)=1;
end

for i = 1:size(x_exact,2)
	  Linear_spline(i) = 0;
end

for i = 1:size(x_exact,2)
	  func_exact(i) =fun(x_exact(i));

for k=1:N-1
	if (x_exact(i) <= x(k+1)  && x_exact(i) >= x(k))
  nom = fun(x(k+1)) -fun(x(k));
denom = x(k+1)-x(k);
Linear_spline(i) = fun(x(k)) + (x_exact(i) - x(k))*(nom/denom);
end
end

%fellog(i) = log10(abs(Lagrange_pol(i) - func_exact(i)));
%fel(i) = abs(Lagrange_pol(i) - func_exact(i));

end


	
figure

plot(x_exact,func_exact, ' r-',  'LineWidth',2)
 hold on
  
plot(x,  func_val,'o b',  'LineWidth',2)


  plot(x_exact,Linear_spline, ' g -',  'LineWidth',2)


  
  xlabel('x')
  ylabel('funktion f(x)')
%  legend('exact','linear interpolation','interpolation på Lagranges form');
 legend('exact  exp(-x^2)','interpolation points','linear interpolation');
 % title(['x(1)=',num2str(x(1)),', x(2)= ',num2str(x(2))])
 title(['Linear spline interpolation av exp(-x^2)  för N=',num2str(N),' interpol.p.'])




%****************** interpolation i Chebyshevpunkterna

for k = 1:N	  
	  % cheb(k) = ((p-n)/2.0)*(-1.0 + (k-1)*(2.0/(N-1))) + (n+p)/2;
cheb(k)  = -((p-n)/2.0)*cos(((2.0*k-1)*pi)/(2.0*N))+ (n+p)/2.0;

				 x(k) = cheb(k);
                                 func_cheb(k) = fun(x(k));
				 end
				 
