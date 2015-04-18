clear all;
close all;
N=1000;
x=randn(N,1);
y=filter(ones(9,1),[1],x);
r_xy=xcorr(x,y,'unbiased')
lag=(-999:999);
subplot(3,1,1);stem(lag,r_xy);
axis([-25 20 -0.5 1.5]);
xlabel('Lag');
ylabel('Cross-correlation');
title('Cross-correlation of filtered and unfiltered WGN');