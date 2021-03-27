clc;
x1=[1.9647,1.7343,1.6944,1.6176,1.5461];
x2=[1.0102,0.6452,0.4063,0.2408,0.1020];
y=[42.37,38.18,36.48,34.79,30.76];
plot(x1,y,'-o');hold on;  text(x1(1),y(1),'JPEGXT');
plot(x2,y,'-o');grid on; text(x2(1),y(1),'MyCode');

title('BD-rate对比（原图为memorial.o876）'); xlabel('bpp'); ylabel('LDR PSNR');