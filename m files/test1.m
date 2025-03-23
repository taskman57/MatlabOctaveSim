clc;
clear all;
XTAL = 100;
R = 2;
K = 1;
NBIT = 64;
% for NBIT = 8:64
%     for CH= 0:14999
    CH = input(' Please Give the Channel Frequency:\r\n');
        RF = (CH*0.1)+13000;
        FREQ = (RF +3500)/(12*K);
        N_INT = floor((R*FREQ)/XTAL);
        F_FREQ = FREQ - (XTAL*N_INT/R);
        N_FREQ = floor(F_FREQ*R*((2^24))/XTAL);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
        frac = floor(0.1*2^NBIT)/2^NBIT;
        RFapp = (CH*frac)+13000;
        frac = (floor((1/(12*K))*2^NBIT)/2^NBIT);
        FREQapp = (RFapp +3500)*frac;
        frac = floor((1/XTAL)*2^NBIT)/2^NBIT;
        N_INTapp = floor((R*FREQapp)*frac);
        F_FREQapp = FREQapp - ((XTAL*N_INTapp)*floor(0.5*2^NBIT)/2^NBIT );
        N_FREQapp = floor(F_FREQapp*R*((2^24))*frac);
        Diffr1 = abs(N_INT - N_INTapp);
        Diffr2 = abs(N_FREQ - N_FREQapp);
        if Diffr1 > 0 || Diffr2 > 0
            break;
        end
%     end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     for CH= 15000:30000
%     CH = input(' Please Give the Channel Frequency:\r\n');
%         RF = (CH*0.1)+13000;
%         FREQ = (RF -3500)/(8*K);
%         N_INT = floor((R*FREQ)/XTAL);
%         F_FREQ = FREQ - (XTAL*N_INT/R);
%         N_FREQ = floor(F_FREQ*R*((2^24))/XTAL);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
%         frac = floor(0.1*2^NBIT)/2^NBIT;
%         RFapp = (CH*frac)+13000;
%         frac = (floor((1/(8*K))*2^NBIT)/2^NBIT);
%         FREQapp = (RFapp -3500)*frac;
%         frac = floor((1/XTAL)*2^NBIT)/2^NBIT;
%         N_INTapp = floor((R*FREQapp)*frac);
%         F_FREQapp = FREQapp - ((XTAL*N_INTapp)*floor(0.5*2^NBIT)/2^NBIT );
%         N_FREQapp = floor(F_FREQapp*R*((2^24))*frac);
%         Diffr3 = abs(N_INT - N_INTapp);
%         Diffr4 = abs(N_FREQ - N_FREQapp);
%         if Diffr3 > 0 || Diffr4 > 0
%             break;
%         end
%     end
%     if CH == 30000
%         NBIT
%         break;
%     end
% end
