clear all;
clc;
fop = fopen('E:\embedded\FtwInit1.COE','r');
fop1 = fopen('E:\embedded\FPGATbench.txt','r');
if fop <0
    disp('Unable to create file %s','FtwInit.COE');
    return;
end;
if fop1 <0
    disp('Unable to create file %s','FPGATbench.txt');
    return;
end;
tline1 = fgetl(fop);  % read the first line 
tline2 = fgetl(fop);  % read the second line
tline1 = fgetl(fop1);  % read the first line 
tline2 = fgetl(fop1);  % read the second line
A = fscanf(fop,'%X',167);
B = fscanf(fop1,'%X',167);
len= length(A);
for i=1:len
	if abs(A(i)-B(i))>0 
		fprintf('   Missmatch: ind:%d, %X , %X\n',i,  A(i), B(i));
	end
end

fclose(fop);
fclose(fop1);
