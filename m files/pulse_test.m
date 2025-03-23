clear all;
close all;
clc;
t=[-0.6:6.9375e-6:0.6];
% rect = rectpuls(t);
rect = sin(13.875e6*pi.*t);
plot(rect);
figure;
plot(abs(fft(rect)));

% t=[-6.9375e-6:1e-8:(1*6.9375e-6)];
% rect = rectpuls(t,(1*6.9375e-6));
% plot(t,rect);
% % rectplus(-0.5)
% % rectplus(0.5)
