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

y=zeros(Fs*5.5,1);
%            temp=ceil(line_num(3,1)/3);
%           f1=f1_array(1,temp);
mod(3,2)       
for i=1:21
    if mod(i,2)==1
        num=line_num((i+1)/2,1);
        for j=1:0.25*Fs
            temp1=floor(num/3);
            f1=f1_array(1,temp1+1);
            temp2=mod(num,3);
            if temp2==0
                temp2=3;
            end
            f2=f2_array(1,temp2); 
            if num==0
                f1=941;
                f2=1336;
            end
            y((i-1)/4*Fs+j,1)=sin(2*pi*f1*j/Fs)+sin(2*pi*f2*j/Fs);
        end
    else
        for j=1:0.25*Fs
            y((i-1)/4*Fs+j,1)=0;
        end
    end
end

x=(0:5.5/180224:5.5-5.5/180224);
plot(x,y);
figure;
%3.3.2
spectrogram(y,0.25*Fs,0);
colorbar;
axis([0 0.1 0 inf]);
title('Spectrogram of generated London phone number');