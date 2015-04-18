clear all;
close all;
load vinyl.mat;

y_l=pgm(s2h_original(:,1));
y_ln=pgm(s2h(:,1));
y_r=pgm(s2h_original(:,2));
y_rn=pgm(s2h(:,2));



subplot(2,1,1);
plot(y_ln);
grid on;
axis([0 10^5 0 10]);
title('Periodogram of corrupted left channel');
ylabel('Amplitude');

subplot(2,1,2);
plot(y_rn);
grid on;
%axis([0 10^5 0 10]);
title('Periodogram of corrupted right channel');
xlabel('Normalised Frequency');

%sound(s2h(:,1),FS);