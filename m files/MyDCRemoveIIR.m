function Y = MyDCRemoveIIR()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%    b=[0.99843166591671906,-0.99843166591671906,0];
%    a=[1,-0.996863331833438,0];
%			K1=0.99843166591671906, K2=0.996863331833438
%			K1=4089=0xFF9
%			K2=4083=0xFF3
%		Note: Negative of K2 and subtraction on input will make a positive operator or Sum!...
%						x(n)»-- X K1 --»(+)-------mid1----->(+)--» Y
%										(-)			¦	   (-)
%										 ^		  mid2	    ^
%										 ¦			¦	    ¦
%										 +-«---K2---X---»---+
close all;
% clear all;
format long;
format compact;
clc;
% b=[0.99843166591671906,-0.99843166591671906,0];
% a=[1,-0.996863331833438,0];
K1=0.99843166591671906;
K2=0.996863331833438;
NB=12;
K1=fix(K1*2^NB);%4089=0xFF9
K2=fix(K2*2^NB);%4083;%%%=0xFF3
ArrLen = 1e2;
Y=zeros(1,ArrLen);
mid2=0;
t=1:ArrLen;
X=1023;%% full unsigned value of 10-bit ADC
length(t)
LargeAbsmid1=0;
% NegLargemid1=0;
LargeAbsmid2=0;
% NegLargemid2 = 0;
for i=1:ArrLen
mid1 = fix(fix(X*K1) - fix(K2*mid2));
if LargeAbsmid1<abs(mid1)
    LargeAbsmid1 = abs(mid1);
    % if mid1<0
    %     NegLargemid1 = 1;
    % else
    %     NegLargemid1 = 0;
    % end
end
Y(i) = fix(mid1 - mid2)/2^NB;
mid2 = fix(mid1/2^NB);
if LargeAbsmid2 < abs(mid2)
    LargeAbsmid2 = abs(mid2);
    % if mid2<0
    %     NegLargemid2 = 1;
    % else
    %     NegLargemid2 = 0;
    % end
end
    
end
plot(Y);
% LargeAbsmid1;
% NegLargemid1;
fprintf('\n we need %d bits for this variable\n',ceil(log10(LargeAbsmid1)/log10(2)));
% LargeAbsmid2;
fprintf('\n we need %d bits for this variable\n',ceil(log10(LargeAbsmid2)/log10(2)));
% NegLargemid2;

% figure;
% [h,t]=stepz(b,a);
% plot(t,h, 'r');

end

