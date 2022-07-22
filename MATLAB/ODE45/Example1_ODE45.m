close all;
clear


options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4 1e-5]);
[T,Y] = ode45(@func_example1,[0 12],[0 1 1],options);

plot(T,Y(:,1),'b-',T,Y(:,2),'r-',T,Y(:,3),'g-','LineWidth',2)
hold on

[T,Y] = ode45(@funcstabil_example1,[0 12],[0 1 1],options);

plot(T,Y(:,1),'b--',T,Y(:,2),'r--',T,Y(:,3),'g--','LineWidth',2)


legend('y_1', 'y_2', 'y_3','y_1','y_2','y_3')
xlabel('t')

title(' System av ODE: dy_1/dt=y_2 y_3,dy_2/dt=-y_1 y_3,dy_3/dt=-0.51y_1 y_2, y_1(0)=0,y_2(0)=1,y_3(0)=1')
grid on
