close all;
clear all;

%create unknown system, unity variance
N=1000;
u=0.01;
order=19;
x=randn(N,1);
b=[1,2,3,2,1];
a=1;
y=filter(b,a,x);

%create noise
n=randn(N,1)*0.1;

%create z, find SNR
z=y+n;

[y_w,e,w]=lms_algo(x,z,u,order);

subplot(2,1,1);
plot(w(:,1));hold on;
plot(w(:,2),'r');hold on;
plot(w(:,3),'c');hold on;
plot(w(:,4),'k');hold on;
plot(w(:,5),'m');hold on;
grid on;
legend('b1','b2','b3','b4','b5');
title('Coefficient evolution of LMS');
xlabel('Time/Sample Number');
ylabel('Amplitude');

subplot(2,1,2);
plot(e.^2);
title('Error squared of LMS');
xlabel('Time/Sample Number');
ylabel('Amplitude');
grid on;