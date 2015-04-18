clear all;
close all;
N1=5;
N2=50;
N3=250;
load sunspot.dat
%ACF with mean
year=sunspot(1:N1,1);
data=sunspot(1:N1,2);
[acf,lag]=xcorr(data,'unbiased');
subplot(3,1,1);stem(lag,acf);
xlabel('lag');
ylabel('Autocorrelation');
title('Autocorrelation of sunspot,N=5');


year=sunspot(1:N2,1);
data=sunspot(1:N2,2);
[acf,lag]=xcorr(data,'unbiased');
subplot(3,1,2);stem(lag,acf);
xlabel('lag');
ylabel('Autocorrelation');
title('Autocorrelation of sunspot,N=50');


year=sunspot(1:N3,1);
data=sunspot(1:N3,2);
[acf,lag]=xcorr(data,'unbiased');
subplot(3,1,3);stem(lag,acf);
xlabel('lag');
ylabel('Autocorrelation');
title('Autocorrelation of sunspot,N=250');


%ACF without mean
figure;
year=sunspot(1:N1,1);
data=sunspot(1:N1,2);
m=mean(data);
[acf,lag]=xcorr(data-m,'unbiased');
subplot(3,1,1);stem(lag,acf);
xlabel('lag');
ylabel('Autocorrelation');
title('Autocorrelation of sunspot,N=5');


year=sunspot(1:N2,1);
data=sunspot(1:N2,2);
mean=data;
[acf,lag]=xcorr(data-m,'unbiased');
subplot(3,1,2);stem(lag,acf);
xlabel('lag');
ylabel('Autocorrelation');
title('Autocorrelation of sunspot,N=50');


year=sunspot(1:N3,1);
data=sunspot(1:N3,2);
mean=data;
[acf,lag]=xcorr(data-m,'unbiased');
subplot(3,1,3);stem(lag,acf);
xlabel('lag');
ylabel('Autocorrelation');
title('Autocorrelation of sunspot,N=250');
