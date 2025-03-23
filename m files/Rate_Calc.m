clc;
clear all;
format LONG;
for NBIT = 5:64
    for ADC_Value = 0:1023
        y = floor(-1/9* ADC_Value + 48+292/9);% our Floating Point line equation
        y_fixed = floor(round(-1*2^NBIT/9)/2^NBIT * ADC_Value + 48+292/9);%our Fixed Point line Equation
        if abs(y -  y_fixed) >0
            break;
        end
        if y_fixed < 0
%             disp('\n\r Output is negative');
            fprintf('\n\rOutput is negative:%d', ADC_Value);
            NBIT
            break;
        end
    end
    if ADC_Value == 1023
        NBIT
        break;
    end
end