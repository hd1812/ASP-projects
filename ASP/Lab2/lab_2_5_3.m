close all;
clear all;
load RRI_DH.mat
data1=detrend(RRI_trial_1);
data2=detrend(RRI_trial_2);
data3=detrend(RRI_trial_3);
[r1,lag1]=xcorr(data1,'unbiased');
[r2,lag2]=xcorr(data2,'unbiased');
[r3,lag3]=xcorr(data3,'unbiased');

figure;
subplot(3,1,1);
stem(lag1,r1);
grid on;
title('Autocorrelation on trial 1');
xlabel('Lag');
ylabel('Magnitude');


subplot(3,1,2);
stem(lag2,r2);
title('Autocorrelation on trial 1');
xlabel('Lag');
ylabel('Magnitude');


subplot(3,1,3);
stem(lag3,r3);
title('Autocorrelation');
xlabel('Lag');
ylabel('Magnitude');
grid on;