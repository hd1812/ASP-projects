clear all;
close all;
load sunspot.dat
N=250;
year=sunspot(1:N,1);
data =sunspot(1:N,2);
m=mean(data);
ar=zeros(10,N);
test=aryule(data,2);
v=var(data);
data_non_mean=data-m;
data_uv=data/sqrt(v);

ar_1=aryule(data,1);
ar_2=aryule(data,2);
ar_3=aryule(data,3);
ar_4=aryule(data,4);
ar_5=aryule(data,5);
ar_6=aryule(data,6);
ar_7=aryule(data,7);
ar_8=aryule(data,8);
ar_9=aryule(data,9);
ar_10=aryule(data,10);

arn_1=aryule(data_non_mean,1);
arn_2=aryule(data_non_mean,2);
arn_3=aryule(data_non_mean,3);
arn_4=aryule(data_non_mean,4);
arn_5=aryule(data_non_mean,5);
arn_6=aryule(data_non_mean,6);
arn_7=aryule(data_non_mean,7);
arn_8=aryule(data_non_mean,8);
arn_9=aryule(data_non_mean,9);
arn_10=aryule(data_non_mean,10);

aruv_1=aryule(data_uv,1);
aruv_2=aryule(data_uv,2);
aruv_3=aryule(data_uv,3);
aruv_4=aryule(data_uv,4);
aruv_5=aryule(data_uv,5);
aruv_6=aryule(data_uv,6);
aruv_7=aryule(data_uv,7);
aruv_8=aryule(data_uv,8);
aruv_9=aryule(data_uv,9);
aruv_10=aryule(data_uv,10);

figure;
subplot(3,1,1);
hold on
plot(ar_1,'y');
plot(ar_2,'m');
plot(ar_3,'c');
plot(ar_4,'r');
plot(ar_5,'g');
plot(ar_6,'b');
plot(ar_7,'m');
plot(ar_8,'w');
plot(ar_9,'k');
plot(ar_10);
hold off;
grid on;
xlabel('Coefficient Number');
ylabel('Normalised Magnetude');
title('Non-zero mean coefficients estimation');


subplot(3,1,2);
hold on
plot(arn_1,'y');
plot(arn_2,'m');
plot(arn_3,'c');
plot(arn_4,'r');
plot(arn_5,'g');
plot(arn_6,'b');
plot(arn_7,'m');
plot(arn_8,'w');
plot(arn_9,'k');
plot(arn_10);
hold off;
grid on;
xlabel('Coefficient Number');
ylabel('Normalised Magnetude');
title('Zero mean coefficients estimation')

subplot(3,1,3);
hold on
plot(aruv_1,'y');
plot(aruv_2,'m');
plot(aruv_3,'c');
plot(aruv_4,'r');
plot(aruv_5,'g');
plot(aruv_6,'b');
plot(aruv_7,'m');
plot(aruv_8,'w');
plot(aruv_9,'k');
plot(aruv_10);
hold off;
grid on;
xlabel('Coefficient Number');
ylabel('Normalised Magnetude');
title('Unit variance coefficients estimation')

figure;
pyulear(data,2);%hold on;
figure;
co=xcorr(data);
plot(co,'r');%hold off;

PAC1=zeros(10,1);

PAC1(1,1)=ar_1(1,2);
PAC1(2,1)=ar_2(1,3);
PAC1(3,1)=ar_3(1,4);
PAC1(4,1)=ar_4(1,5);
PAC1(5,1)=ar_5(1,6);
PAC1(6,1)=ar_6(1,7);
PAC1(7,1)=ar_7(1,8);
PAC1(8,1)=ar_8(1,9);
PAC1(9,1)=ar_9(1,10);
PAC1(10,1)=ar_10(1,11);

PAC2=zeros(10,1);

PAC2(1,1)=arn_1(1,2);
PAC2(2,1)=arn_2(1,3);
PAC2(3,1)=arn_3(1,4);
PAC2(4,1)=arn_4(1,5);
PAC2(5,1)=arn_5(1,6);
PAC2(6,1)=arn_6(1,7);
PAC2(7,1)=arn_7(1,8);
PAC2(8,1)=arn_8(1,9);
PAC2(9,1)=arn_9(1,10);
PAC2(10,1)=arn_10(1,11);

PAC3=zeros(10,1);
PAC3(1,1)=aruv_1(1,2);
PAC3(2,1)=aruv_2(1,3);
PAC3(3,1)=aruv_3(1,4);
PAC3(4,1)=aruv_4(1,5);
PAC3(5,1)=aruv_5(1,6);
PAC3(6,1)=aruv_6(1,7);
PAC3(7,1)=aruv_7(1,8);
PAC3(8,1)=aruv_8(1,9);
PAC3(9,1)=aruv_9(1,10);
PAC3(10,1)=aruv_10(1,11);


figure;
subplot(3,1,1);stem(PAC1,'b');
title('Non-zero mean Partial Autocorrelation Function')
xlabel('Coefficient Number');
ylabel('Magnetude');
grid on;
subplot(3,1,2);stem(PAC2,'r');
title('Zero mean Partial Autocorrelation Function')
xlabel('Coefficient Number');
ylabel('Magnetude');
grid on;
subplot(3,1,3);stem(PAC3,'k');
title('Unit variance Partial Autocorrelation Function')
xlabel('Coefficient Number');
ylabel('Magnetude');
grid on;
figure;
subplot(3,1,1);parcorr(data);
%figure;
%m=mean(data);
%subplot(3,1,1);parcorr(data);
%figure;
%v=var(data);
%subplot(3,1,1);parcorr(data/sqrt(v));
