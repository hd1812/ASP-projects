close all;
clear all;
b=[0.2 0.2 0.2 0.2 0.2];
a=1;
w1=randn(128,1);
w2=randn(256,1);
w3=randn(512,1);
y1=pgm(w1);
y2=pgm(w2);
y3=pgm(w3);
y1_f=filter(b,a,y1);
y2_f=filter(b,a,y2);
y3_f=filter(b,a,y3);

subplot(3,1,1);
stem(y1_f);
grid on;
title('Smoothed Periodogram of WGN, N=128');
xlabel('Normalised Frequency');
ylabel('PSD')
subplot(3,1,2);
stem(y2_f);
grid on;
title('Smoothed Periodogram of WGN, N=256');
xlabel('Normalised Frequency');
ylabel('PSD')
subplot(3,1,3);
stem(y3_f);
grid on;
title('Smoothed Periodogram of WGN, N=512');
xlabel('Normalised Frequency');
ylabel('PSD')
grid on;