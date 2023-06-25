theta = [0:20:360];
Siny = sin(theta*pi/180);
Cosy = cos(theta*pi/180);

subplot(2,1,1);
plot(theta,Siny,"-r*");
xlabel("theta");
ylabel("sin(theta)");
title("GRAFIK FUNGSI SINUS","fontsize",14,"color","r")

grid on

subplot(2,1,2);
plot(theta,Cosy,"-b*");
xlabel("theta");
ylabel("cos(theta)");
title("GRAFIK FUNGSI COSINUS","fontsize",14,"color","r")