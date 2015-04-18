clear;

N=1000;
x=rand(N,1);    %create a matrix of 1000*1
A=mean(x);      %Sample mean
stem(x);        %plot graph
S=std(x);
A
S
%The accuracy of sample mean as an estimator depends on the number of
%samples taken. Increasing sample number produces more probability to
%reduce error. For a uniform distribution in [0,1], Theoretical mean is
%0.5 and theoretical standard variance is 0.289.