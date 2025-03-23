clear all;
clc;
fop = fopen('E:\embedded\FtwInit.COE','w+');
fop1 = fopen('E:\embedded\FreqValue.txt','w+');
if fop <0
    disp('Unable to create file %s','FtwInit.COE');
    return;
end;
if fop1 <0
    disp('Unable to create file %s','FreqValue.txt');
    return;
end;
fprintf(fop, 'memory_initialization_radix = 16;\nmemory_initialization_vector =\n');
Fsysclk = 2.4e9;
arr=[];
%%%%%%%%%%%%%%%%%       Writing 0.5~1GHz 3MHz step values       %%%%%%%%%%%
for i=1:167
    Fdds = (9500-3*(i-1))*1e6/14;
    arr=[arr,abs(Fdds*14-10e9)];
    fprintf(fop1,'%d,\n',abs(Fdds*14-10e9));
    Ftw = round(2^32*(Fdds/Fsysclk));
    fprintf(fop,'%08X,\n',Ftw);
end
%%%%%%%%%%%%%%%%%       Writing 1~2GHz 3MHz step values       %%%%%%%%%%%%%
for i=1:333
    Fdds = (9500-1.5*(i-1)-0.5)*1e6/14;
    arr=[arr,abs(Fdds*14-10e9)*2];
    fprintf(fop1,'%d,\n',abs(Fdds*14-10e9)*2);
    Ftw = round(2^32*(Fdds/Fsysclk));
    fprintf(fop,'%08X,\n',Ftw);
end
%%%%%%%%%%%%%%%%%       Writing 2~4GHz 3MHz step values       %%%%%%%%%%%%%
for i=1:667
    Fdds = (9500-.75*(i-1))*1e6/14;
    arr=[arr,abs(Fdds*14-10e9)*4];
    fprintf(fop1,'%d,\n',abs(Fdds*14-10e9)*4);
    Ftw = round(2^32*(Fdds/Fsysclk));
    fprintf(fop,'%08X,\n',Ftw);
end
len = length(arr);
for i=1:len-1
    if arr(i+1)-arr(i)~=3e6
        fprintf('  Wrong Data Generated: %d, %d\n',i,arr(i+1));
    end
end
fclose(fop);
fclose(fop1);
