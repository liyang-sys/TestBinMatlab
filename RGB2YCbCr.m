function [ ycbcr] = RGB2YCbCr( rgb )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
T=[0.299, 0.587, 0.114; -0.1687,-0.3313,0.5;0.5,-0.4187,-0.0813];
rgb=double(rgb);
[h,w,~]=size(rgb);
hdr=reshape(rgb,h*w,3)';
ycbcr=(T*hdr)';
ycbcr=reshape(ycbcr,h,w,3);


end