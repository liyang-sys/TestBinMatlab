function [ yuv ] = RGB2YUV( rgb )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
T=[0.299, 0.587, 0.114; -0.147, -0.289, 0.436; 0.615, -0.515, -0.100];
rgb=double(rgb);
[h,w,~]=size(rgb);
%RGBtoYUV
%先将rgb转换为3行的矩阵，每一行分别代表r、g、b
hdr=reshape(rgb,h*w,3)';
%然后用转换矩阵T相乘，得到另一个3行的矩阵，每一行分别代表y、u、v
yuv=(T*hdr)';
yuv=reshape(yuv,h,w,3);


end

