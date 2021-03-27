clc;
[ a ] = pfmread_op('E:\程序代码\色调映射测试\pfm\memorial_o876.pfm');
T=[0.299, 0.578, 0.114; -0.147, -0.289, 0.436; 0.615, -0.515, -0.100];
T1=[0.299, 0.587, 0.114; 0.596, -0.274, -0.322; 0.211, -0.523, 0.312];
a=double(a);
T0=T^-1;   T2=T1^-1;
% yuv=zeros(768,512,3);
% for ii=1:3
%     yuv(:,:,ii)=a(:,:,1).*T(ii,1)+a(:,:,2).*T(ii,2)+a(:,:,3).*T(ii,3);
% end
% %YUVtoRGB
% rgb=zeros(768,512,3);
% for ii=1:3
%     rgb(:,:,ii)=yuv(:,:,1).*T0(ii,1)+yuv(:,:,2).*T0(ii,2)+yuv(:,:,3).*T0(ii,3);
% end 

%RGBtoYIQ
yiq=zeros(768,512,3);
for ii=1:3
    yiq(:,:,ii)=a(:,:,1).*T1(ii,1)+a(:,:,2).*T1(ii,2)+a(:,:,3).*T1(ii,3);
end
%YIQtoRGB
rgb2=zeros(768,512,3);
for ii=1:3
    rgb2(:,:,ii)=yiq(:,:,1).*T2(ii,1)+yiq(:,:,2).*T2(ii,2)+yiq(:,:,3).*T2(ii,3);
end

