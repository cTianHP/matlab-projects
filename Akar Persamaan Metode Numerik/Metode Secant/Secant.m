clear all;
clc;
xa=input("Input nilai xa = ");
xb=input("Input nilai xb = ");
E=input("Input nilai Toleransi = ");
i=0;
fxa=fungsi(xa);
fxb=fungsi(xb);
if (fxa*fxb>0)
    disp("tidak ada akar")
else
    disp("iterasi        xa           xb                f(xa)          f(xb)            xl")
    while (abs(fxb)>E)
        i=i+1;
        fxa=fungsi(xa);
        fxb=fungsi(xb);
        xl=xb-((fxb*(xb-xa))/(fxb-fxa));
        xa=xb;
        xb=xl;
        fxb=fungsi(xl);
        fprintf("   %d        %f      %f        %f      %f        %f \n",i,xa,xb,fxa,fxb,xl);
    end
end
x=xb;
disp("x = ")
disp(x)
