function c=signed(a)
len=length(a);
for i=1:len
    if a(i)>32767
        b= dec2bin(a(i));
        for j=1:16
            if b(j)=='1'
                b(j)='0';
            else
                b(j)='1';
            end
        end
        b=bin2dec(b)+1;
        a(i)=b*-1;
    end
end
c=a;
end