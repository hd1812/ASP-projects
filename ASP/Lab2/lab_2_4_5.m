clear all;
close all;
load sunspot.dat
N=250;
year=sunspot(1:N,1);
data1=sunspot(1:N,2);
real=sunspot(1:288,2);
m=mean(data1);
data=data1-m;
w=randn(288,1);

[coef1,v1] = aryule(data, 1);
[coef2,v2] = aryule(data, 2);
[coef5,v5] = aryule(data, 5);
[coef10,v10] = aryule(data, 10);
[coef20,v20] = aryule(data, 20);

y1=filter([1],coef1,w*sqrt(v1));
y2=filter([1],coef2,w*sqrt(v2));
y5=filter([1],coef5,w*sqrt(v5));
y10=filter([1],coef10,w*sqrt(v10));
y20=filter([1],coef20,w*sqrt(v20));

subplot(2,2,1);plot(y1);
title('AR1');
xlabel('Year');
ylabel('Sunspot');
grid on;
subplot(2,2,2);plot(y2);
title('AR2');
xlabel('Year');
ylabel('Sunspot');
grid on;
subplot(2,2,3);plot(y5);
title('AR5');
xlabel('Year');
ylabel('Sunspot');
grid on;
subplot(2,2,4);plot(y10);
title('AR10');
xlabel('Year');
ylabel('Sunspot');
grid on;

figure;
subplot(5,1,1);
plot(data);
title('Sample data');
xlabel('Year');
ylabel('Sunspot');
grid on;
hold on;
%legend('AR','True data');
hold off;

subplot(5,1,2);plot(y1);
title('AR1');
xlabel('Year');
ylabel('Sunspot');
grid on;
hold on;
plot(real-mean(real),'r');
%legend('AR','True data');
hold off;

subplot(5,1,3);plot(y2);
title('AR2');
xlabel('Year');
ylabel('Sunspot');
grid on;
hold on;
plot(real-mean(real),'r');
%legend('AR','True data');
hold off;

subplot(5,1,4);plot(y2);
title('AR5');
xlabel('Year');
ylabel('Sunspot');
grid on;
hold on;
plot(real-mean(real),'r');
%legend('AR','True data');
hold off;

subplot(5,1,5);plot(y10);
title('AR10');
xlabel('Year');
ylabel('Sunspot');
grid on;
hold on;
plot(real-mean(real),'r');
%legend('AR','True data');
hold off;

figure;
[H1,w1]=freqz(sqrt(v2),coef2);
periodogram(real);

