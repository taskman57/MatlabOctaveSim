clear all;
close all;
clc;
Fs = 22050;% frequency sampling of Audio Device
iFile_ID = fopen('USBSamples.dot','r');
oFile_ID = fopen('CorrectedUSBSamples.dot','w');
if iFile_ID == -1 || oFile_ID == -1 
    outptu('Error opening file for read or write');
end
fseek(iFile_ID,0,'eof');
File_Length = ftell(iFile_ID);
fseek(iFile_ID,0,'bof');
for i=1:File_Length/4
    Samples(i)=fread(iFile_ID,1,'uint8');
    Samples(i+1)=fread(iFile_ID,1,'uint8');
    if Samples(i+1)~= 25  % 0x19 Special char in Hyper Terminal
        fwrite(oFile_ID,Samples(i));
        fwrite(oFile_ID,Samples(i+1));
    else
        fwrite(oFile_ID,Samples(i+1));
        i = i+1;
    end
end
fclose(iFile_ID);
clear iFile_ID;
fclose(oFile_ID);
clear oFile_ID;
Corrupted =0;
% for i=1:File_Length/2
% %     if i < File_Length/2
%         if Samples(i) > 1023
%             Corrupted = Corrupted + 1;
%         end
% %     end
% end
%%%%%%  can't be check because we get two bytes in one sample!... 
%%%%%%%% so we'll ave that discontinuty

for i=1:File_Length/2
    if i<File_Length
        if Samples(i)~= (Samples(i+1)-1)
            if (Samples(i)~= 254) || (Samples(i+1)~= 127)
                Samples(i)
                Samples(i+1)
                Corrupted = Corrupted +1;
            end
        end
    end
end
