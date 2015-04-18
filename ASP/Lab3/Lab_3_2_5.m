close all;
clear all;
load sunspot.dat
N=250;
order=1;
year=sunspot(1:N,1);
data1=sunspot(1:N,2);
m=mean(data1);
%data=data1-m;
%variance=var(data);
%data=data/sqrt(variance);
data=data1;
w=randn(288,1);

%model based
[coef1,v1] = aryule(data, 1);
[coef2,v2] = aryule(data, 2);
[coef3,v3] = aryule(data, 3);
[coef5,v5] = aryule(data, 5);
[coef10,v10] = aryule(data, 10);
[coef20,v20] = aryule(data, 20);

y1_f=filter([1],coef1,w*sqrt(v1));
y2_f=filter([1],coef2,w*sqrt(v2));
y3_f=filter([1],coef3,w*sqrt(v3));
y5_f=filter([1],coef5,w*sqrt(v5));
y10_f=filter([1],coef10,w*sqrt(v10));
y20_f=filter([1],coef20,w*sqrt(v20));

y1=y1_f(39:end);
y2=y2_f(39:end);
y3=y3_f(39:end);
y5=y5_f(39:end);
y10=y10_f(39:end);
y20=y20_f(39:end);

R=xcorr(y1,'unbiased');
plot(R)
RY=R(250:end);
a=-RY/RY(1,1);
v=RY(1,1)+a(2,1)*RY(2,1);
coefs=[1;a(2:order+1)];

figure;
subplot(3,1,1);hold on;
[h,w]=freqz(sqrt(v1),coef1);
plot(w/(2*pi),abs(h).^2);
grid on;
hold on;
title('Model based PSD estimate and Periodogram');
xlabel('Normalised Frequency');
ylabel('Magnitude');

%periodogram
%subplot(3,1,2);
s=(0:0.5/125:0.5-0.5/125)
y_f=pgm(data);
y_f1=y_f(1:end/2);
plot(s,y_f1,'r');
grid on;
xlabel('Normalised Frequency');
ylabel('Magnitude');
legend('AR1 Model Based PSD','Periodogram');

subplot(3,1,2);hold on;
[h,w]=freqz(sqrt(v2),coef2);
plot(w/(2*pi),abs(h).^2);
grid on;
hold on;
title('Model based PSD estimate and Periodogram');
xlabel('Normalised Frequency');
ylabel('Magnitude');

%periodogram
%subplot(3,1,2);
s=(0:0.5/125:0.5-0.5/125)
y_f=pgm(data);
y_f1=y_f(1:end/2);
plot(s,y_f1,'r');
grid on;
title('Periodogram estimation');
xlabel('Normalised Frequency');
ylabel('Magnitude');
legend('AR2 Model Based PSD','Periodogram');

subplot(3,1,3);hold on;
[h,w]=freqz(sqrt(v10),coef10);
plot(w/(2*pi),abs(h).^2);
grid on;
hold on;
title('Model based PSD estimate and Periodogram');
xlabel('Normalised Frequency');
ylabel('Magnitude');

%periodogram
%subplot(3,1,2);
s=(0:0.5/125:0.5-0.5/125)
y_f=pgm(data);
y_f1=y_f(1:end/2);
plot(s,y_f1,'r');
grid on;
title('Periodogram estimation');
xlabel('Normalised Frequency');
ylabel('Magnitude');
legend('AR10 Model Based PSD','Periodogram');