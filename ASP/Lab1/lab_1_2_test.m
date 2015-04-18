clear;
M=4;
N=1000;
y1=rp1(M,N);
y2=rp2(M,N);
y3=rp3(M,N);
en_m1=mean(y1);
en_m2=mean(y2);
en_m3=mean(y3);
en_std1=std(y1);
en_std2=std(y2);
en_std3=std(y3);

t_m1=mean(y1,2);
t_m2=mean(y2,2);
t_m3=mean(y3,2);
t_std1=std(transpose(y1));
t_std2=std(transpose(y2));
t_std3=std(transpose(y3));

v=randn(1,N);
i=(1:1:1000);
k=(1:1:1000);
y_th1=(0.02:0.02:20);
y_th2=0.5;
y_th3=0.5;

y1=sqrt(25/12)*sin(i/1000*pi);
y2=0.333;
y3=0.886;

subplot(3,1,1);plot(en_m1);hold on;
plot(i,y_th1,'red');hold off;
title('Ensemble mean of process 1')
subplot(3,1,2);plot(en_m2);hold on;
plot(k,y_th2,'red');hold off;
title('Ensemble mean of process 2')
subplot(3,1,3);plot(en_m3);hold on;
plot(k,y_th3,'red');hold off;
title('Ensemble mean of process 3')

figure
subplot(3,1,1);plot(en_std1);hold on;
plot(i,y1,'red');hold off;
title('Ensemble standard deviation of process 1')
subplot(3,1,2);plot(en_std2);hold on;
plot(i,y2,'red');hold off;
title('Ensemble standard deviation of process 2')
subplot(3,1,3);plot(en_std3);hold on;
plot(i,y3,'red');hold off;
title('Ensemble standard deviation of process 3')

