function [ yiq ] = RGB2YIQ( rgb )
%UNTITLED6 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
T=[0.299, 0.587, 0.114; 0.596, -0.274, -0.322; 0.211, -0.523, 0.312];
rgb=double(rgb);
[h,w,~]=size(rgb);
%RGBtoYUV
%�Ƚ�rgbת��Ϊ3�еľ���ÿһ�зֱ����r��g��b
rgb=reshape(rgb,h*w,3)';
yiq=(T*rgb)';
yiq=reshape(yiq,h,w,3);

end

