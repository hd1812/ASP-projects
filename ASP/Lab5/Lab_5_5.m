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

x=y_ln;
z=y_l;
order=19;
[y_w,e,w]=lms_adp_denoise(x,z,order);

y_f_l=zeros(length(y_l),1);
for i=order+1:length(y_l);
    y_f_l(i)=w(i,:)*y_ln(i-1:-1:i-order);
end

figure;
subplot(3,1,1);
plot(pgm(y_ln));
title('Channel 1 corrupted');
xlabel('Normalised frequency');
ylabel('Amplitude');
axis([0 10^5 0 10]);
subplot(3,1,2);
plot(pgm(y_l));
title('Channel 1 original');
xlabel('Normalised frequency');
ylabel('Amplitude');
axis([0 10^5 0 10]);
subplot(3,1,3);
plot(pgm(y_f_l));
title('Channel 1 filtered');
xlabel('Normalised frequency');
ylabel('Amplitude');
axis([0 10^5 0 10]);


x=y_rn;
z=y_r;
order=19;
[y_w,e,w]=lms_adp_denoise(x,z,order);

y_f_r=zeros(length(y_l),1);
for i=order+1:length(y_l);
    y_f_r(i)=w(i,:)*y_rn(i-1:-1:i-order);
end

figure;
subplot(3,1,1);
plot(pgm(y_rn));
title('Channel 2 corrupted');
xlabel('Normalised frequency');
ylabel('Amplitude');
axis([0 10^5 0 10]);
subplot(3,1,2);
plot(pgm(y_r));
title('Channel 2 original');
xlabel('Normalised frequency');
ylabel('Amplitude');
axis([0 10^5 0 10]);
subplot(3,1,3);
plot(pgm(y_f_r));
title('Channel 2 filtered');
xlabel('Normalised frequency');
ylabel('Amplitude');
axis([0 10^5 0 10]);



music=[y_f_l y_f_r];
sound(music,FS);
