close all;
clear all;
load RRI_DH.mat
data1=RRI_trial_1;
data2=RRI_trial_2;
data3=RRI_trial_3;
plot(data1);hold on;
plot(data2,'r');hold on;
plot(data3,'g');hold on;
grid on;

h=60./data1;
h_bar=zeros(length(data1)/10,1);
h_bar1=zeros(length(data2)/10,1);
h_bar2=zeros(length(data3)/10,1);

alpha=1;
for i=1:length(h_bar1)
    h_bar1(i,1)=alpha*mean(h(10*i-9:10*i));
end

alpha=0.6;
for i=1:length(h_bar2)
    h_bar2(i,1)=alpha*mean(h(10*i-9:10*i));
end
figure;
subplot(2,1,1);
pdf(h_bar1); hold on;
grid on;
title('alpha=1, PDE of hear rate');
xlabel('heart rate');
ylabel('probability');

subplot(2,1,2);
pdf(h_bar2); hold on;
grid on;
title('alpha=0.6, PDE of hear rate');
xlabel('heart rate');
ylabel('probability');

figure;
pdf(h);
grid on;
title('Original hear rate pdf');
xlabel('heart rate');
ylabel('probability');