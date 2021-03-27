function [p] = PSNR(A,ref)

if A == ref
   error('Images are identical: PSNR has infinite value')
end

if (max(max(max(A))))>255.0 ||(max(max(max(ref))))>255.0 
    error('The image pixel value range is 0-255');
else
	Diff = double(ref)-double(A);
	MSE = sum(Diff(:).^2)/double(numel(ref));
	p=10*log10(255.0^2/MSE);
	fprintf('PSNR = +%5.2f dB\n',p);
end

end