
x=-10:0.01:10;
y=sinc(x);
axis off;
for i=1:10
  plot(x,y+(i*1e-5),"k");
  hold on;
endfor
im = print(gcf, '-RGBImage');
tcolor = [255 255 255];
alpha=255*(1-(im(:,:,1)==tcolor(1)).*(im(:,:,2)==tcolor(2)).*(im(:,:,3)==tcolor(3)));
##imwrite(im, 'sinc_curve.png', 'Alpha', alpha);
