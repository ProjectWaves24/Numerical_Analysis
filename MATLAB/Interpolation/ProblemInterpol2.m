close all;


fun = @(x)((x-1)*(x-2)*(x-3)*(x-4)*(x-5)*(x-6)*(x-7)*(x-8)*(x-9)*(x-10)*(x-11))/(1*2*3*4*5*6*7*8*9*10*11);

% definition av interpolation intervalet [n,p]

n= 1.0;
p= 11.0

fun_exact = 0;
fun_val = 0;

% vi vill interpolera i 9 punkter
N = 9;
 x = linspace(n, p, N);
4

x_exact = linspace(n, p);




% beräknar y_k = func_val(x(i)) för interpolation
for i = 1:N
	  func_val(i) =fun(x(i));
l(i) = 1;
l_nom(i) = 1;
l_denom(i)=1;
end

			 

for i = 1:size(x_exact,2)
	  func_exact(i) =fun(x_exact(i));



Lagrange_pol_nom1(i) =    (x_exact(i) -x(2))*(x_exact(i)-x(3))*(x_exact(i)-x(4))*(x_exact(i)-x(5))*(x_exact(i)-x(6))*(x_exact(i)-x(7))*(x_exact(i)-x(8))*(x_exact(i)-x(9));

Lagrange_pol_denom1(i) = (x(1)- x(2))*(x(1)-x(3))*(x(1)-x(4))*(x(1)-x(5))*(x(1)-x(6))*(x(1)-x(7))*(x(1)-x(8))*(x(1)-x(9));

Lagrange_pol1(i) = fun(x(1))*(Lagrange_pol_nom1(i)/Lagrange_pol_denom1(i));


Lagrange_pol_nom2(i) =    (x_exact(i) -x(1))*(x_exact(i)-x(3))*(x_exact(i)-x(4))*(x_exact(i)-x(5))*(x_exact(i)-x(6))*(x_exact(i)-x(7))*(x_exact(i)-x(8))*(x_exact(i)-x(9));

Lagrange_pol_denom2(i) =  (x(2)- x(1))*(x(2)-x(3))*(x(2)-x(4))*(x(2)-x(5))*(x(2)-x(6))*(x(2)-x(7))*(x(2)-x(8))*(x(2)-x(9));

Lagrange_pol2(i) = fun(x(2))*(Lagrange_pol_nom2(i)/Lagrange_pol_denom2(i));



Lagrange_pol_nom3(i) =  (x_exact(i) -x(1))*(x_exact(i)-x(2))*(x_exact(i)-x(4))*(x_exact(i)-x(5))*(x_exact(i)-x(6))*(x_exact(i)-x(7))*(x_exact(i)-x(8))*(x_exact(i)-x(9));

Lagrange_pol_denom3(i) = (x(3)- x(1))*(x(3)-x(2))*(x(3)-x(4))*(x(3)-x(5))*(x(3)-x(6))*(x(3)-x(7))*(x(3)-x(8))*(x(3)-x(9));

Lagrange_pol3(i) = fun(x(3))*(Lagrange_pol_nom3(i)/Lagrange_pol_denom3(i));


Lagrange_pol_nom4(i) =  (x_exact(i) -x(1))*(x_exact(i)-x(2))*(x_exact(i)-x(3))*(x_exact(i)-x(5))*(x_exact(i)-x(6))*(x_exact(i)-x(7))*(x_exact(i)-x(8))*(x_exact(i)-x(9));

Lagrange_pol_denom4(i) = (x(4)- x(1))*(x(4)-x(2))*(x(4)-x(3))*(x(4)-x(5))*(x(4)-x(6))*(x(4)-x(7))*(x(4)-x(8))*(x(4)-x(9));

Lagrange_pol4(i) = fun(x(4))*(Lagrange_pol_nom4(i)/Lagrange_pol_denom4(i));



Lagrange_pol_nom5(i) =  (x_exact(i) -x(1))*(x_exact(i)-x(2))*(x_exact(i)-x(3))*(x_exact(i)-x(4))*(x_exact(i)-x(6))*(x_exact(i)-x(7))*(x_exact(i)-x(8))*(x_exact(i)-x(9));

Lagrange_pol_denom5(i) = (x(5)- x(1))*(x(5)-x(2))*(x(5)-x(3))*(x(5)-x(4))*(x(5)-x(6))*(x(5)-x(7))*(x(5)-x(8))*(x(5)-x(9));

Lagrange_pol5(i) = fun(x(5))*(Lagrange_pol_nom5(i)/Lagrange_pol_denom5(i));



Lagrange_pol_nom6(i) =  (x_exact(i) -x(1))*(x_exact(i)-x(2))*(x_exact(i)-x(3))*(x_exact(i)-x(4))*(x_exact(i)-x(5))*(x_exact(i)-x(7))*(x_exact(i)-x(8))*(x_exact(i)-x(9));

Lagrange_pol_denom6(i) = (x(6)- x(1))*(x(6)-x(2))*(x(6)-x(3))*(x(6)-x(4))*(x(6)-x(5))*(x(6)-x(7))*(x(6)-x(8))*(x(6)-x(9));

Lagrange_pol6(i) = fun(x(6))*(Lagrange_pol_nom6(i)/Lagrange_pol_denom6(i));


Lagrange_pol_nom7(i) =  (x_exact(i) -x(1))*(x_exact(i)-x(2))*(x_exact(i)-x(3))*(x_exact(i)-x(4))*(x_exact(i)-x(5))*(x_exact(i)-x(6))*(x_exact(i)-x(8))*(x_exact(i)-x(9));
Lagrange_pol_denom7(i) = (x(7)- x(1))*(x(7)-x(2))*(x(7)-x(3))*(x(7)-x(4))*(x(7)-x(5))*(x(7)-x(6))*(x(7)-x(8))*(x(7)-x(9));
Lagrange_pol7(i) = fun(x(7))*(Lagrange_pol_nom7(i)/Lagrange_pol_denom7(i));


Lagrange_pol_nom8(i) =  (x_exact(i) -x(1))*(x_exact(i)-x(2))*(x_exact(i)-x(3))*(x_exact(i)-x(4))*(x_exact(i)-x(5))*(x_exact(i)-x(6))*(x_exact(i)-x(7))*(x_exact(i)-x(9));

Lagrange_pol_denom8(i) = (x(8)- x(1))*(x(8)-x(2))*(x(8)-x(3))*(x(8)-x(4))*(x(8)-x(5))*(x(8)-x(6))*(x(8)-x(7))*(x(8)-x(9));

Lagrange_pol8(i) = fun(x(8))*(Lagrange_pol_nom8(i)/Lagrange_pol_denom8(i));


Lagrange_pol_nom9(i) =  (x_exact(i) -x(1))*(x_exact(i)-x(2))*(x_exact(i)-x(3))*(x_exact(i)-x(4))*(x_exact(i)-x(5))*(x_exact(i)-x(6))*(x_exact(i)-x(7))*(x_exact(i)-x(8));

Lagrange_pol_denom9(i) = (x(9)- x(1))*(x(9)-x(2))*(x(9)-x(3))*(x(9)-x(4))*(x(9)-x(5))*(x(9)-x(6))*(x(9)-x(7))*(x(9)-x(8));

Lagrange_pol9(i) = fun(x(9))*(Lagrange_pol_nom9(i)/Lagrange_pol_denom9(i));

Lagrange_pol(i) = Lagrange_pol1(i)+Lagrange_pol2(i)+Lagrange_pol3(i)+Lagrange_pol4(i)+Lagrange_pol5(i)+Lagrange_pol6(i)+Lagrange_pol7(i)+Lagrange_pol8(i)+Lagrange_pol9(i);


fellog(i) = log10(abs(Lagrange_pol(i) - func_exact(i)));
fel(i) = abs(Lagrange_pol(i) - func_exact(i));

end


	
figure

plot(x_exact,func_exact, ' r-',  'LineWidth',2)
 hold on
  
plot(x,  func_val,'o b-',  'LineWidth',2)


plot(x_exact,Lagrange_pol, ' g -',  'LineWidth',2)


  
  xlabel('x')
  ylabel('funktion f(x)')
  legend('exact','linear interpolation','interpolation på Lagranges form');
title('(t-1)(t-2)(t-3)(t-4)(t-5)(t-6)(t-7)(t-8)(t-9)(t-10)(t-11)/11!');

% ******************** plot för föreläsningar


figure

plot(x_exact,func_exact, ' r-',  'LineWidth',2)
 hold on
  
plot(x,  func_val,'o g',  'LineWidth',2)


  xlabel('x')
  ylabel('funktion f(x)')

legend('exact f(x)','interp.punkter');

title('(t-1)(t-2)(t-3)(t-4)(t-5)(t-6)(t-7)(t-8)(t-9)(t-10)(t-11)/11!');
% interpolation i Chebyshevpunkterna

for k = 1:N	  
	  % cheb(k) = ((p-n)/2.0)*(-1.0 + (k-1)*(2.0/(N-1))) + (n+p)/2;
cheb(k)  = -((p-n)/2.0)*cos(((2.0*k-1)*pi)/(2.0*N))+ (n+p)/2.0;

				 x(k) = cheb(k);
                                 func_cheb(k) = fun(x(k));
				 end
				 

for i = 1:size(x_exact,2)
	  func_exact(i) =fun(x_exact(i));



Lagrange_pol_nom1(i) =    (x_exact(i) -x(2))*(x_exact(i)-x(3))*(x_exact(i)-x(4))*(x_exact(i)-x(5))*(x_exact(i)-x(6))*(x_exact(i)-x(7))*(x_exact(i)-x(8))*(x_exact(i)-x(9));

Lagrange_pol_denom1(i) = (x(1)- x(2))*(x(1)-x(3))*(x(1)-x(4))*(x(1)-x(5))*(x(1)-x(6))*(x(1)-x(7))*(x(1)-x(8))*(x(1)-x(9));

Lagrange_pol1(i) = fun(x(1))*(Lagrange_pol_nom1(i)/Lagrange_pol_denom1(i));


Lagrange_pol_nom2(i) =    (x_exact(i) -x(1))*(x_exact(i)-x(3))*(x_exact(i)-x(4))*(x_exact(i)-x(5))*(x_exact(i)-x(6))*(x_exact(i)-x(7))*(x_exact(i)-x(8))*(x_exact(i)-x(9));

Lagrange_pol_denom2(i) =  (x(2)- x(1))*(x(2)-x(3))*(x(2)-x(4))*(x(2)-x(5))*(x(2)-x(6))*(x(2)-x(7))*(x(2)-x(8))*(x(2)-x(9));

Lagrange_pol2(i) = fun(x(2))*(Lagrange_pol_nom2(i)/Lagrange_pol_denom2(i));



Lagrange_pol_nom3(i) =  (x_exact(i) -x(1))*(x_exact(i)-x(2))*(x_exact(i)-x(4))*(x_exact(i)-x(5))*(x_exact(i)-x(6))*(x_exact(i)-x(7))*(x_exact(i)-x(8))*(x_exact(i)-x(9));

Lagrange_pol_denom3(i) = (x(3)- x(1))*(x(3)-x(2))*(x(3)-x(4))*(x(3)-x(5))*(x(3)-x(6))*(x(3)-x(7))*(x(3)-x(8))*(x(3)-x(9));

Lagrange_pol3(i) = fun(x(3))*(Lagrange_pol_nom3(i)/Lagrange_pol_denom3(i));


Lagrange_pol_nom4(i) =  (x_exact(i) -x(1))*(x_exact(i)-x(2))*(x_exact(i)-x(3))*(x_exact(i)-x(5))*(x_exact(i)-x(6))*(x_exact(i)-x(7))*(x_exact(i)-x(8))*(x_exact(i)-x(9));

Lagrange_pol_denom4(i) = (x(4)- x(1))*(x(4)-x(2))*(x(4)-x(3))*(x(4)-x(5))*(x(4)-x(6))*(x(4)-x(7))*(x(4)-x(8))*(x(4)-x(9));

Lagrange_pol4(i) = fun(x(4))*(Lagrange_pol_nom4(i)/Lagrange_pol_denom4(i));



Lagrange_pol_nom5(i) =  (x_exact(i) -x(1))*(x_exact(i)-x(2))*(x_exact(i)-x(3))*(x_exact(i)-x(4))*(x_exact(i)-x(6))*(x_exact(i)-x(7))*(x_exact(i)-x(8))*(x_exact(i)-x(9));

Lagrange_pol_denom5(i) = (x(5)- x(1))*(x(5)-x(2))*(x(5)-x(3))*(x(5)-x(4))*(x(5)-x(6))*(x(5)-x(7))*(x(5)-x(8))*(x(5)-x(9));

Lagrange_pol5(i) = fun(x(5))*(Lagrange_pol_nom5(i)/Lagrange_pol_denom5(i));



Lagrange_pol_nom6(i) =  (x_exact(i) -x(1))*(x_exact(i)-x(2))*(x_exact(i)-x(3))*(x_exact(i)-x(4))*(x_exact(i)-x(5))*(x_exact(i)-x(7))*(x_exact(i)-x(8))*(x_exact(i)-x(9));

Lagrange_pol_denom6(i) = (x(6)- x(1))*(x(6)-x(2))*(x(6)-x(3))*(x(6)-x(4))*(x(6)-x(5))*(x(6)-x(7))*(x(6)-x(8))*(x(6)-x(9));

Lagrange_pol6(i) = fun(x(6))*(Lagrange_pol_nom6(i)/Lagrange_pol_denom6(i));


Lagrange_pol_nom7(i) =  (x_exact(i) -x(1))*(x_exact(i)-x(2))*(x_exact(i)-x(3))*(x_exact(i)-x(4))*(x_exact(i)-x(5))*(x_exact(i)-x(6))*(x_exact(i)-x(8))*(x_exact(i)-x(9));
Lagrange_pol_denom7(i) = (x(7)- x(1))*(x(7)-x(2))*(x(7)-x(3))*(x(7)-x(4))*(x(7)-x(5))*(x(7)-x(6))*(x(7)-x(8))*(x(7)-x(9));
Lagrange_pol7(i) = fun(x(7))*(Lagrange_pol_nom7(i)/Lagrange_pol_denom7(i));


Lagrange_pol_nom8(i) =  (x_exact(i) -x(1))*(x_exact(i)-x(2))*(x_exact(i)-x(3))*(x_exact(i)-x(4))*(x_exact(i)-x(5))*(x_exact(i)-x(6))*(x_exact(i)-x(7))*(x_exact(i)-x(9));

Lagrange_pol_denom8(i) = (x(8)- x(1))*(x(8)-x(2))*(x(8)-x(3))*(x(8)-x(4))*(x(8)-x(5))*(x(8)-x(6))*(x(8)-x(7))*(x(8)-x(9));

Lagrange_pol8(i) = fun(x(8))*(Lagrange_pol_nom8(i)/Lagrange_pol_denom8(i));


Lagrange_pol_nom9(i) =  (x_exact(i) -x(1))*(x_exact(i)-x(2))*(x_exact(i)-x(3))*(x_exact(i)-x(4))*(x_exact(i)-x(5))*(x_exact(i)-x(6))*(x_exact(i)-x(7))*(x_exact(i)-x(8));

Lagrange_pol_denom9(i) = (x(9)- x(1))*(x(9)-x(2))*(x(9)-x(3))*(x(9)-x(4))*(x(9)-x(5))*(x(9)-x(6))*(x(9)-x(7))*(x(9)-x(8));

Lagrange_pol9(i) = fun(x(9))*(Lagrange_pol_nom9(i)/Lagrange_pol_denom9(i));

Lagrange_pol(i) = Lagrange_pol1(i)+Lagrange_pol2(i)+Lagrange_pol3(i)+Lagrange_pol4(i)+Lagrange_pol5(i)+Lagrange_pol6(i)+Lagrange_pol7(i)+Lagrange_pol8(i)+Lagrange_pol9(i);


fellog_cheb(i) = log10(abs(Lagrange_pol(i) - func_exact(i)));
fel_cheb(i) = abs(Lagrange_pol(i) - func_exact(i));
end


figure

plot(x_exact,func_exact, ' r-',  'LineWidth',2)
 hold on
  
plot(x,  func_cheb,'o b-',  'LineWidth',2)


plot(x_exact,Lagrange_pol, ' g -',  'LineWidth',2)


  
  xlabel('x')
  ylabel('funktion f(x)')
  legend('exakt','Chebyshevpunkter linear interpolation','interpolation på Lagranges form i Chebyshevpunkter');
 % title(['x(1)=',num2str(x(1)),', x(2)= ',num2str(x(2))])
%title('(t-1)(t-2)(t-3)(t-4)/4!');

title('(t-1)(t-2)(t-3)(t-4)(t-5)(t-6)(t-7)(t-8)(t-9)(t-10)(t-11)/11!');	
figure

 plot(x_exact,fel_cheb, ' r -',  'LineWidth',2);


hold on

 plot(x_exact,fel, ' b -',  'LineWidth',2);
 xlabel('x')
  ylabel('fel: |LagrangePolyn - exakt|; ')
  legend('Fel med Chebyshevpunkter','Fel med ekvidistanta punkter');

%title('(t-1)(t-2)(t-3)(t-4)/4!');
 title('(t-1)(t-2)(t-3)(t-4)(t-5)(t-6)(t-7)(t-8)(t-9)(t-10)(t-11)/11!');

figure

 plot(x_exact,fellog_cheb, ' r -',  'LineWidth',2);


hold on

 plot(x_exact,fellog, ' b -',  'LineWidth',2);
 xlabel('x')
  ylabel('fel: log10|LagrangePolyn - exakt|; ')
  legend('Log10-fel med Chebyshevpunkter','Log10-fel med ekvidistanta punkter');
