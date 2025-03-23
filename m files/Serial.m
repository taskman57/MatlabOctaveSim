CRC=0;
A=[hex2dec('53'),hex2dec('54'),int8(66),int8(5),int8(0),int8(0),int8(0),int8(0),int8(0)];
s = serial('COM9','BaudRate',115200);
fopen(s);
while 1
    FreqNum = input('\n  Give the Number of DDS FREQ or 2000 for exit');
    if FreqNum ~=2000
        A(5)=int8(rem(FreqNum,256));
        A(6)=int8(FreqNum/256);
        CRC=CrcCheck(A);
        fwrite(s,A);
        fwrite(s,CRC);
        B=fread(s,5);
        if B(3)== 32
            fprintf('\n ACK received.\n');
        else
            fprintf('\n NAK received.\n');
        end
    else
        break;
    end
end
fclose(s);
clear all;
