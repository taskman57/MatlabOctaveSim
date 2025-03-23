clc;
close all;
x = [0 :0.01: 1];
y= sin (2.* pi.* x);
stem(y);
figure;
x = downsample (x,3);
y= sin (2.* pi.* x);
stem(y);
