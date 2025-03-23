%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%        X_IN & Y_IN are in 1QN format:       %%%%%
%%%    11.0000000(-1.0),01.000000(+1.0)         %%%%%
%%%    Phase_OUT is in 2QN format               %%%%%
%%%  000.00000000. -2^2,2^1,2^0,2^-1,2^-2,...   %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
format compact;
format long;
clc;
a = dec2bin(hex2dec('9bab'));
Len = length(a);
if Len<16
    for i=1:(16-Len)
        a = ['0',a];
    end
end
 if a(1) == '1'
%      fprintf('\n  Negative');
     res = -4;
 else
     res = 0;
 end
 if a(2) == '1'
     res = res + 2;
 end
 if a(3) == '1'
     res = res + 1;
 end
 for i=4:length(a)
     if a(i) == '1'
         res = res + 1/pow2(i-3);
     end
 end
 res