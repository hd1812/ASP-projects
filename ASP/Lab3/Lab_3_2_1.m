clear all;
close all;
b=1;
a=[1, 0.9];
x=randn(1064,1);
f=filter(b,a,x);
y=f(41:end);

[h,w]=freqz(1,[1 0.9],512);
subplot(2,1,1);
plot(w/(2*pi),abs(h).^2);hold on;
grid on;
title('Power spectral estimation');
xlabel('Normalised Frequency');
ylabel('Magnitude');

s=(0:0.5/512:0.5-0.5/512)
y_f=pgm(y);
y_f1=y_f(1:end/2);
plot(s,y_f1,'r');
%subplot(3,1,2);
%plot(w,abs(h));
axis([0.4 0.5 0 200]);

subplot(2,1,2);
s=(0:1/1024:1-1/1024);
plot(s,y_f,'r');
grid on;