format compact;
format long;
a(1)=max(abs(simout1));
a(2)=max(abs(simout2));
a(3)=max(abs(simout3));
a(4)=max(abs(simout4));
a(5)=max(abs(simout));
length(simout3)
for i=1:length(simout3)
    if simout3(i)<0
        simout3(i)
    end
end