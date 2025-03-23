function IIR_DirectFormIINew4VHDLImpl(a,b)
%%%% If you give the b,a factors please give them
%%%% from a DIRECT form-II design
close all;
clc;
if nargin <2%Numerator 
    b=[  6.168434236476e-11,1.233686847295e-10,6.168434236476e-11];%ButterWorth
end
if nargin == 0 %Denumerator
     a=[1,   -1.999977785585,    0.999977785832];%ButterWorth
end
ArrLen = 2e6;
Y=zeros(1,ArrLen);
mid1=0;
mid2=0;
mid3=0;
X=1023;
NB = 0;%%% number of bits for fp to fixed point conversion
%%%%%%%%% In some cases coeffs are two small you have to multiply them to a
%%%%%%%%% large value to make them meaningfull in 20 bits or more fixed
%%%%%%%%% point values!...

    b=b.*1e9;
    a=a.*1e9;

for i=1:ArrLen
    mid1 = X-a(2)*mid2-a(3)*mid3;
    Y(i)= ((b(1)*mid1+b(2)*mid2+b(3)*mid3)/2^NB);
    mid3=fix(mid2/2^NB);
    mid2=fix(mid1/2^NB);
end
plot(Y);
% figure;
% [h,t]=stepz(b,a);
% plot(t,h, 'r');
% ylabel('Original Filter Step Response');
