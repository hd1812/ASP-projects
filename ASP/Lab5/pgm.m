function y=pgm(x)
m=abs(fft(x));
l=length(x);
y=1/l*(m.*m);