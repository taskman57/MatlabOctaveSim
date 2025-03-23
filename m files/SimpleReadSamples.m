clear all;
close all;
clc;
Fs = 8000;% frequency sampling of Audio Device
ReadBlock = 1000;
iFile_ID = fopen('line2.dot','r');
fseek(iFile_ID,0,'eof');
File_Length = ftell(iFile_ID);
fseek(iFile_ID,0,'bof');%2199925
for i=1:File_Length/ReadBlock
    j=(i-1)*ReadBlock+1;
    k=i*ReadBlock;
    Samples(j:k)=fread(iFile_ID,ReadBlock,'uint8');
end
fclose(iFile_ID);
clear iFile_ID;

NUM=[1 -1];
DENUM=[5 -1];
res=filter(NUM,DENUM,Samples);
% res=res/sqrt(15);
% wavplay(res,Fs)
% Samples_Len = size(Samples);
% for i=1:Samples_Len(2)-2
%     NewSamples(i)=(Samples((i-1)*2+1)+Samples(i*2))/2;
% end
% res1=filter(NUM,DENUM,NewSamples);
