clear all;
close all;
N=1000;
x=randn(N,1);
r1=xcorr(x,'unbiased')
t1 = (-999 : 999);
subplot(3,1,1),plot(t1,r1) ; hold on;
grid on;
xlabel('Lag');
ylabel('Autocorrelation');
title('unbiased ACF of 1000 WGN');
%axis([-999,999,-1,1])


