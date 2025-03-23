clc;
close all;
% clear all;
format compact;
format short;
%%%%%%%%%%%%%%%%        1st example from DSP lesson      %%%%%%%%%%%%%%%%%
% n=0:63;
% x=3*cos(pi/8*n);
% % stem(x);
% % figure;
% a=real(fft(x));
% stem(abs(a));
% title('Real part of FFT');
% figure;
% b=imag(fft(x));
% stem(b);
% title('Imaginary part of FFT');
%%%%%%%%%%%%%%%%        2nd example from DSP lesson      %%%%%%%%%%%%%%%%%
% n=0:63;
% x=[ones(1,5),zeros(1,59)];
% a=real(fft(x));
% stem(abs(a));
% title('Amplitude part of FFT');
% figure;
% b=angle(fft(x));
% stem(b);
% title('Phase part of FFT');
%%%%%%%%%%%%%%%%        3rd example from DSP lesson      %%%%%%%%%%%%%%%%%
% n=[1 2 3 4 3 2 1];
% a=real(fft(n));
% b=imag(fft(n));
% A=sqrt(a.^2+b.^2)/7;
% phi=angle(fft(n));
Fs=200e6;
F=10e3;
t=0:1/Fs:(1/F - 1/Fs);
% fid1 = fopen('e:\embedded\cosine.coe','w');
% fprintf(fid1,'memory_initialization_radix = 16;\nmemory_initialization_vector =\n');
% fid2 = fopen('e:\embedded\sine.coe','w');
% fprintf(fid2,'memory_initialization_radix = 16;\nmemory_initialization_vector =\n');
ycos=cos(2*pi*F*t);
% ysin=sin(2*pi*F*t);

ycosint = fix(ycos*2^15);
ycosint = twoscomp(ycosint);
ymod=cos(2*pi*1e6*t);% Modulation 
ymodint= fix(ymod*2^15);
ymodint= twoscomp(ymodint);
% ysinint = fix(ysin*2^15);
% ysinint = twoscomp(ysinint);
% subplot(2,1,1);
% plot(ycos);
% subplot(2,1,2);
% plot(ycosint);
% figure;
% subplot(2,1,1);
% plot(ysin);
% subplot(2,1,2);
% plot(ysinint);
% figure;
plot(fix((ymodint.*ycosint)./65536));

% k=length(ycosint);
% for i=1:k
%     fprintf(fid1,'%04x,\n',ycosint(i));
%     fprintf(fid2,'%04x,\n',ysinint(i));
% end
% 
% fclose(fid1);
% fclose(fid2);

