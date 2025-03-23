clc;
image=imread('D:\Belt2.jpg');
R=image(:,:,1) ;
G=image(:,:,2) ;
B=image(:,:,3) ;
luminance = 0.299 * R + 0.587 * G + 0.114 * B;
mean2(luminance)