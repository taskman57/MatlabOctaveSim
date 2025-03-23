close all;
clear all;
clc;
fid = fopen('OutFile0.dat','r');
RealDat = fscanf(fid,'%4X');
fclose(fid);
fid = fopen('OutFile1.dat','r');
ImagDat = fscanf(fid,'%4X');
fclose(fid);
FftPoint = 32768;
offset = 2;%%% last FFT data is repeated two extra clocks!.
%%%%%%%         For 1024 point FFT         %%%%%%%%
% RealDat1 = signed(RealDat(1:1024));
% RealDat2 = signed(RealDat(1025:2048));
% RealDat3 = signed(RealDat(2049:3072));
% RealDat4 = signed(RealDat(3073:4098));
% 
% ImagDat1 = signed(ImagDat(1:1024));
% ImagDat2 = signed(ImagDat(1025:2048));
% ImagDat3 = signed(ImagDat(2049:3072));
% ImagDat4 = signed(ImagDat(3073:4098));
% comp1 = 2048*(RealDat1 + 1i*ImagDat1);
% comp2 = 2048*(RealDat2 + 1i*ImagDat2);
% comp3 = 2048*(RealDat3 + 1i*ImagDat3);
% comp4 = 2048*(RealDat4 + 1i*ImagDat4);

%%%%%%%         For 8192 point FFT         %%%%%%%%
% RealDat1 = signed(RealDat(1:8192));
% RealDat2 = signed(RealDat((8193+offset):(16384+offset)));
% RealDat3 = signed(RealDat((16385+offset*2):(24576+offset*2)));
% RealDat4 = signed(RealDat((24577+offset*3):(32768+offset*3)));
% RealDat5 = signed(RealDat((32769+offset*4):(40960+offset*4)));
% 
% 
% ImagDat1 = signed(ImagDat(1:8192));
% ImagDat2 = signed(ImagDat((8193+offset):(16384+offset)));
% ImagDat3 = signed(ImagDat((16385+offset*2):(24576+offset*2)));
% ImagDat4 = signed(ImagDat((24577+offset*3):(32768+offset*3)));
% ImagDat5 = signed(ImagDat((32769+offset*4):(40960+offset*4)));

RealDat1 = signed(RealDat(((FftPoint*0+1)+offset*0):((FftPoint*1)+offset*0)));
RealDat2 = signed(RealDat(((FftPoint*1+1)+offset*1):((FftPoint*2)+offset*1)));
RealDat3 = signed(RealDat(((FftPoint*2+1)+offset*2):((FftPoint*3)+offset*2)));
% RealDat4 = signed(RealDat(((FftPoint*3+1)+offset*3):((FftPoint*4)+offset*3)));
% RealDat5 = signed(RealDat(((FftPoint*4+1)+offset*4):((FftPoint*5)+offset*4)));


ImagDat1 = signed(ImagDat(((FftPoint*0+1)+offset*0):((FftPoint*1)+offset*0)));
ImagDat2 = signed(ImagDat(((FftPoint*1+1)+offset*1):((FftPoint*2)+offset*1)));
ImagDat3 = signed(ImagDat(((FftPoint*2+1)+offset*2):((FftPoint*3)+offset*2)));
% ImagDat4 = signed(ImagDat(((FftPoint*3+1)+offset*3):((FftPoint*4)+offset*3)));
% ImagDat5 = signed(ImagDat(((FftPoint*4+1)+offset*4):((FftPoint*5)+offset*4)));

if FftPoint == 8192 
    comp1 = 2^15*(RealDat1 + 1i*ImagDat1);
    comp2 = 2^15*(RealDat2 + 1i*ImagDat2);
    comp3 = 2^15*(RealDat3 + 1i*ImagDat3);
%     comp4 = 2^15*(RealDat4 + 1i*ImagDat4);
%     comp5 = 2^15*(RealDat5 + 1i*ImagDat5);    
    plot(abs(comp1));
    hold on;
    plot(abs(comp2));
    hold on;
    plot(abs(comp3));
    hold on;
%     plot(abs(comp4));
%     hold on;
%     plot(abs(comp5));    
elseif FftPoint == 32768
    comp1 = 2^15*(RealDat1 + 1i*ImagDat1);
    comp2 = 2^15*(RealDat2 + 1i*ImagDat2);
    comp3 = 2^15*(RealDat3 + 1i*ImagDat3);
%     comp4 = 2^15*(RealDat4 + 1i*ImagDat4);
%     comp5 = 2^15*(RealDat5 + 1i*ImagDat5);
    plot(abs(comp1));
    hold on;
    plot(abs(comp2));
    hold on;
    plot(abs(comp3));
%     hold on;
%     plot(abs(comp4));
%     hold on;
%     plot(abs(comp5));
else
    fprintf('\n  NFftPoint size (%d) is not in the list\n',FftPoint);
end