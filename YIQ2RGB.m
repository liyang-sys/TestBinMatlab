function [ rgb ] = YIQ2RGB( yiq )
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
T=[0.299, 0.587, 0.114; 0.596, -0.274, -0.322; 0.211, -0.523, 0.312];
[h,w,~]=size(yiq);
yiq=reshape(yiq,h*w,3)';
rgb=T \ yiq;
rgb=rgb';
rgb=reshape(rgb,h,w,3);

end