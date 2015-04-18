clear all;
close all;
load vinyl.mat;

y_l=s2h_original(:,1);
y_ln=s2h(:,1);
y_r=s2h_original(:,2);
y_rn=s2h(:,2);
music=zeros(length(s2h),2);

y_l_pgm=pgm(y_l);
y_ln_pgm=pgm(y_ln);
y_r_pgm=pgm(y_r);
y_rn_pgm=pgm(y_rn);

%filter design
range1=2000;
range2=1500;
noise_peak1=45751;
noise_peak2=6101;
[b1,a1] = cheby1(5,0.05,[(noise_peak1-range1)/(1345050/2) (noise_peak1+range1)/(1345050/2)],'stop');
freqz(b1,a1);
title('Filter 1');

[b2,a2] = cheby1(3,1,[(noise_peak2-range2)/(1345050/2) (noise_peak2+range2)/(1345050/2)],'stop');
figure;
freqz(b2,a2);
title('Filter 2');

%filter noise
music(:,1)=filter(b1,a1,y_ln);
y_temp_l=pgm(music(:,1));

y_f1=filter(b1,a1,y_rn);
music(:,2)=filter(b2,a2,y_f1);
y_temp_r=pgm(music(:,2));

figure;
subplot(2,1,1);
plot(y_l_pgm,'b');hold on;
plot(y_ln_pgm,'r');
plot(y_temp_l,'g');hold off;
axis([0 10^5 0 10]);
grid on;
title('Performance of filter on Channel 1');
legend('Original','Corrupted','Filtered');
xlabel('Normalised Frequency');
ylabel('Amplitude');

subplot(2,1,2);
plot(y_r_pgm,'b');hold on;
plot(y_rn_pgm,'r');
plot(y_temp_r,'g');hold off;
grid on;
axis([0 10^5 0 10]);
title('Performance of filter on Channel 2');
legend('Original','Corrupted','Filtered');
xlabel('Normalised Frequency');
ylabel('Amplitude');

P1=norm(y_l_pgm-y_temp_l)/norm(y_l_pgm);
P2=norm(y_r_pgm-y_temp_r)/norm(y_r_pgm);

%sound(y_ln,FS)
%sound(music,FS)