clc;
b=1;
a=0;
while 1
    if a < 10
        a = a +0.1;
    else
        a = 0;
        break;
    end
    for i=1:64
        if ((round(a*2^i)/2^i) - a)==0
            if b< i
                b= i;
            end
            break;
        end
    end
end