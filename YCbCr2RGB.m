function [ rgb ] = YCbCr2RGB( ycbcr )
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
T=[0.299, 0.587, 0.114; -0.1687,-0.3313,0.5;0.5,-0.4187,-0.0813];
[h,w,~]=size(ycbcr);
ycbcr=reshape(ycbcr,h*w,3)';
rgb=T \ ycbcr;
rgb=rgb';
rgb=reshape(rgb,h,w,3);

end