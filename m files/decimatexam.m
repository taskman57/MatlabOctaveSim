clc;
close all;
t = 0:.00025:1;                      % Time vector
x = sin(2*pi*30*t) + sin(2*pi*60*t);
y = decimate(x,4);
stem(x(1:120)), axis([0 120 -2 2])   % Original signal
title('Original Signal');
figure
stem(y(1:30))                        % Decimated signal
title('Decimated Signal');
