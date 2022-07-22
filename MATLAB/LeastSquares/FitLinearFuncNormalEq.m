% ----------------------------------------
%   Solution of least squares  problem  min_x || Ax - y ||_2
%   using the method of normal equations.
%   Matrix  A is constructed as a Vandermonde matrix.
%   Program performs fitting to the function y = 5x+7
% --------------------------------------------------------------

d=1;  % degree of the polynomial
m=20;%number of discretization points or rows in the matrix A

x=zeros(1,m);
y=zeros(1,m);
b=zeros(1,m);

x = linspace(0,10.0,m); 

A=[];
brus = 0.1;
brus = brus*60.0*randn(size(x));

for i=1:1:m
	
  %  exact function which should be approximated
b(i) = 5*x(i) + 7;

% genererar observationer  med random brus

y(i) =  b(i) + brus(i);

end

% construction of a Vandermonde matrix

for i=1:1:m
  for j=1:1:d+1
    A(i,j)=power(x(i),j-1);
  end
end

% computing the right hand side in the method of normal equations
c=A'*y';

% computing matrix in the left hand side in the method of normal equations
C=A'*A;

l=zeros(d+1);

% solution of the normal equation using Cholesky decomposition

for j=1:1:d+1
  s1=0;
  for k=1:1:j-1
    s1=s1+l(j,k)*l(j,k);
  end
  l(j,j)=(C(j,j)-s1)^(1/2);
  for i=j+1:1:d+1
    s2=0;
    for k=1:1:j-1
      s2=s2+l(i,k)*l(j,k);
    end
    l(i,j)=(C(i,j)-s2)/l(j,j);
  end
end
for i=1:1:d+1
  for k=1:1:i-1
    c(i)=c(i)-c(k)*l(i,k);
  end
  c(i)=c(i)/l(i,i);
end
for i=d+1:-1:1
  for k=d+1:-1:i+1
    c(i)=c(i)-c(k)*l(k,i);
  end
  c(i)=c(i)/l(i,i);
end

figure(1)
plot(x,b,'o- r', 'linewidth',1)
hold on


% computed coefficients

c

% compute approximation to this exact polynomial with comp. coefficients c
approx = A*c;
plot(x,approx,'*- b', 'linewidth',1)

% plot of noisy  data
plot(x,y,'o b', 'linewidth',2)

hold off

str_xlabel = ['poly.degree d=', num2str(d)];

legend('exact y(i) = 7+ 5*x(i)', str_xlabel,'noisy data');

xlabel('x')
  title('Normal equations via Cholesky for recovering  b = 7 + 5x')

% computation of the relative error  in coefficients to be recovered as
%  norm(approx. value - true value) / norm(true value)

exact_c =[7,5];
relerror_coef =norm(exact_c'- c)/norm(exact_c')

% computation of the relative error  in function to be recovered as
%  norm(approx. value - true value) / norm(true value)


relerror_func = norm(y'- approx)/norm(y')
