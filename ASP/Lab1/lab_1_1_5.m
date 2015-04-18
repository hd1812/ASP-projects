close();

N=100000;             %number of samples
numofbins=100;     %number of bins

X=randn(N,10);      %create a matrix of 1000*1
Avgs=mean(X);       %sample mean
std_devs=std(X);    %sample standard deviation

stem(randn(N,1));
figure
stem(Avgs); hold on    %Theoritical mean is 0.5, plot bias of sample mean
title('sample mean bias')

figure
stem(1-std_devs);   %Theoritical std deviation is 1
title('standard deviation bias')

Norm=randn(N,1);
[hfreq,centre]=hist(Norm,numofbins);
g=1/sqrt(2*pi)*exp(-0.5*centre.^2); 

figure
bar(centre,hfreq/trapz(centre,hfreq));hold on
plot(centre,g,'r');hold off
title('N=10000')
%the estimate converge as sample number increases.
%number of bins defines the interval size, only points insided the interval
%is counted for corresponding bar. If histogram is not normalised on number
%of bins, average height has inverse correlation with bin number.