clear all;
clc;
xa=input("Input nilai xa = ");
xb=input("Input nilai xb = ");
E=input("Input Nilai Toleransi= ");
i=0;
fxa=fungsi(xa);
fxb=fungsi(xb);
if (fxa*fxb>0 || xb<xa)
    disp("tidak ada akar")
else
    disp("iterasi        xa           xb             f(xa)            f(xb)            xt           f(xt)")
    while (abs(xb-xa))>E
            i=i+1;
            xt=(xa+xb)/2;
            fxt=fungsi(xt);
            fprintf("   %d        %f      %f        %f      %f        %f      %f \n",i,xa,xb,fxa,fxb,xt,fxt);
        if(fxa*fxt<0)
            xb=xt;
        else
            xa=xt;
        end
    end
end
x=xa-((xb-xa)*fxa)/(fxb-fxa);
disp("x = ")
disp(x)