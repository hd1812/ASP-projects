close all;
clear all;
b=1;
a=[1,0.9,0.2];
N=10000;
order=2;
u=0.001;

n=randn(N,1);
x=filter(b,a,n);


%perform AR recognition/estimation


[y_w,e,w]=lms_AR_id(x,u,order);
plot(w(:,1),'b');hold on;
plot(w(:,2),'b');hold on;
legend('a1','a2');


[y_w,e,w]=lms_signed_error_AR(x,u,order);
plot(w(:,1),'r');hold on;
plot(w(:,2),'r');hold on;


[y_w,e,w]=lms_signed_regressor_AR(x,u,order);
plot(w(:,1),'m');hold on;
plot(w(:,2),'m');hold on;


[y_w,e,w]=lms_sign_sign_AR(x,u,order);
plot(w(:,1),'g');hold on;
plot(w(:,2),'g');hold on;
grid on;
legend('Basic','Signed-Error','Signed-regressor','Signed-signed');
title('Coefficient evolution of AR identification of different algorithms');
xlabel('Time/Sample Number');
ylabel('Amplitude');

