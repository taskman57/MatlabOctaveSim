clc;
clear all;
% XTAL = 100;
% R = 2;
% K = 1;
format LONG;
format compact;
for NB = 15:64
	Konst = fix(27.5*2^(NB-5));%% 5 bit for integer section(5, NBIT-5)
	SecondTerm = fix(Konst / 2^9);%% make integer point aligned (5,NBIT-14)
    C_coeff = fix(1/6000*2^NB);%% Not integer (0,NBIT)
   for CH= 0:14999
        N_INT = CH/6000 + 27.5;
        CH_Scl = fix(CH*2^(NB-14));%% 14 bits integer (14,NBIT-14)
        
        FirstTerm = fix(C_coeff * CH_Scl/2^NB);%% (14, 2NBIT-14)/2^NB=> (14,NB-14)
        N_Frac = FirstTerm + SecondTerm;
        ConvN_Frac = N_Frac/2^(NB-14);
        if abs(N_INT - ConvN_Frac) >0.0001 && CH>0
            fprintf('Big Error for NB:%d\n',NB);
            break;
        end
    end
%     if CH == 14999
%         fprintf('The first:%d\n', NB);
%         break;
%     end
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


