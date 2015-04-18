clear all;
close all;
N=100;
a(:,1)=(rand(N,1)-0.5)*5;
a(:,2)=(rand(N,1)-0.5)*3;
w=randn(1000,1);
x=zeros(1002,N);

for set=1:N
    for i=3:1002
        x(i,set)=a(set,1)*x(i-1,set)+a(set,2)*x(i-2,set)+w(i-2,1);
    end;
    if x(1000,set)<100 && x(1000,set)>-100
        plot(a(set,1),a(set,2),'b*'), hold on;
    else
        plot(a(set,1),a(set,2),'r-'), hold on;
    end;
end;
grid on;
xlabel('a1');
ylabel('a2');
title('Stability Triangle');
%for i=3:1000
%    x(i,1)=a(1,1)*x(i-1,1)+a(1,2)*x(i-2,1)+w(i-2,1);
%end;

%plot(x(:,1))%require a1<0 a2>0
%figure;
%H=tf([1,0 0],[1,a(1,1),a(1,2)]);
%pzmap(H)