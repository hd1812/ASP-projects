clear all;
close all;
load sunspot.dat
N=288;
w=randn(N,1);
year=sunspot(1:N,1);
data1=sunspot(1:N,2);
m=mean(data1);

y = zeros(N,20);
data=data1-m;
vr=var(data);
data=data/sqrt(vr);
for i = 1:20
    [coef,v] = aryule(data, i);    % yw for Yule-Walker method
    y(:,i) = filter(-coef,1,data)+data; %use the past two data to predict current data
                                   %
end

EP=zeros(20,1);
MDL=zeros(20,1);
AIC=zeros(20,1);
for i=1:20
    for j=1:N
        EP(i)=(y(j,i)-data(j,1))^2+EP(i,1);
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
title('MDL,AIC and Cumulative Square Error');
legend('AIC','MDL','Cumulative Squared Error','location','SouthEast');