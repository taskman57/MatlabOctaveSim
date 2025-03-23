clear all;
clc;
format compact;
format long;
NBIT=8;
for NBIT = 1:25
    for Freq= 0:167
		Pure= (9500-3*Freq)*2^26/525;
        N_INT = round(Pure);
        Konst = fix(2^(NBIT+26)*3/525);
        N_INTa = round((fix(9500*2^(26+NBIT)/525)-(Freq*Konst))/2^NBIT);
         if abs(N_INT - N_INTa) > 0
            break;
        end
    end
    if Freq == 167
        fprintf('The first Boundry:%d\n', NBIT);
        break;
    end
end
NBIT
