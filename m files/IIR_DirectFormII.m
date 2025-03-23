function [mid3,mid2]=IIR_DirectFormII(a,b)
close all;
clc;
if nargin <2%Numerator 
    b=[  6.168434236476e-11,1.233686847295e-10,6.168434236476e-11];%ButterWorth
end
if nargin == 0 %Denumerator
     a=[1,   -1.999977785585,    0.999977785832];%ButterWorth
end
mid=zeros(1,18e5);
Y=zeros(1,18e5);
mid(1)=0;
mid(2)=0;
t=1:18*1e5;
for i=1:18*1e5
    X(i)=1;
end
for i=1:18*1e5
    if i>2
        mid(i) = X(i)-a(2)*mid(i-1)-a(3)*mid(i-2);
        Y(i)= b(1)*mid(i)+b(2)*mid(i-1)+b(3)*mid(i-2);
        mid3=mid(i-1);
        mid(i-2)=mid(i-1);
        mid2=mid(i);
        mid(i-1)=mid(i);
    else
        Y(1)=0;
        Y(2)=0;
    end
end
plot(t,Y);
figure;
[h,t]=stepz(b,a);
plot(t,h, 'r');
ylabel('Original Filter Step Response');

