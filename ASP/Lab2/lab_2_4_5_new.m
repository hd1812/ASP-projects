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
%Filter function in MATLAB use zero-extending
%AR1
%coefficients same as YW equations, LPC use least square formulation
[d1,p1] = aryule(data,1);
[d2,p2] = lpc(data,1);
[d1.', d2.']
y=filter(-d2(2:end),1,data);

stem([data(2:end),y(1:end-1)]);
title('AR2 model')
xlabel('Sample time');
ylabel('Signal value');
legend('Original autoregressive signal','Signal estimate from linear predictor');

%AR2
%coefficients same as YW equations, LPC use least square formulation
[d1,p1] = aryule(data,2);
[d2,p2] = lpc(data,2);
[d1.', d2.']
y=filter(-d2(2:end),1,data);
figure;
stem([data(2:end),y(1:end-1)]);
title('AR2 model')
xlabel('Sample time');
ylabel('Signal value');
legend('Original autoregressive signal','Signal estimate from linear predictor')

%AR10
%coefficients same as YW equations, LPC use least square formulation
[d1,p1] = aryule(data,5);
[d2,p2] = lpc(data,5);
[d1.', d2.']
y=filter(-d2(2:end),1,data);
figure;
stem([data(2:end),y(1:end-1)]);
title('AR2 model')
xlabel('Sample time');
ylabel('Signal value');
legend('Original autoregressive signal','Signal estimate from linear predictor')
