function [Ref, Rec] = correlTb(Adcres, noise, Fs, Fts, cycle)
% This code deals with generating Reference & Received signal of a 
% telecommunication channel, that we want to calculate the X-correlation
% of these two signals. You have the ability to add noise to the Received
% signal as well. It creates two separate files as input signals
% for VHDL testbench.
% Adcres: Bit-Resolution
% noise :1 enable, 0 disable
% Fs: sampling frequency of the signal
% Fts: frequency of the signal
% cycle: number of periods of signal
clc;
close all;
format compact;
format long;
clc;
if nargin < 5
    error('  You must give all the inputs ');
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
t=0:1/Fs:(cycle/Fts-1/Fs);
Ref = (pow2(Adcres-1)-1)*cos(2*pi*Fts*t);
Rec = (pow2(Adcres-1)-1)*cos(2*pi*Fts*t);
Rec = circshift(Rec, 5);
if noise ==1
    Rec = (0.8*Rec + pow2(Adcres-2)*2/7*rand(size(t)));
end
Ref1 = int32(Ref + pow2(Adcres-1));
Rec1 = int32(Rec + pow2(Adcres-1));
Ref = int16(Ref);
Rec = int16(Rec);
Ref(1)
Rec(100)
plot(Ref);
% Ref1= Ref;
% Rec1 = Rec;
hold on;
plot(Rec);

fid1 = fopen('RefDat.dat','w');
fid2 = fopen('RecDat.dat','w');
if Adcres == 8
    fprintf(fid1,'%02X\n',Ref);
    fprintf(fid2,'%02X\n',Rec1);
elseif Adcres == 12
    fprintf(fid1,'%03X\n',Ref1);
    fprintf(fid2,'%03X\n',Rec1);
elseif Adcres == 16
    fprintf(fid1,'%04X\n',Ref1);
    fprintf(fid2,'%04X\n',Rec1);
%     fprintf(fid1,'%d,\n',Ref1);
%     fprintf(fid2,'%d,\n',Rec1);
elseif Adcres == 20
    fprintf(fid1,'%05X\n',Ref1);
    fprintf(fid2,'%05X\n',Rec1);
elseif Adcres == 24
    fprintf(fid1,'%06X\n',Ref1);
    fprintf(fid2,'%06X\n',Rec1);
elseif Adcres == 28
    fprintf(fid1,'%07X\n',Ref1);
    fprintf(fid2,'%07X\n',Rec1);
elseif Adcres == 32
    fprintf(fid1,'%08X\n',Ref1);
    fprintf(fid2,'%08X\n',Rec1);
else
    fclose(fid1);
    fclose(fid2);
    error(' Give Multiples of 4 as ADC Res');
end
fclose(fid1);
fclose(fid2);
end
