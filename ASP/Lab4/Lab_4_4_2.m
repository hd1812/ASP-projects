close all;
clear all;
b=1;
a=[1,0.9,0.2];
N=1000;
order=2;
u=0.01;

n=randn(N,1);
x=filter(b,a,n);


%perform AR recognition/estimation


u=0.01;
[y_w,e,w]=lms_AR_id(x,u,order);

subplot(3,1,1);
plot(w(:,1));hold on;
plot(w(:,2),'r');hold on;

grid on;
legend('a1','a2');
title('Dynamic U Coefficient evolution of AR identification, u=0.01');
xlabel('Time/Sample Number');
ylabel('Amplitude');

u=0.1;
[y_w,e,w]=lms_AR_id(x,u,order);

subplot(3,1,2);
plot(w(:,1));hold on;
plot(w(:,2),'r');hold on;

grid on;
legend('a1','a2');
title('Dynamic U Coefficient evolution of AR identification, u=0.1');
xlabel('Time/Sample Number');
ylabel('Amplitude');

u=0.001;
[y_w,e,w]=lms_AR_id(x,u,order);

subplot(3,1,3);
plot(w(:,1));hold on;
plot(w(:,2),'r');hold on;

grid on;
legend('a1','a2');
title('Dynamic U Coefficient evolution of AR identification, u=0.001');
xlabel('Time/Sample Number');
ylabel('Amplitude');

