clear all;
clc;
disp("Metode Choleskey")
disp("Bentuk persamaan: Ax = b")
A = input("Input Matrix A: ");
b = input("Input Matrix b: ");
[p,q]= size(A);
temp = A';
control = false;
if p==q
    disp("Matrix Persegi")
else
    disp("Bukan Matrix Persegi")
end
if A==temp
    disp("Matrix Simetri")
    control=true;
else
    disp("Matrix Tidak Simetri")
end    

if p==q && control
    R = chol(A);
    A
    b
    x = R\(R'\b)

else
    disp("SPL Tidak bisa diselesaikan dengan Metode Cholesky")
end