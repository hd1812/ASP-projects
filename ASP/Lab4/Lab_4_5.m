clear all;
close all;

[speech,fs]=audioread('test.wav');
l_speech=length(speech);
l_letter=floor(l_speech/5);

piece_e=speech(1:l_letter)';
piece_a=speech(l_letter+1:2*l_letter)';
piece_s=speech(2*l_letter+1:3*l_letter)';
piece_t=speech(3*l_letter+1:4*l_letter)';
piece_x=speech(4*l_letter+1:5*l_letter)';

letter_e=find_speech(piece_e);
letter_e_1000=letter_e(floor(length(letter_e)*0.7):floor(length(letter_e)*0.7)+999);

letter_a=find_speech(piece_a);
letter_a_1000=letter_a(floor(length(letter_a)/6):floor(length(letter_a)/6)+999);

letter_s=find_speech(piece_s);
letter_s_1000=letter_s(floor(length(letter_s)/12):floor(length(letter_s)/12)+999);

letter_t=find_speech(piece_t);
letter_t_1000=letter_t(floor(length(letter_t)/3):floor(length(letter_t)/3)+999);

letter_x=find_speech(piece_x);
letter_x_1000=letter_x(floor(length(letter_x)/12):floor(length(letter_x)/12)+999);

order=19;

data=letter_a_1000;
m=mean(data);
data=data-m;

u=0.1;

[y_w,e,weights]=lms_AR_dmc_u(data,order);
subplot(2,1,1);
plot(weights(:,1));hold on;
plot(weights(:,2),'r');hold on;

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
