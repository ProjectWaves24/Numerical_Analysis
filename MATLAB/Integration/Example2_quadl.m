close all;
clear


x_calc = 1:25;
N_calc = size(x_calc,2);

data = [0.0  5  11 16 21  40 ...
 40 40 40 40 40 40 40 40 40 30 30 21 17  14 11 ...
8 6 2 0];

% calculate integral med trapetsmetoden
int_calc = trapz(x_calc, data);

	
figure


xverts = [x_calc(1:end-1);x_calc(1:end-1);x_calc(2:end);x_calc(2:end)];
yverts = [zeros(1,N_calc-1);data(1:end-1);data(2:end);zeros(1,N_calc-1)];


patch(xverts, yverts,'g','LineWidth',1.5)

  hold on
plot(x_calc,data, ' r- o',  'LineWidth',2)
  
  xlabel(' Time (sec)')
  ylabel('  Velocity  (m/sec)')
legend('area (integral)','data');
title(['Trapetsmetoden, Distance = Integral=',num2str(int_calc),'(m), N=',num2str(N_calc)]);
