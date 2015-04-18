clear all;
close all;
load RRI_DH.mat
N=960;
data=detrend(RRI_trial_3);

y=pgm(data);
subplot(4,1,1);
plot(y);
grid on;
title('Original Periodogram');
xlabel('Normalised Frequency');
ylabel('Amplitude');
axis([0 120 0 inf]);

time=30;%time in seconds. Total time of each trial is 4 min
w_length=time/240*N;
segs=zeros(w_length,240/time);
for i=1:240/time
        segs(:,i)=pgm(data(1,((i-1)*w_length+1:i*w_length)));
end
subplot(4,1,2)
y=mean(segs,2);
plot(y);
grid on;
title('Periodogram with window length 30 seconds');
xlabel('Normalised Frequency');
ylabel('Amplitude');
axis([0 15 0 inf]);

time=60;%time in seconds. Total time of each trial is 4 min
w_length=time/240*N;
segs=zeros(w_length,240/time);
for i=1:240/time
        segs(:,i)=pgm(data(1,((i-1)*w_length+1:i*w_length)));
end
subplot(4,1,3)
y=mean(segs,2);
plot(y);
grid on;
title('Periodogram with window length 1 min');
xlabel('Normalised Frequency');
ylabel('Amplitude');
axis([0 30 0 inf]);

time=120;%time in seconds. Total time of each trial is 4 min
w_length=time/240*N;
segs=zeros(w_length,240/time);
for i=1:240/time
        segs(:,i)=pgm(data(1,((i-1)*w_length+1:i*w_length)));
end
subplot(4,1,4)
y=mean(segs,2);
plot(y);
grid on;
title('Periodogram with window length 2 min');
xlabel('Normalised Frequency');
ylabel('Amplitude');
axis([0 60 0 inf]);