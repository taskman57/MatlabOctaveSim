clear all;
close all;
clc;
Fs = 220;% frequency sampling of Audio Device
s2 = serial('COM7','BaudRate',921600,'DataBits',8);
fopen(s2);      % mandantory before communicating with serial object
for i=1:2*Fs
    USamples(i) = fread(s2,1,'uint8');
end
fclose(s2);
delete(s2);
clear s2;
% for i=1:2*Fs
%     if i<2*Fs
%         if USamples(i)~= (USamples(i+1)-1)
%             USamples(i)
%             USamples(i+1)
%         end
%     end
% end
