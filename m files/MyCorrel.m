
function [outputArg1,outputArg2] = MyCorrel(RefArr,RecArr)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% clear all;
close all;
clc;
format long;
RecLen = length(RecArr);
RefLen = length(RefArr);
outputArg2 = RecLen + RefLen-1;
% RefArr = RefArr - pow2(15);
% RecArr = RecArr - pow2(15);
temp = (zeros(1,RecLen));
outputArg1 = (zeros(1, outputArg2));
for i=1:outputArg2
    for t=1:RecLen-1
        temp(RecLen-t+1) = temp(RecLen-t);
    end
    if i < RecLen+1
        temp(1) = RefArr(i);
    else
        temp(1) = 0;
    end
    MulAcc = 0;
    for z=1:RecLen
        mid = temp(z)* double(RecArr(RecLen-z+1));
        MulAcc = MulAcc + mid;        
    end
    outputArg1(i)= MulAcc;
end
outputArg2 = -(RecLen-1):(RecLen-1);

fid = fopen('MyCorrel.dat','w');
fprintf(fid,'%d,\n',outputArg1);
fclose(fid);
stem(outputArg2, outputArg1);