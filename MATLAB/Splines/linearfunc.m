
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Construction of columns in matrix A  using linear splines.
%   Input arguments: T - column vector with junction points, 
%   x are measurement ponts (discretization points).
%   Returns column with number k to the matrix A. 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function f= linearfunc(k,x,T) 

h=diff(T); 
N=length(T); 
f=zeros(size(x));
k
if k>1 
    I=find(x>=T(k-1) & x<=T(k))
  x(I)
  f(I)=  x(I)
end
if k<N
    disp('   if k < N')
    I=find(x>=T(k) & x<=T(k+1))
  f(I)=1;

    x(I)
 T(k) 
end
