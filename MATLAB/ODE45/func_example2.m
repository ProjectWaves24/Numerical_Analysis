
function dy = func_example2(t, y)

  dy = zeros(3,1);

dy(1) =y(2);
dy(2) =y(3);
dy(3) =  y(3)-2*t*y(2)+y(1)^2-t+1;
