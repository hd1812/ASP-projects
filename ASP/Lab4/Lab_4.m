close all;
clear all;
%create unknown system
N=1000;

x=randn(1000,1);
unknown_sys_b=[1,2,3,2,1];
unknown_sys_a=[1];
y=filter(unknown_sys_b,unknown_sys_a,x);

%Note the following statement is useful only in comparing SNR
%y=y/sqrt(var(y));

%create noise
n=randn(1000,1)/10;
%create z
z=y+n;
SNR=snr(y,n);