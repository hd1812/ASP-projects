clear all;
close all;
load vinyl.mat;

y_l=pgm(s2h_original(:,1));
y_ln=pgm(s2h(:,1));
y_r=pgm(s2h_original(:,2));
y_rn=pgm(s2h(:,2));

subplot(4,1,1);
plot(y_l);
grid on;
axis([0 10^5 0 10]);
title('Periodogram of original left channel');

subplot(4,1,2);
plot(y_ln);
grid on;
axis([0 10^5 0 10]);
title('Periodogram of corrupted left channel');

subplot(4,1,3);
plot(y_r);
grid on;
axis([0 10^5 0 10]);
title('Periodogram of original right channel');
ylabel('Amplitude');

subplot(4,1,4);
plot(y_rn);
grid on;
axis([0 10^5 0 10]);
title('Periodogram of corrupted right channel');
xlabel('Normalised Frequency')

for i=floor(length(y_ln)/2):-1:1
    if y_ln(i)>5 
        i
    end
end

for j=1:floor(length(y_ln)/2)
    if y_rn(j)>5 
        j
    end
end


%sound(s2h(:,1),FS);