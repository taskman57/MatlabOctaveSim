close all;
clear all;
format compact;
format long;
clc;

Array = readtable('Rep.csv');
MyCell = table2cell(Array(:,3));	%%% Signal number in the Chipscope screen
b = char(MyCell);
%%%%%%%%%%%%%%		Seperate various Signals	%%%%%%%%%%
sDdsSine = hex2dec(b(:,[end-3:end]));		%%%%%%%%%%  16 bits DDS signal Sine
sDdsCosine = hex2dec(b(:,[1:end-4]));		%%%%%%%%%%  16 bits DDS signal Cosine
fprintf('  Maximum Number of Bits:%d\n', log2(max(sDdsCosine))+1);	%%% calculating Max Bit Width

sDdsCosineFFT = fft(sDdsCosine);
Len = int32(length(sDdsCosine));
sDdsCosineFFT = sDdsCosineFFT(1:Len/2);
figure;
plot(abs(sDdsCosineFFT));

% sPrdImagFFT = fft(sPrdImag);
% Len = int32(length(sPrdImag));
% sPrdImagFFT = sPrdImagFFT(1:Len/2);
% figure;
% plot(abs(sPrdImagFFT));