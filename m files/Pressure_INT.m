clc;
clear all;
format compact;
format LONG;
resolution = 1000;
% x comes from an ADC it is 16-bit, as pressure(x)
% varies from 0 to 10, we must assign 4 bits of integer
% and 12-bits of fractional!... ceil(Log10/Log2)= ceil(3.32)=4
% Here 16-4=12-bit of fractional part.
x=0:0.1:10;
for i=1:size(x)
    x(i)=round(x(i)*2^16);
end
for NBIT = 8:64
    k=0;
    i = 1;
    while 1
        AMP_Flaot = -0.0088*x(i)^2 + 1.76773*x(i) + 131.29;
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
        AMP_INT = (round(-0.0088*2^NBIT)/2*NBIT * round((x(i)*2^NBIT)^2)/(2^NBIT*2^NBIT)) + (round(1.76773*2^NBIT)/2^NBIT)*(round(x(i)*2^NBIT)/2^NBIT) + round(131.29*2^NBIT)/2^NBIT;
        k = abs(AMP_Flaot - AMP_INT);
        if k > resolution
            k=-1;
            break;
        end
        if i < 101
            i = i + 1;
        else
            break;
        end
    end
    if k==-1
        k
    elseif i== 101
        NBIT
        break;
    end
end
