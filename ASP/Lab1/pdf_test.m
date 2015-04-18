clear;
N1=100;
N2=1000;
N3=10000;
y1=rp2(1,N1);
subplot(3,1,1);pdf(y1)
title('N = 100')
y2=rp2(1,N2);
subplot(3,1,2);pdf(y2)
title('N = 1000')
y3=rp2(1,N3);
subplot(3,1,3);pdf(y3)
title('N = 10000')