function [ PSNR, MSE ] = getpsnr( A, ref, depth )
%��ȡ����ͼƬ��PSNR
%   �˴���ʾ��ϸ˵��
max=2^depth;
Diff = double(ref)-double(A);
MSE = sum(Diff(:).^2)/numel(ref);
PSNR=10*log10(max^2/MSE);
end




