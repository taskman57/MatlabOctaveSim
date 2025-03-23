function c=twoscomp(a)
    k=length(a);
    b=[];
    c=[];
    for i = 1:k
        if a(i) < 0
            b(i)= fix(a(i)*-1);
            c(i)=2^16 - b(i);
        else
            c(i)=a(i);
        end
    end
end