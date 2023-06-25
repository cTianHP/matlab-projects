clear all;
clc;
xa=input("Input nilai xa = ");
xb=input("Input nilai xb = ");
E=input("Input nilai Toleransi = ")
i=0;
fxa=fungsi(xa);
fxb=fungsi(xb);
if (fxa*fxb>0 || xb<xa)
    disp("tidak ada akar")
else
    disp("iterasi          xa           xb             f(xa)          f(xb)            xt           f(xt)")
    xt=xa-((fungsi(xa)*(xb-xa))/(fungsi(xb)-fungsi(xa)));
    fxt=fungsi(xt);
    while (abs(fxt)>E);
        i=i+1;
        xt=xa-((fungsi(xa)*(xb-xa))/(fungsi(xb)-fungsi(xa)));
        fxt=fungsi(xt);
        fprintf("   %d        %f      %f        %f      %f        %f      %f \n",i,xa,xb,fxa,fxb,xt,fxt);
        if(fxa*fxt<0)
            xb=xt;
        else
            xa=xt;
        end
    end
end
x=xt;
disp("x = ")
disp(x)