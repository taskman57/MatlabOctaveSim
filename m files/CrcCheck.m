function CRC = CrcCheck(A)
CRC=0;
for i=5:9
    CRC= bitxor(CRC,A(i));
end
end
