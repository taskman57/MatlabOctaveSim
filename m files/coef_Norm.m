function factor= coef_Norm(coef)
clc;
% close all;
% clear all;
N = 12;
format long;
% coef = [0.1428571229865,0.1428571428571,0.1428571547795,0.1428571587537,0.1428571547795,0.1428571428571,0.1428571229865];%Kaiser
% order 6 cu = 1
% coef = [0.1249999820789,0.1249999974398,0.1250000076805,0.1250000128008,0.1250000128008,0.1250000076805,0.1249999974398,0.1249999820789];
% order 7 cu = 1, 300K
factor=round(coef.*2^(N));
% X = [35, 39, 42, 37, 30, 26, 32];
% Y = filter(fixed_factor,1,X);
% plot(X,Y);
fixed_factor=factor./(2^(N));
fvtool(coef,1,fixed_factor,1);
