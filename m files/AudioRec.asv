clear all;
close all;
clc;
Fs = 8000;% frequency sampling of Audio Device
Record_Time_IN_Seconds = 10;
N = 8;
% y = wavrecord(8*Fs,Fs,'int16');
% stem(y);
% wavplay(y,Fs);

s2 = serial('COM7','BaudRate',921600,'DataBits',8);
s2.InputBufferSize = Fs*Record_Time_IN_Seconds;
fopen(s2);      % mandantory before communicating with serial object

Samples = fread(s2,Fs*Record_Time_IN_Seconds,'uint8');
% plot(out1);
fclose(s2);
delete(s2);
clear s2;
NUM=[1 -1];
DENUM=[5 -1];
res=filter(NUM,DENUM,Samples);
wavplay(res,Fs);


% max_coef=max(abs(Num)); %Num is exported from FDATOOL (in file menu)
% for j=1:length(Num)
%     norm_coef(j) =Num(j)/max_coef;
% end     
% fix_coef = round (norm_coef * 2^(N-1)-1) ;
% fixed_factor=round(Num.*2^(N));
% fixed_factor=fixed_factor./(2^(N));
% fvtool(Num,1,fixed_factor,1);
% filteredSamples = filter (fix_coef,1,scaled);

