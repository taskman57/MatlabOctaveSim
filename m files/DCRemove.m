function DCRemove
    close all;
    clear all;
    clc;
%     b=[0.99843166591671906,-0.99843166591671906,0];
%     a=[1,-0.996863331833438,0];
    b=[  6.168434236476e-11,1.233686847295e-10,6.168434236476e-11];%ButterWorth
    a=[1,   -1.999977785585,    0.999977785832];%ButterWorth
%%%%%%%%% In some cases coeffs are two small you have to multiply them to a
%%%%%%%%% large value to make them meaningfull in 20 bits or more fixed
%%%%%%%%% point values!...

    b=b.*1e9;
    a=a.*1e9;
    NB=10;%However, 8-bit also works well.
%     for i=1:1e+4
%         if i==1
%             X(i)=0;
%         else
%             X(i)=1;
%         end
%     end
    bfix=round(2^NB*b)/2^NB;
    afix=round(2^NB*a)/2^NB;

%     bfix1=round(2^(NB+3)*b)/2^(NB+3);
%     afix1=round(2^(NB+3)*a)/2^(NB+3);
    fvtool(b,a,bfix,afix);%%, bfix1, afix1);

% %     Y=filter(b,a,X);
% %     plot(Y);
% %     figure;
    [h,t] = stepz(b,a);
    plot(t,h,'r');
    hold on;
%     figure;
    [hfix,tfix]=stepz(bfix,afix);
    plot(tfix,hfix,'g');
end