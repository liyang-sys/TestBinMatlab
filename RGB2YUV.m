function [ yuv ] = RGB2YUV( rgb )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
T=[0.299, 0.587, 0.114; -0.147, -0.289, 0.436; 0.615, -0.515, -0.100];
rgb=double(rgb);
[h,w,~]=size(rgb);
%RGBtoYUV
%�Ƚ�rgbת��Ϊ3�еľ���ÿһ�зֱ����r��g��b
hdr=reshape(rgb,h*w,3)';
%Ȼ����ת������T��ˣ��õ���һ��3�еľ���ÿһ�зֱ����y��u��v
yuv=(T*hdr)';
yuv=reshape(yuv,h,w,3);


end

