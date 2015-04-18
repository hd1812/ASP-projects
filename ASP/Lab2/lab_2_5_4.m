clear all;
close all;
load RRI_DH.mat
N=960;
data1=detrend(RRI_trial_1);
data2=detrend(RRI_trial_2);
data3=detrend(RRI_trial_3);
[r1,lag1]=xcorr(data1,'unbiased');
[r2,lag2]=xcorr(data2,'unbiased');
[r3,lag3]=xcorr(data3,'unbiased');

w=randn(N,1);
m=mean(data3);

y = zeros(N,20);
data=data3-m;
vr=var(data);
data=data/sqrt(vr);
for i = 1:20
    [coef,v] = aryule(data, i);    % yw for Yule-Walker method
    y(:,i) = filter(1,coef,w*sqrt(v));
end

EP=zeros(20,1);
MDL=zeros(20,1);
AIC=zeros(20,1);
for i=1:20
    for j=1:N
        EP(i)=(y(j,i)-data(1,j))^2+EP(i,1);
    end
end

for i=1:20
    MDL(i,1)=log(EP(i,1))+i*log(N)/N;
    AIC(i,1)=log(EP(i,1))+2*i/N;
end
plot(MDL,'b');hold on;
plot(AIC,'g'); 
plot(log(EP),'r');hold off;
grid on;
xlabel('Order Number');
ylabel('Magnetude');
title('MDL,AIC and Cumulative Square Error for heart rate');
legend('AIC','MDL','Cumulative Squared Error','location','SouthEast');