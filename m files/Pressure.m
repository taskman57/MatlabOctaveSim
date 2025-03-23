clc;
clear all;
format compact;
format LONG;
% x comes from an ADC it is 16-bit, as pressure(x)
% varies from 0 to 10, we must assign 4 bits of integer
% and 12-bits of fractional!... ceil(Log10/Log2)= ceil(3.32)=4
% Here 16-4=12-bit of fractional part.
fid1 = fopen('\\Vboxsvr\matlab\Rounded1.dat', 'w');
fid2 = fopen('\\Vboxsvr\matlab\Rounded2.dat', 'w');
fid3 = fopen('\\Vboxsvr\matlab\Rounded3.dat', 'w');
x=0:0.1:10;
for NBIT = 8:64
    DeltaError=0;
    i = 1;
    C_coeff = fix(-0.0088*2^NBIT);%% it doesn't have any integer (0,NBIT)
    B_coeff = fix(1.76773*2^(NBIT-1));%% it has integer width of 1 bit (1, NBIT-1)
    A_coeff = fix(131.29*2^(NBIT-8));%% This has integer width of 8 bit (8, NBIT-8)
    while 1        
        AMP_Flaot = (-0.0088*x(i)^2) + 1.76773*x(i) + 131.29;
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
        x_frac = fix(x(i)*2^(NBIT-4));%% Inp has integer width of 4 (4, NBIT-4)
        FirstTerm = floor(C_coeff*x_frac^2/2^(2*NBIT));%% for Negative numbers floor works better
        SecondTerm = fix(floor(B_coeff*x_frac/2^NBIT)/8);
        AMP_INT = FirstTerm + SecondTerm + A_coeff;
        AMPF = AMP_INT/2^(NBIT-8);
        DeltaError = abs(AMP_Flaot - AMPF);
        if DeltaError >= 0.001
            DeltaError=-1;
            break;
        end
        if i < 101
            i = i + 1;
        else
            break;
        end
    end
    if DeltaError==-1
        DeltaError
    elseif i== 101
        NBIT
        C_coeff
        B_coeff
        A_coeff
        DeltaError
        for j=1:101
            x_frac = floor(x(j)*2^(NBIT-4));%% Inp has integer width of 4 (4, NBIT-4)
            FirstTerm = floor(C_coeff*x_frac^2/2^(2*NBIT));
            SecondTerm = floor(floor(B_coeff*x_frac/2^NBIT)/8);
            fprintf(fid1,'%d\n',FirstTerm);
            fprintf(fid2,'%d\n',SecondTerm);
            fprintf(fid3,'%d\n',x_frac);
        end
        break;
    end
end
fclose(fid1);
fclose(fid2);
fclose(fid3);
