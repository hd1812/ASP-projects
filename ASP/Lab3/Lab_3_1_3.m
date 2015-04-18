close all;
clear all;
WGN1024=randn(1,1024);
w=zeros(8,128);
for i=1:8
    w(i,:)=WGN1024(i*128-127:i*128);
end
psds=zeros(8,128);
for i=1:8
    subplot(8,1,i);
    psds(i,:)=pgm(w(i,:));
    stem(psds(i,:));hold on;
    if i==1
        title('PSD of eight segments of 1024-sample WGN');
    end
    if i==4
        ylabel('PSD estiamtion');
    end 
    grid on;
end
xlabel('Normalised Frequency');

figure;
subplot(3,1,1);
stem(psds(1,:));
title('PSD of eight segments of 1024-sample WGN');
xlabel('Normalised Frequency');
ylabel('PSD estiamtion');
grid on;


y=zeros(1,128);
for i=1:128
y(:,i)=mean(psds(:,i));
end
figure;
subplot(3,1,1);
stem(y);
title('Averaged Periodogram of 1024-sample WGN');
xlabel('Normalised Frequency');
ylabel('Averaged estiamtion');
grid on;
