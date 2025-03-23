function ret=ShiftSigned(a)
Len = length(a);
if Len<16
    for i=1:(16-Len)
        a = ['0',a];
    end
end
ret= [a(1),a(1:end-1)];

