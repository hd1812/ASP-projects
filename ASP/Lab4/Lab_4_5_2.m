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

%e
data=letter_e_1000;
m=mean(data);
data=data-m;
R=zeros(10,1);
for i=1:19
u=0.1;
[y_w,e,weights]=lms_AR_id(data,u,i);
coefs=[1 weights(end,:)];
y=filter(coefs,1,data)-data;
e=y-data;
R(i)=10*log10(var(data)/var(e));
end
subplot(2,1,1);
plot(R); hold on;
grid on;
title('Prediction gain for various order number for e, a, s, t, x ');
xlabel('Order number');
ylabel('Amplitude');

%repeat for a
data=letter_a_1000;
m=mean(data);
data=data-m;

R=zeros(10,1);
for i=1:19
u=0.1;
[y_w,e,weights]=lms_AR_id(data,u,i);
coefs=[1 weights(end,:)];
y=filter(coefs,1,data)-data;
e=y-data;
R(i)=10*log10(var(data)/var(e));
end
subplot(2,1,1);
plot(R,'r'); hold on;

%repeat for s
data=letter_s_1000;
m=mean(data);
data=data-m;

R=zeros(10,1);
for i=1:19
u=0.1;
[y_w,e,weights]=lms_AR_id(data,u,i);
coefs=[1 weights(end,:)];
y=filter(coefs,1,data)-data;
e=y-data;
R(i)=10*log10(var(data)/var(e));
end
subplot(2,1,1);
plot(R,'m'); hold on;

%t
data=letter_t_1000;
m=mean(data);
data=data-m;
R=zeros(10,1);
for i=1:19
u=0.1;
[y_w,e,weights]=lms_AR_id(data,u,i);
coefs=[1 weights(end,:)];
y=filter(coefs,1,data)-data;
e=y-data;
R(i)=10*log10(var(data)/var(e));
end
subplot(2,1,1);
plot(R,'g'); hold on;

%x
data=letter_x_1000;
m=mean(data);
data=data-m;
R=zeros(10,1);
for i=1:19
u=0.1;
[y_w,e,weights]=lms_AR_id(data,u,i);
coefs=[1 weights(end,:)];
y=filter(coefs,1,data)-data;
e=y-data;
R(i)=10*log10(var(data)/var(e));
end
subplot(2,1,1);
plot(R,'k'); hold on;
legend('e','a','s','t','x');
