
function F = func1(x,c)
  F = [ 2*x(1) - exp(c*x(1)); -x(1) - exp(c*x(2)); x(1) - x(2)];
