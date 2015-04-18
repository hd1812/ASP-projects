close all;
clear all;
%create unknown system, unity variance
N=1000;
x=randn(1000,1);
b=[1,2,3,2,1];
a=1;

y=filter(b,a,x);

%Note the following statement is useful only in comparing SNR
%y=y/sqrt(var(y));

%create noise
n=randn(1000,1)*0.1;
%create z, find SNR
z=y+n;
SNR=snr(y,n);
%find p
p_temp=xcorr(z,x);%p=E[xz],instead of E[zx]
p=p_temp(N:end);

r_array=xcorr(x);

%find r
r=zeros(N,N);
for i=1:N
    r(i,:)=r_array(N-i+1:end-i+1);
end
w_opt=r\p;



