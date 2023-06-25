clear all;
clc;
disp("Metode Dekomposisi LU")
disp("Bentuk persemaan: Ax = b")
A = input("Input Matrix A: ");
b = input("Input Matrix b: ");
[p,q]= size(A);
if p~=q
    disp("Matrix harus Matrix persegi")
else
    L=zeros(p);
    U=zeros(p);
    
    for i=1:p
        L(i,1)=A(i,1);
    end

    for j=1:p
        U(1,j)=A(1,j)/L(1,1);
    end

    for j = 2:p
        for i = j:p
            sum = 0;
            for k = 1:(j-1)
                sum = sum + L(i,k)*U(k,j);
            end
            L(i,j)=A(i,j)-sum;
        end

        U(j,j)=1;

        for i = (j+1):p
            sum = 0;
            for k = 1:(j-1)
                sum = sum + L(j,k)*U(k,i);
            end
            U(j,i)=(A(j,i)-sum)/L(j,j);
        end
    end
    Y(1)=b(1)/L(1,1);
    for k = 2:p
        sigma=0;
        for j = 1:k-1
            sigma=sigma+L(k,j)*Y(j);
            Y(k) = (b(k)-sigma)/L(k,k);
        end
    end
    Y=Y';
    x(p)= Y(p)/U(p,p);
    for k = p-1:-1:1
        sigma = 0;
        for j = k+1:p
            sigma = sigma+U(k,j)*x(j);
            x(k)=(Y(k)-sigma)/U(k,k);
        end
    end
    A
    b
    L
    U
    Y
    x=x'
end