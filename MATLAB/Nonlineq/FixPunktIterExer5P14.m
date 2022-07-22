close all;

tolerance = 10e-15;

fun2 = @(x) sqrt(x+2);

fun3 = @(x)  1 + 2/x;
fun4 = @(x) (x^2 +2)/(2*x-1);


y2=0; y3=0;y4=0;
iteration_fixpunkt = 0;
func_fixpunkt = 0;
error_fixpunkt = 0;

%Initialiseringen: init guess
y2(1) = 2.5;
y3(1) = 2.5;
y4(1) = 2.5;
k=2;

iteration_fixpunkt(1) = 1;
func_fixpunkt(1) =fun2(y2(1));
y2(2) = fun2(y2(1));

% Main   fixpunkt's  iterations  
while abs( y2(k) - y2(k-1) ) > tolerance

y2(k+1) = fun2(y2(k));
iteration_fixpunkt(k) = k;
func_fixpunkt(k) =fun2(y2(k));

k = k+1;

if k == 100
break
end
  end

figure
 % plot(iteration_fixpunkt,error_fixpunkt, 'o b-','LineWidth',2)
 plot(iteration_fixpunkt,func_fixpunkt, 'o b-','LineWidth',2)
  
  xlabel('iteration')
  ylabel('function ')
grid on
 legend(['solution:',num2str(y2(k))]);
 %title(['Fixpunktsmetod, konvergens (iterations)'])

 
iterg2=k;
iteration_fixpunkt = 0;
func_fixpunkt = 0;
error_fixpunkt = 0;

k=2;

iteration_fixpunkt(1) = 1;
func_fixpunkt(1) =fun3(y3(1));
y3(2) = fun3(y3(1));


% Main   fixpunkt's  iterations  
while abs( y3(k) - y3(k-1) ) > tolerance

y3(k+1) = fun3(y3(k));
iteration_fixpunkt(k) = k;
func_fixpunkt(k) =fun3(y3(k));

k = k+1;

if k == 100
break
end
  end

hold on
%  figure
  plot(iteration_fixpunkt,func_fixpunkt, 'o c --','LineWidth',2)
  
  xlabel('iteration')
  ylabel('function ')
grid on
  legend(['solution:',num2str(y3(k))]);
% title(['Fixpunktsmetod, konvergens (iterations)'])

 iterg3=k;

iteration_fixpunkt = 0;
func_fixpunkt = 0;
error_fixpunkt = 0;


k=2;

iteration_fixpunkt(1) = 1;
func_fixpunkt(1) =fun4(y4(1));
y4(2) = fun4(y4(1));


% Main   fixpunkt's  iterations  
while abs( y4(k) - y4(k-1) ) > tolerance

y4(k+1) = fun4(y4(k));
iteration_fixpunkt(k) = k;
func_fixpunkt(k) =fun4(y4(k));

k = k+1;

if k == 100
break
end
  end

hold on
%  figure


  plot(iteration_fixpunkt,func_fixpunkt, 'o r  -','LineWidth',2)
  
  xlabel(['iterations: nr. iter.g2:',num2str(iterg2),', nr.iter. g3:', num2str(iterg3),' nr.iter. g4:', num2str(iterg4)])
  ylabel('function ')
grid on
  legend(['solution:',num2str(y4(k))]);
 title('Fixpunktsmetod, konvergens (iterations)')

 
iterg4=k;

 legend(['g_2 konv.iter.:',num2str(iterg2), ', solution:', num2str(y2(k))],['g_3 konv.iter.:',num2str(iterg3),', solution:', num2str(y3(k))],['g_4 konv.iter.:',num2str(iterg4), ', solution:', num2str(y4(k))]);
% legend(['g_2 konv.iter.:',num2str(y2(k))],['g_3 konv.iter.:',num2str(y3(k))],['g_4 konv.iter.:',num2str(y4(k))]);

 
%*********************************************************
n= -1.0;
p=3.0;
x_exact = linspace(n, p);
N = size(x_exact,2);

fun = @(x) x^2 -   x - 2;

 for i = 1:N
	    func_exact(i) =fun(x_exact(i));
 end
 
 
figure

plot(x_exact,func_exact, ' b-','LineWidth',2)
 legend(' x^2 - x - 2= 0 ');

  xlabel('  x')
  ylabel('function x^2 - x -2 = 0  ')

grid on


