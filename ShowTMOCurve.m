hdri=imread('F:\程序代码\色调映射测试\Fuji5_gry.ppm');

ldri1=imread('F:\程序代码\色调映射测试\TMO_image\Fuji5_tmo.jpg');
ldri2=imread('F:\程序代码\色调映射测试\TMO_image\Fuji5_tmo_flt.jpg');
ldri3=imread('F:\程序代码\色调映射测试\TMO_image\Fuji5_tmo_fromRGB.jpg');
ldri4=imread('F:\程序代码\色调映射测试\TMO_image\Fuji5_tmo_fromRGB_flt.jpg');

X=1:65536;
[x1,y1]=GetTmoCurve(hdri(:,:,1), ldri1);
[k,S,mu]=polyfit(x1,y1,10);
Y1=polyval(k,X,S,mu);
figure;
plot(X,Y1,'r'); hold on;

[x2,y2]=GetTmoCurve(hdri(:,:,1), ldri2);
[k,S,mu]=polyfit(x2,y2,10);
Y2=polyval(k,X,S,mu);
plot(X,Y2,'g'); hold on;

[x3, y3] = GetTmoCurve(hdri(:,:,1), ldri3);
[k,S,mu]=polyfit(x3,y3,10);
Y3=polyval(k,X,S,mu);
plot(X,Y3,'b'); hold on;

[x4, y4] = GetTmoCurve(hdri(:,:,1), ldri4);
[k,S,mu]=polyfit(x4,y4,10);
Y4=polyval(k,X,S,mu);
plot(X,Y4,'y'); hold on;

x=[0, 65535]; y=[0,255];
plot(x,y); hold off;

title('根据flt是否为真得到的TMO对比图（原图为Fuji5）'); xlabel('HDR(0~65535)'); ylabel('LDR(0~255)');
legend({'tmo', 'tmoflt', 'tmofromRGB', 'tmofromRGBflt'}, 'Location', 'SouthEast');


