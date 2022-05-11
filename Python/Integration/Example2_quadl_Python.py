import scipy.integrate as isc
import matplotlib.pyplot as plt

x_calc = range(1,26)
N_calc = len(x_calc)

data = [0,5,11,16,21,40,40, 40, 40, 40, 40, 40, 40, 40, 40, 30, 30, 21, 17, 14, 11,8, 6, 2, 0]

# calculate integral med trapetsmetoden
int_calc = isc.trapezoid(data,x_calc);

for i in range(N_calc-1):
    plt.fill([x_calc[i],x_calc[i],x_calc[i+1],x_calc[i+1]],[0,data[i],data[i+1],0],'lime',edgecolor='k')
plt.fill([x_calc[0],x_calc[0],x_calc[1],x_calc[1]],[0,data[0],data[1],0],'lime',edgecolor='k',label='area (integral)')

plt.xlabel('Time (sec)')
plt.ylabel('Velocity (m/sec)')
plt.plot(x_calc,data,'r-o',label='data')
plt.title('Trapetsmetoden, Distance = Integral={:.3g}(m), N={}'.format(int_calc,N_calc))
plt.legend()