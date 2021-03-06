function [u]=Poisson2D_LU()

% main program for the solution of Poisson's equation
% - a laplace = f in 2D

close all
%Define input parameters
n=41; % number of inner nodes in one direction.
a_amp = 12; %  amplitude for the function a(x_1,x_2)
f_amp = 1000; % 1, 50, 100 choose const. f value
x_0=0.5;
y_0=0.5;
c_x=1;
c_y=1;

h = 1/(n+1); % define step length

% ----------------------------------------
% Computing all matrices and vectors
% ----------------------------------------
% Generate a n*n by n*n stiffness matrix
S = DiscretePoisson2D(n);

% factorize A using LU decomposition with pivoting
[L,U,P]=LU_PP(S);

%% generate coefficient matrix of a((x_1)_i,(x_2)_j) = a(i*h,j*h)
C = zeros(n,n);
for i=1:n
  for j=1:n
    C(i,j) = 1 + a_amp*exp(-((i*h-x_0)^2/(2*c_x^2)...
    +(j*h-y_0)^2/(2*c_y^2)));
  end
end
% create diagonal matrix from C
D = zeros(n^2,n^2);
for i=1:n
  for j=1:n
    D(j+n*(i-1),j+n*(i-1)) = C(i,j);
  end
end

%% calculate load vector f

% If f is constant.
% f = f_amp*ones(n^2,1);

% If f is Gaussian function.
f=zeros(n^2,1);
for i=1:n
  for j=1:n
    f(n*(i-1)+j)=f_amp*exp(-((i*h-x_0)^2/(2*c_x^2)...
    +(j*h-y_0)^2/(2*c_y^2)));
  end
end

% ----------------------------------------
% Solving the linear system of equations using Gaussian elimination
% ----------------------------------------
% We have system A u = 1/h^2 D L U u = f

% 1. Compute vector of right hand side
%  b = D^(-1)*f given by b(i,j)=f(i,j)/a(i,j)

b=zeros(n^2,1);
for i=1:n
  for j=1:n
    b(n*(i-1)+j)=f(n*(i-1)+j)/C(i,j); % Use coefficient matrix C or
    % diagonal matrix D to get a(i,j)
  end
end

% We now have system to solve: 1/h^2 A u = b
% Use first LU decomposition: 1/h^2 L U u = b
% 2. Compute v = L^(-1)*b by forward substitution.

v=ForwSub(L,P*b);

% We now have system 1/h^2 U u = v
% 3. Compute w = U^(-1)*v by backward substitution.

w=BackSub(U,v);

% 4. We now have system 1/h^2 u = w
% Compute finally solution as:  u=h^2*w
u=h^2*w;

% ----------------------------------------
% Plots and figures.
% ----------------------------------------

% sort the data in u into the mesh-grid, the boundary nodes are zero.
Z = zeros(n+2,n+2);
for i=1:n
  for j=1:n
    Z(i+1,j+1) = u(j+n*(i-1));
  end
end

%% plotting
x1=0:h:1;
y1=0:h:1;
subplot(2, 2, 1)
%figure(1)
surf(x1,y1,Z) % same plot as above, (x1, y1 are vectors)
view(2)
colorbar
xlabel('x_1')
ylabel('x_2')
zlabel('u(x_1,x_2)')
title( ['u(x_1,x_2) with A = ',num2str(a_amp),...
',  N = ',num2str(n)])

%figure(2)
subplot(2, 2, 2)
surf(x1,y1,Z) % same plot as above
colorbar
xlabel('x_1')
ylabel('x_2')
zlabel('u(x_1,x_2)')
title( ['u(x_1,x_2) with A = ',num2str(a_amp),...
', N = ',num2str(n)])

% Plotting a(x,y)
Z_a= zeros(n+2);
for i=1:(n+2)
  for j=1:(n+2)
    Z_a(i,j)= 1 + a_amp*exp(-((i*h-x_0)^2/(2*c_x^2)...
    +(j*h-y_0)^2/(2*c_y^2)));
  end
end


%figure(3)
subplot(2, 2, 3)


surf(x1,y1,Z_a)
xlabel('x_1')
ylabel('x_2')
zlabel('a(x_1,x_2)')
title( ['a(x_1,x_2) with A = ',num2str(a_amp)])

%  plott the function f(x,y)
Z_f= zeros(n+2);
for i=1:(n+2)
  for j=1:(n+2)
    Z_f(i,j)=f_amp*exp(-((x1(i)-x_0)^2/(2*c_x^2)...
    +(y1(j)-y_0)^2/(2*c_y^2)));
  end
end


%figure(4)
subplot(2, 2, 4)

surf(x1,y1,Z_f)
xlabel('x_1')
ylabel('x_2')
zlabel('f(x_1,x_2)')
title( ['f(x_1,x_2) with A_f = ',num2str(f_amp)])


