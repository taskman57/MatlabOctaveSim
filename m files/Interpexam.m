close all;
t = 0:0.001:1;     % Time vector
x = sin(2*pi*30*t) + sin(2*pi*60*t);
y = interp(x,72);
stem(x(1:111)); 
title('Original Signal');
figure
stem(y(1:7992)); 
title('Interpolated Signal');
y = decimate(y,37);
figure
stem(y(1:216))                        % Decimated signal
title('Decimated Signal to Original');