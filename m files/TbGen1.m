function TbGen1(Adcres, noise, Fs, Fts, cycle)
% This code deals with generating Real & Imag part of input for VHDL
% testbenches. It creates two separate files contataining Real & Imag
% part of input signals with specified Bit-Resolution and whether we
% need noise to be added to the signal or not.
% close all;
% clear all;
format compact;
format long;
clc;
if nargin < 5
    error('  You must give the all inputs ');
end

if ischar(Adcres) ||ischar(noise)
    error('  You must give integer numbers ');
elseif nargin == 2
    if noise > 1
        noise =1;
    end
end
if Fs<Fts
    error(' Out of Nyquist frequency range');
end

t=[0:1/Fs:(cycle/Fts-1/Fs)];
sReal = pow2(Adcres-1)*cos(2*pi*Fts*t);
sImag = pow2(Adcres-1)*sin(2*pi*Fts*t);
% if noise ==1
%     sReal = (0.5*sReal + pow2(Adcres-2)*2/3*rand(size(t)));
%     sImag = (0.5*sImag + pow2(Adcres-2)*2/3*rand(size(t)));
% else
    sReal = sReal *0.999;
    sImag = sImag *0.999;
% end

sReal = int32(sReal);
sImag = int32(sImag);
sReal = sReal + pow2(Adcres-1);
sImag = sImag + pow2(Adcres-1);
comp = double(sReal)+1i*double(sImag);
%%%%%%%         For 1024 point FFT         %%%%%%%%
% sFFT1 = fft(comp(1:1024),1024);
% plot(abs(sFFT1));
% hold on;
% sFFT2 = fft(comp(1025:2048),1024);
% plot(abs(sFFT2));
% sFFT3 = fft(comp(2049:3072),1024);
% plot(abs(sFFT3));
% sFFT4 = fft(comp(3073:4096),1024);
% plot(abs(sFFT4));
plot(sReal);
figure;
%%%%%%%         For 8192 point FFT         %%%%%%%%

sFFT1 = fft(comp(1:8192),8192);
plot(abs(sFFT1));
% hold on;
% sFFT2 = fft(comp(8193:16384),8192);
% plot(abs(sFFT2));
% sFFT3 = fft(comp(16385:24576),8192);
% plot(abs(sFFT3));
% sFFT4 = fft(comp(24577:32768),8192);
% plot(abs(sFFT4));


fid1 = fopen('RealDat10Bit.dat','w');
fid2 = fopen('ImagDat10Bit.dat','w');
if Adcres == 8
    fprintf(fid1,'%02X\n',sReal);
    fprintf(fid2,'%02X\n',sImag);
elseif Adcres == 12 || Adcres == 10 
    fprintf(fid1,'%03X\n',sReal);
    fprintf(fid2,'%03X\n',sImag);
elseif Adcres == 16
    fprintf(fid1,'%04X\n',sReal);
    fprintf(fid2,'%04X\n',sImag);
elseif Adcres == 20
    fprintf(fid1,'%05X\n',sReal);
    fprintf(fid2,'%05X\n',sImag);
elseif Adcres == 24
    fprintf(fid1,'%06X\n',sReal);
    fprintf(fid2,'%06X\n',sImag);
elseif Adcres == 28
    fprintf(fid1,'%07X\n',sReal);
    fprintf(fid2,'%07X\n',sImag);
elseif Adcres == 32
    fprintf(fid1,'%08X\n',sReal);
    fprintf(fid2,'%08X\n',sImag);
else
    fclose(fid1);
    fclose(fid2);
    error(' Give Multiples of 4 as ADC Res');
end
fclose(fid1);
fclose(fid2);
end
