clear all;
close all;
load sunspot.dat
N=250;
year=sunspot(1:N,1);
data1=sunspot(1:N,2);
real=sunspot(1:288,2);
m=mean(data1);
data=data1-m;
w=randn(N,1);

%Using random noise as input only produces the right power spectrum density.
%The actual graph is one of the possible states of using white Guassian
%Noise. 
%Here we use past values only is already an estimate of future value

%AR1
subplot(3,1,1);
[d1,p1] = aryule(data,1);
[d2,p2] = lpc(data,1);
[d1.', d2.']
y=filter(-d2(2:end),1,data);
for i =1:9
    data=[data(2:end);y(end)];
    y=filter(-d2(2:end),1,data);
    stem([data(2:end),y(1:end-1)]);
    title('AR2 model')
    xlabel('Sample time');
    ylabel('Signal value');
    legend('Original autoregressive signal','Signal estimate from linear predictor');
end
data_p=y(end-9:end);
data1=sunspot(1:N,2);
real=sunspot(1:288,2);
m=mean(data1);
data=data1-m;
data_t=data(end-9:end);
stem([data_p,data_t]);
grid on;
title('AR1, Comparison between predicted and real values')
xlabel('Sample time');
ylabel('Signal value');
legend('Predicted value','Real value','Location','NorthWest');



%AR2
%coefficients same as YW equations, LPC use least square formulation
subplot(3,1,2);
[d1,p1] = aryule(data,2);
[d2,p2] = lpc(data,2);
[d1.', d2.']
y=filter(-d2(2:end),1,data);
for i =1:9
    data=[data(2:end);y(end)];
    y=filter(-d2(2:end),1,data);
    stem([data(2:end),y(1:end-1)]);
    title('AR2 model')
    xlabel('Sample time');
    ylabel('Signal value');
    legend('Original autoregressive signal','Signal estimate from linear predictor');
end
data_p=y(end-9:end);
data1=sunspot(1:N,2);
real=sunspot(1:288,2);
m=mean(data1);
data=data1-m;
data_t=data(end-9:end);
stem([data_p,data_t]);
grid on;
title('AR2, Comparison between predicted and real values')
xlabel('Sample time');
ylabel('Signal value');
legend('Predicted value','Real value','Location','NorthWest');



%AR10
subplot(3,1,3);
[d1,p1] = aryule(data,10);
[d2,p2] = lpc(data,10);
[d1.', d2.']
y=filter(-d2(2:end),1,data);
for i =1:9
    data=[data(2:end);y(end)];
    y=filter(-d2(2:end),1,data);
    stem([data(2:end),y(1:end-1)]);
    title('AR2 model')
    xlabel('Sample time');
    ylabel('Signal value');
    legend('Original autoregressive signal','Signal estimate from linear predictor');
end
data_p=y(end-9:end);
data1=sunspot(1:N,2);
real=sunspot(1:288,2);
m=mean(data1);
data=data1-m;
data_t=data(end-9:end);
stem([data_p,data_t]);
grid on;
title('AR10, Comparison between predicted and real values')
xlabel('Sample time');
ylabel('Signal value');
legend('Predicted value','Real value','Location','NorthWest');
