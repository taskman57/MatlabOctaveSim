clear all;
close all;
clc;
Fs = 8000;% frequency sampling of Audio Device
ReadBlock = 1000;
iFile_ID = fopen('USBSamples.dot','r');
if iFile_ID == -1 
    outptu('Error opening file');
end
fseek(iFile_ID,0,'eof');
File_Length = ftell(iFile_ID);
fseek(iFile_ID,0,'bof');
for i=1:File_Length/ReadBlock
    j=(i-1)*ReadBlock+1;
    k=i*ReadBlock;
    Samples(j:k)=fread(iFile_ID,ReadBlock,'uint8');
end
oFile_ID = fopen('CorrectedUSBSamples.dot','w');
offset = 0;
for i=1:File_Length
    if (i>1)
        if (Samples(i) > 3 && rem((i-offset),2)==0)
            %         if (Samples(i) == 25)   % for test of 0 to 1023
            offset = offset + 1;
            Corrected(i-offset) = Samples(i);
        else
            Corrected(i - offset) = Samples(i);
        end
    else
        Corrected(i) = Samples(i);
    end
end
for i=1:(File_Length - offset)
    fwrite(oFile_ID,Corrected(i));
end

fclose(oFile_ID);
clear oFile_ID;
fclose(iFile_ID);
clear iFile_ID;
clear Samples;

iFile_ID = fopen('CorrectedUSBSamples.dot','r');
fseek(iFile_ID,0,'eof');
File_Length = ftell(iFile_ID);
fseek(iFile_ID,0,'bof');
for i=1:File_Length/2
    Samples(i)=fread(iFile_ID,1,'int16');
end
fclose(iFile_ID);
clear iFile_ID;
% for i=1:File_Length/2
%     if Samples(i) < 457 
%         Samples(i)=457;
%     else if Samples(i) > 617 
%             Samples(i)= 617;
%         end
%     end
% end