clear;
N=100000;
numofbins=10;

X=rand(N,1);                            %create a matrix of 1000*1
avg=mean(X);                            %sample mean
std_dev=std(X);                               %sample std deviation

stem(0.5-avg);         %Theoritical mean is 0.5, plot bias of sample mean
figure
stem(sqrt(1/12)-std_dev);              %plot bias of sample deviation

i=(0:0.01:1);  
[hfreq,centre]=hist(X,numofbins);       %[counts,centers] = hist(___)

%y is assigned to pdf of uniform distribution
y=unifpdf(i,0,1);  

%total area is sum(hfreq)*(1/numofbins). After normalisation, total area
%under pdf is 1.
bar(centre,hfreq/sum(hfreq)*numofbins);hold on 
plot(i,y,'r');hold off
title('N=100000')

%the estimate converge as sample number increases.
%number of bins defines the interval size, only points insided the interval
%is counted for corresponding bar. If histogram is not normalised by number
%of bins, average height has inverse correlation with bin number.

%normalised by number of bins will be:
%bar(centre,hfreq/sum(hfreq));hold on

