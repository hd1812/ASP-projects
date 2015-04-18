clear all;
close all;
ll_num=rand(11,1);
line_num=floor(ll_num*10);
Fs=32768;
f1_array=[697,770,852,941];
f2_array=[1209,1336,1477];

%fix first three digits
line_num(1,1)=0;
line_num(2,1)=2;
line_num(3,1)=0;

y=zeros(Fs*5.25,1);
%            temp=ceil(line_num(3,1)/3);
%           f1=f1_array(1,temp);
mod(3,2)       
for i=1:21
    if mod(i,2)==1
        for j=1:0.25*Fs
            temp1=floor(line_num((i+1)/2,1)/3);
            f1=f1_array(1,temp1+1);
            temp2=mod(line_num((i+1)/2,1),3);
            f2=f2_array(1,temp2+1);
            y((i-1)/4*Fs+j,1)=sin(2*pi*f1*j/Fs)+sin(2*pi*f2*j/Fs);
        end
    else
        for j=1:0.25*Fs
            y((i-1)/4*Fs+j,1)=0;
        end
    end
end
subplot(3,1,1);
x=(0:5.25/172032:5.25-5.25/172032);
plot(x,y);
axis([0 0.025 -2 2]);
title('Two tone signal for 0');
xlabel('Time/s');
ylabel('Magnitde');

subplot(3,1,2);
plot(x,y);
axis([0.5 0.525 -2 2]);
title('Two tone signal for 2');
xlabel('Time/s');
ylabel('Magnitde');

subplot(3,1,3);
plot(x,y);
axis([0.25 0.275 -2 2]);
title('Two tone signal for idle');
xlabel('Time/s');
ylabel('Magnitde');