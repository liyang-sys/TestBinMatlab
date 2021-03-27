%12-bit images: ===========================================================
image_name=cell(1,32);  ext='.pgm';  ext8='_8bit.pgm';  bitdepth=ones(1,32)*12;
image_name{1}='\image\pgm\Nikon_5300D1';   
image_name{2}='\image\pgm\Nikon_5300D2';
image_name{3}='\image\pgm\Nikon_5300D3';
image_name{4}='\image\pgm\Nikon_5300D4';
image_name{5}='\image\pgm\Nikon_5300D5';
image_name{6}='\image\pgm\Nikon_5300D6';
image_name{7}='\image\pgm\Nikon_5300D7';
image_name{8}='\image\pgm\Nikon_5300D8';

image_name{9}='\image\pgm\Nikon_850D1';
image_name{10}='\image\pgm\Nikon_850D2';
image_name{11}='\image\pgm\Nikon_850D3';
image_name{12}='\image\pgm\Nikon_850D4';

image_name{13}='\image\pgm\Fuji1';
image_name{14}='\image\pgm\Fuji2';
image_name{15}='\image\pgm\Fuji3';
image_name{16}='\image\pgm\Fuji4';

image_name{17}='\image\pgm\UHD1';
image_name{18}='\image\pgm\UHD2';
image_name{19}='\image\pgm\UHD3';

image_name{20}='\image\pgm\xray1';
image_name{21}='\image\pgm\xray2';
image_name{22}='\image\pgm\xray3';
image_name{23}='\image\pgm\xray4';
image_name{24}='\image\pgm\xray5';
image_name{25}='\image\pgm\xray6';
image_name{26}='\image\pgm\xray7';
image_name{27}='\image\pgm\xray8';

%10-bit images: ===========================================================
image_name{28}='\image\pgm\UHD4'; bitdepth(28:32)=10;
image_name{29}='\image\pgm\HD1';
image_name{30}='\image\pgm\HD2';
image_name{31}='\image\pgm\HD3';
image_name{32}='\image\pgm\HD4';

rate=[2.897 2.931 2.769 4.055 2.912 3.317 3.357 3.378 3.318	3.764	3.691	4.026	2.912	3.716	2.376	5.135	5.044 5.531 5.203 3.267 3.418 3.328 3.186 4.013 3.087 3.882 2.713 4.396 4.460 3.902 3.791 4.112 
2.344 2.389 2.218 3.496 2.415 2.777 2.803 2.866 2.763	3.187	3.131	3.449	2.385	3.153	1.859	4.540	4.456 4.920 4.606 2.707 2.866 2.771 2.634 3.473 2.509 3.332 2.139 3.849 3.902 3.360 3.249 3.557 
1.842 1.895 1.715 3.014 1.976 2.297 2.311 2.387 2.272	2.691	2.606	2.912	1.934	2.637	1.386	4.011	3.933 4.383 4.079 2.158 2.334 2.232 2.086 2.961 1.944 2.808 1.608 3.344 3.397 2.849 2.732 3.038 
1.383 1.428 1.262 2.557 1.556 1.843 1.835 1.923 1.824	2.229	2.090	2.381	1.537	2.136	0.962	3.488	3.438 3.913 3.569 1.612 1.788 1.695 1.528 2.452 1.396 2.280 1.136 2.847 2.921 2.332 2.201 2.520 
0.985 1.018 0.882 2.111 1.170 1.422 1.388 1.492 1.433	1.821	1.606	1.871	1.198	1.661	0.617	2.968	2.914 3.382 3.042 1.082 1.221 1.152 0.967 1.924 0.938 1.720 0.772 2.307 2.387 1.777 1.641 1.980 
.0541	.0353	.0442	.0804	.0676	.1065	.0905	.1564	.1208	.1851	.1116	.1203	.0911	.1433	.0383	.2092	.1499	.0678	.2322	.0225	.0226	.0256	.0243	.0357	.0426	.0286	.0357	.1079	.0293	.0713	.0734	.0799]';


cr=16./rate; 
PSNRJ2K=zeros(32,6);   SSIMJ2K=PSNRJ2K; f=1000000; 
for ia=18%1:32
   img=[image_name{ia},ext];
   a=imread(img);
   if bitdepth(ia)==12
      a=double(a)/16;
   else
      a=double(a)/4;
   end
   for ib=1%:6
      [ia ib]
      imwrite(uint16(round(a*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,ib));
      ar=double(imread('tem.jp2'))/257;
      
      PSNRJ2K(ia,ib)=psnr(ar/255,a/255);
      SSIMJ2K(ia,ib)=ssim(ar/255*f,a/255*f);
   end


   

for ix=1:6
   fprintf('%6.2f',PSNRJ2K(:,ix));   fprintf('\n')
end
fprintf('\n')
for ix=1:6
   fprintf('%6.3f',SSIMJ2K(:,ix));   fprintf('\n')
end
fprintf('\n')

   
   
   
end



for ix=1:6
   fprintf('%6.2f',PSNRJ2K(:,ix));   fprintf('\n')
end
fprintf('\n')
for ix=1:6
   fprintf('%8.5f',SSIMJ2K(:,ix));   fprintf('\n')
end
fprintf('\n')

