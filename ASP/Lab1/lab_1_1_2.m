clear all;
close all;
N=1000;
x=rand(N,10);       %create a matrix of 1000*1
Avgs=mean(x);       %calculate sample means
std_devs=std(x);    %calculate sample deviation

i=(0:0.01:10); 
y=0.5; 

stem(Avgs); hold on    %Theoritical mean is 0.5, plot bias of sample mean
plot(i,y,'r');hold off
title('sample mean of ten 1000 realisations of uniform distribution')
figure

stem(std_devs); hold on  %plot bias of sample deviation
plot(i,sqrt(1/12),'r');hold off
title('standard deviation of ten 1000 realisations of uniform distribution')
%Bias shows how close the sample mean and sample deviation is to the
%theoretical value. Bias is expected to decrease as sample number
%increases.

stem(Avgs-0.5);     %Theoritical mean is 0.5, plot bias of sample mean
title('sample mean')
figure

stem(std_devs-sqrt(1/12));   %plot bias of sample deviation
title('standard deviation')
%Bias shows how close the sample mean and sample deviation is to the
%theoretical value. Bias is expected to decrease as sample number
%increases.