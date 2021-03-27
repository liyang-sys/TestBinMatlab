function [ PSNR, MSE ] = getpsnr( A, ref, depth )
%获取两幅图片的PSNR
%   此处显示详细说明
max=2^depth;
Diff = double(ref)-double(A);
MSE = sum(Diff(:).^2)/numel(ref);
PSNR=10*log10(max^2/MSE);
end




