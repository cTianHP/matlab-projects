clc
theta = 0: 2*pi/40 : 2*pi;
y = sin(theta);
plot(theta,y,"-ro")
hold on
y = cos(theta);
plot(theta,y,"-b*")
legend("sin","cos")
xlabel("theta")
ylabel("sin(theta) or cos(theta)")
title("sin and cos on one graph")