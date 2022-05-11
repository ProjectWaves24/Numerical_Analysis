
import numpy as np
#
#   Solution of the system of linear equations A^T Ax = A^T b
#   using Cholesky factorization of A^T A. 
#   Matrix A is m-by-n, m > n, the vector of the rhs b is of the size n.
#



# Solver for LL^T x = A^Tb
def LLSChol(A,b):
    ATb = np.transpose(A)@b
    ATA = np.transpose(A)@A

    def cholesky(M):
        N = len(M) 
        L = np.zeros([N,N]) #zero matrix

        #Cholesky
        for i in range(N):
            for j in range(i+1):
                s=0.0
                for k in range(j):
                    s=s+L[i][k]*L[j][k]

                if i == j:
                    L[i][j] = np.sqrt(M[i][i] - s)
                else:
                    L[i][j] = 1/L[j][j] * (M[i][j] - s)
        return L
    
    lowerChol=cholesky(ATA)
    
    def forward_sub(L,b):
        N=len(b)
        y=[]
        for i in range(N):
            y.append(b[i])
            for j in range(i):
                y[i]=y[i]-(L[i,j]*y[j])
            y[i]=y[i]/L[i,i]
    
        return y
    
    # Define z=L^Tx, then solve
    # Lz=A^T b to find z.
    # forward substitution Lz=A^T b to obtain z 
    z=forward_sub(lowerChol,ATb) 
    

    def backward_sub(U,y):
        N=len(y)
        x=np.zeros(N)
        for i in range(N-1,-1,-1): #algoritm 
            x[i]=(y[i] - np.dot(U[i,i+1:],x[i+1:]))/U[i,i] #U[i,i+1:] full row after index
        return x
    
    # After by known z we get x.
    # Solution of L^Tx=z , backward substitution
    x=backward_sub(np.transpose(lowerChol),z)


    return x # Obtained solution
    













    
    


