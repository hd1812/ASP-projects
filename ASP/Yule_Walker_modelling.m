clear
a = [2.2137, -2.9403, 2.1697, -0.9606]
randn('state',1);
x = filter(1,a,randn(256,1)); % AR system output
subplot(2,1,1),pyulear(x,4);                 % Fourth-order estimate
subplot(2,1,2),freqz(1,a)              % AR filter frequency response