clear all;
close all;
clc;
Fs = 220;% frequency sampling of Audio Device

File_ID = fopen('capture2.txt','r');
if File_ID == -1
    outptu('Error opening file');
end
fseek(File_ID,0,'eof');
File_Length = ftell(File_ID);
fseek(File_ID,0,'bof');
for i=1:File_Length
    UsbCdc_samples(i)=fread(File_ID,1,'uint8');
end
Discontinuty_Counter=0;
for i=1:100
    if i<100
        if UsbCdc_samples(i)~= (UsbCdc_samples(i+1)-1)
            if UsbCdc_samples(i+1)~=0  % data counts upto 128 then rolls over to 0.
                UsbCdc_samples(i)
                UsbCdc_samples(i+1)
                Discontinuty_Counter = Discontinuty_Counter +1;
            end
        end
    end
end
Discontinuty_Counter