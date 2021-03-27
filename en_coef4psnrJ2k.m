
imwrite(uint16(A), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio', 16/rat);
xbit=dir('tem.jp2');
Ar=double(imread('tem.jp2'));
SN=psnr(Ar/65535,double(A)/65535);
rat=xbit.bytes*8/numel(A);

fprintf('PSNR = %5.2f dB,  rate = %5.3f\n',SN,rat);
