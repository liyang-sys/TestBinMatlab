function [ rgb ] = YUV2RGB( yuv )
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
T=[0.299, 0.587, 0.114; -0.147, -0.289, 0.436; 0.615, -0.515, -0.100];
[h,w,~]=size(yuv);
yuv=reshape(yuv,h*w,3)';
rgb=T \ yuv;
rgb=rgb';
rgb=reshape(rgb,h,w,3);

end

