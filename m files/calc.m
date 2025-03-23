clc;
clear all;
XTAL = 100;
R = 2;
K = 1;
format LONG;
format compact;
offset = 27.5;
for NBIT = 8:64
    for CH= 0:14999
        N_INT = floor(CH/6000 + offset);% This is the whole formula
%         N_Frac = floor(CH/6000*2^24 + 461373440 + N_INT*2^24);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
        Konst = round(2^NBIT/6000)/2^NBIT;
%         N_INTa = floor(CH*Konst + offset);
        Konst2 = round(2^NBIT*offset)/2^NBIT;
        N_INTa = floor(CH*Konst + Konst2);
%         Konst = round(2^(NBIT+24)/6000)/2^NBIT;
%         N_Fraca = floor(CH*Konst + 461373440 + N_INT*2^24)
        if abs(N_INT - N_INTa) > 0% || abs(N_Frac - N_Fraca) > 0
            break;
        end
    end
    if CH == 14999
        NBIT
        break;
    end
end

% for NBIT = 8:64
%     for CH= 15000:30000
% %         CH = input(' Please Give the Channel Frequency:\r\n');
%         N_INT = floor(CH/4000 + 23.75);
%         N_Frac = floor(CH/4000*2^24 + 398458880 + N_INT*2^24);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
%         Konst = round(2^NBIT/4000)/2^NBIT;
%         N_INTa = floor(CH*Konst + 23.75);
%         Konst = round(2^(NBIT+24)/4000)/2^NBIT;
%         N_Fraca = floor(CH*Konst + 398458880 + N_INTa*2^24);
%         if abs(N_INT - N_INTa) > 0 || abs(N_Frac - N_Fraca) > 0
%             break;
%         end
%     end
%     if CH == 30000
%         fprintf('\n\r the Second:%d\n', NBIT);
%         break;
%     end
% end


