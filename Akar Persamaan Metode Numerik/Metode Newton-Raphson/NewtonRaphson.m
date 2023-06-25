clear;clc;
x0=input("Input nilai x0 = ");
E=input("Input nilai Toleransi = ");
i=0;
fx0=fungsi(x0);
disp("iterasi        x0                fx0             xl")
while(abs(fx0)>E)
    fxturunanx0=fungsiturunan(x0);    
    xl=x0-(fx0)/(fxturunanx0);
    i=i+1;
    x0=xl;
    fx0=fungsi(x0);
    fprintf("    %d       %f         %f       %f\n",i,x0,fx0,xl);
end
x=x0;
disp("x = ")
disp(x)