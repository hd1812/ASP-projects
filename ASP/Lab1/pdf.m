function pdf(v)
numofbins=10;         %number of bins
[hfreq,centre]=hist(v,numofbins); % create histogram 
bar(centre,hfreq/length(v))
