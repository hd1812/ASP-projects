clear all;
close all;
a=[1 0.9];
b=[1];
x=randn(1064,1);
f=filter(b,a,x);
y=f(41:end);

R=xcorr(y,'unbiased');
plot(R)
RY0=R(1024);
RY1=R(1025);
a1=-RY1/RY0;
v=RY0+a1*RY1;

%model based
subplot(2,1,1);
[h,w]=freqz(sqrt(v),[1,a1]);
plot(w/(2*pi),abs(h).^2);
grid on;
hold on;
title('Model based PSD estimate');
xlabel('Normalised Frequency');
ylabel('Magnitude');

%pgm
subplot(2,1,2);
s=(0:0.5/512:0.5-0.5/512)
y_f=pgm(y);
y_f1=y_f(1:end/2);
plot(s,y_f1);
grid on;
title('Periodogram estimation');
xlabel('Normalised Frequency');
ylabel('Magnitude');