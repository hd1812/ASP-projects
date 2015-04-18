clear all;
close all;
N=1000;
x=randn(N,1);
r1=xcorr(x,'unbiased')
t1 = (-999:999);
plot(t1,r1)
figure;
%subplot(4,1,1); stem(t1,r1), hold on;
xlabel('Lag');
ylabel('Autocorrelation');
axis([-20 20 -0.3 1])

y=filter(ones(9,1),[1],x);
r2=xcorr(y,'unbiased')
t2=(-999:999);
subplot(3,1,1);stem(t2,r2);hold on;
axis([-20 20 -1 10]);
xlabel('Lag');
ylabel('Autocorrelation');
title('ACF of filtered WGN');

x2=[1;zeros(19,1)];
y=filter(ones(9,1),[1],x2);
r2=xcorr(y,'unbiased')
t2=(-999:999);
subplot(3,1,2);stem(0:19,y)%stem(t2,r2)
%axis([-20 20 inf inf]);
xlabel('Lag');
ylabel('Autocorrelation');
title('Impulse response of filter');

x2=[1;zeros(999,1)];
y=filter(ones(9,1),[1],x2);
r2=xcorr(y,'unbiased')
t2=(-999:999);
subplot(3,1,3);stem(t2,r2);
axis([-20 20 0 10^-2]);
xlabel('Lag');
ylabel('Autocorrelation');
title('ACF of impulse response of filter');