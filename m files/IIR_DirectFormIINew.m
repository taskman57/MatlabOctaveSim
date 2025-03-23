function IIR_DirectFormIINew(a,b)
close all;
clc;
if nargin <2%Numerator 
    b=[  6.168434236476e-11,1.233686847295e-10,6.168434236476e-11];%ButterWorth
end
if nargin == 0 %Denumerator
     a=[1,   -1.999977785585,    0.999977785832];%ButterWorth
end
Y=zeros(1,18e5);
mid1=0;
mid2=0;
mid3=0;
t=1:18*1e5;
X=1;

for i=1:18*1e5
    mid1 = X-a(2)*mid2-a(3)*mid3;
    Y(i)= b(1)*mid1+b(2)*mid2+b(3)*mid3;
    mid3=mid2;
    mid2=mid1;
end
plot(t,Y);
figure;
[h,t]=stepz(b,a);
plot(t,h, 'r');
ylabel('Original Filter Step Response');
