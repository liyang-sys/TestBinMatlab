function [ yiq ] = RGB2YIQ( rgb )
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
T=[0.299, 0.587, 0.114; 0.596, -0.274, -0.322; 0.211, -0.523, 0.312];
rgb=double(rgb);
[h,w,~]=size(rgb);
%RGBtoYUV
%先将rgb转换为3行的矩阵，每一行分别代表r、g、b
rgb=reshape(rgb,h*w,3)';
yiq=(T*rgb)';
yiq=reshape(yiq,h,w,3);

end

