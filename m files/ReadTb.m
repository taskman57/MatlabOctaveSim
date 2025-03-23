function ReadTb(Fname)
close all;
clc;
fid = fopen(Fname,'r');
Data = fscanf(fid,'%4X');
max(Data)
min(Data)
plot(Data);
end