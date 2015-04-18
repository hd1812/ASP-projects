close all;
clear all;
b=1;
N=1000;
order=2;
u=0.01;

[speech,fs]=audioread('test.wav');
l_speech=length(speech);
l_letter=floor(l_speech/5);

piece_e=speech(1:l_letter)';
letter_e=find_speech(piece_e);
letter_e_1000=letter_e(floor(length(letter_e)*0.7):floor(length(letter_e)*0.7)+999);
x=letter_e_1000;
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

