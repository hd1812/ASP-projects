close all;
clear all;
N=1000;
w1=randn(128,1);
w2=randn(256,1);
w3=randn(512,1);
y1=pgm(w1);
y2=pgm(w2);
y3=pgm(w3);
subplot(3,1,1);
stem(y1);
grid on;
title('Periodogram of WGN, N=128');
xlabel('Normalised Frequency');
ylabel('PSD')
subplot(3,1,2);
stem(y2);
grid on;
title('Periodogram of WGN, N=256');
xlabel('Normalised Frequency');
ylabel('PSD')
subplot(3,1,3);
stem(y3);
grid on;
title('Periodogram of WGN, N=512');
xlabel('Normalised Frequency');
ylabel('PSD')
grid on;