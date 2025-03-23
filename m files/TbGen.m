function ret = TbGen(Adcres, noise, Fs, Fts, cycle)
% This code deals with generating Real & Imag part of input for VHDL
% testbenches. It creates two separate files contataining Real & Imag
% part of input signals with specified Bit-Resolution and whether we
% need noise to be added to the signal or not.
% close all;
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
th=[0:1/Fs:(cycle/(Fts*10)-1/Fs)];%% Also generating 10XFreq

sReal = (pow2(Adcres-1)-1)*cos(2*pi*Fts*t);
sImag = (pow2(Adcres-1)-1)*sin(2*pi*Fts*t);
max(sReal)
max(sImag)
sRealh = (pow2(Adcres-1)-1)*cos(2*pi*6e6*t);
% sImagh = (pow2(Adcres-1)-1)*sin(2*pi*6e6*t);

if noise ==1
    sReal = (0.5*sReal + pow2(Adcres-2)*2/3*rand(size(t)));
%     sImag = (0.5*sImag + pow2(Adcres-2)*2/3*rand(size(t)));
else
    sReal = sReal *0.6999 + sRealh *0.2999;
%     sImag = sImag *0.6999 + sImagh *0.2999;
end

% sReal = int32(sReal + pow2(Adcres-1));
% sImag = int32(sImag + pow2(Adcres-1));

max(sReal)
max(sImag)

% plot(sReal);
% hold on;
% plot(sImag);

% comp = double(sReal)+1i*double(sImag);
% compFFT = fft(comp(1:8192),8192);
% plot(abs(compFFT(1:end)));
% title('FFT Before Filter');

%%% For 100Meg Sampling (1,5)=>(1,60dB)
b=[       -4,     19,     25,     39,     59,     85,    118,    158,    205,...
      261,    324,    395,    473,    558,    647,    741,    837,    933,...
     1028,   1119,   1204,   1282,   1350,   1407,   1451,   1481,   1496,...
     1496,   1481,   1451,   1407,   1350,   1282,   1204,   1119,   1028,...
      933,    837,    741,    647,    558,    473,    395,    324,    261,...
      205,    158,    118,     85,     59,     39,     25,     19,     -4];
a=1;
sReal = sum(a)/sum(b) * filter(b,a,sReal);
sImag = sum(a)/sum(b) * filter(b,a,sImag);


% sReal = filter(b,a,sReal);
% sImag = filter(b,a,sImag);
% max(abs(sReal))
% max(abs(sImag))
% sReal = sReal/max(abs(sReal));
% sImag = sImag/max(abs(sImag));

% figure;
% plot(sReal);
% hold on;
% plot(sImag);

comp = double(sReal)+1i*double(sImag);
compFFT = fft(comp(1:32768),32768);
figure;

plot(abs(compFFT(1:end)));
title('FFT After Filtering');

fid1 = fopen('RealDat.dat','w');
fid2 = fopen('ImagDat.dat','w');
if Adcres == 8
    fprintf(fid1,'%02X\n',sReal);
    fprintf(fid2,'%02X\n',sImag);
elseif Adcres == 12
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
