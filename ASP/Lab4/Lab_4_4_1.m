close all;
clear all;
b=1;
a=[1,0.9,0.2];
N=100000;
order=2;
u=0.0001;

n=randn(N,1);
x=filter(b,a,n);


%perform AR recognition/estimation


[y_w,e,w]=lms_AR_id(x,u,order);

subplot(2,1,1);
plot(w(:,1));hold on;
plot(w(:,2),'r');hold on;

grid on;
legend('a1','a2');
title('Dynamic U Coefficient evolution of AR identification');
xlabel('Time/Sample Number');
ylabel('Amplitude');

subplot(2,1,2);
plot(e.^2);
title('Dynamic U Error squared of AR identification');
xlabel('Time/Sample Number');
ylabel('Amplitude');
grid on;