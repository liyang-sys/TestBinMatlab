%12-bit images: ===========================================================
image_name=cell(1,32); image_prop=cell(1,32); ext='.pgm';  ext8='_8bit.pgm';  bitdepth=ones(1,32)*12;
image_name{1}='\image\pgm\Nikon_5300D1';     image_prop{1}='\image\5300D1_prop_QP';
image_name{2}='\image\pgm\Nikon_5300D2';     image_prop{2}='\image\5300D2_prop_QP';
image_name{3}='\image\pgm\Nikon_5300D3';     image_prop{3}='\image\5300D3_prop_QP';
image_name{4}='\image\pgm\Nikon_5300D4';     image_prop{4}='\image\5300D4_prop_QP';
image_name{5}='\image\pgm\Nikon_5300D5';     image_prop{5}='\image\5300D5_prop_QP';
image_name{6}='\image\pgm\Nikon_5300D6';     image_prop{6}='\image\5300D6_prop_QP';
image_name{7}='\image\pgm\Nikon_5300D7';     image_prop{7}='\image\5300D7_prop_QP';
image_name{8}='\image\pgm\Nikon_5300D8';     image_prop{8}='\image\5300D8_prop_QP';

image_name{9}='\image\pgm\Nikon_850D1';     image_prop{9}='\image\Nikon850D1_prop_QP';
image_name{10}='\image\pgm\Nikon_850D2';     image_prop{10}='\image\Nikon850D1_prop_QP';
image_name{11}='\image\pgm\Nikon_850D3';     image_prop{11}='\image\Nikon850D1_prop_QP';
image_name{12}='\image\pgm\Nikon_850D4';     image_prop{12}='\image\Nikon850D1_prop_QP';

image_name{13}='\image\pgm\Fuji1';     image_prop{13}='\image\Fuji1_prop_QP';
image_name{14}='\image\pgm\Fuji2';     image_prop{14}='\image\Fuji2_prop_QP';
image_name{15}='\image\pgm\Fuji3';     image_prop{15}='\image\Fuji3_prop_QP';
image_name{16}='\image\pgm\Fuji4';     image_prop{16}='\image\Fuji4_prop_QP';

image_name{17}='\image\pgm\UHD1';     image_prop{17}='\image\UHD1_prop_QP'; 
image_name{18}='\image\pgm\UHD2';     image_prop{18}='\image\UHD2_prop_QP';
image_name{19}='\image\pgm\UHD3';     image_prop{19}='\image\UHD3_prop_QP';

image_name{20}='\image\pgm\xray1';     image_prop{20}='\image\xray1_prop_QP';
image_name{21}='\image\pgm\xray2';     image_prop{21}='\image\xray2_prop_QP';
image_name{22}='\image\pgm\xray3';     image_prop{22}='\image\xray3_prop_QP';
image_name{23}='\image\pgm\xray4';     image_prop{23}='\image\xray4_prop_QP';
image_name{24}='\image\pgm\xray5';     image_prop{24}='\image\xray5_prop_QP';
image_name{25}='\image\pgm\xray6';     image_prop{25}='\image\xray6_prop_QP';
image_name{26}='\image\pgm\xray7';     image_prop{26}='\image\xray7_prop_QP';
image_name{27}='\image\pgm\xray8';     image_prop{27}='\image\xray8_prop_QP';

%10-bit images: ===========================================================
image_name{28}='\image\pgm\UHD4';  bitdepth(28:32)=10;     image_prop{28}='\image\UHD4_prop_QP';
image_name{29}='\image\pgm\HD1';     image_prop{29}='\image\HD1_prop_QP';
image_name{30}='\image\pgm\HD2';     image_prop{30}='\image\HD2_prop_QP';
image_name{31}='\image\pgm\HD3';     image_prop{31}='\image\HD3_prop_QP';
image_name{32}='\image\pgm\HD4';     image_prop{32}='\image\HD4_prop_QP';


qp=[0 3 6 9 12 24 30 36];
f=1000000/255; 


%HEVC: =========================================================================================================
rate=[2.897 2.931 2.769 4.055 2.912 3.317 3.357 3.378 3.318	3.764	3.691	4.026	2.912	3.716	2.376	5.135	5.044 5.531 5.203 3.267 3.418 3.328 3.186 4.013 3.087 3.882 2.713 4.396 4.460 3.902 3.791 4.112 
2.344 2.389 2.218 3.496 2.415 2.777 2.803 2.866 2.763	3.187	3.131	3.449	2.385	3.153	1.859	4.540	4.456 4.920 4.606 2.707 2.866 2.771 2.634 3.473 2.509 3.332 2.139 3.849 3.902 3.360 3.249 3.557 
1.842 1.895 1.715 3.014 1.976 2.297 2.311 2.387 2.272	2.691	2.606	2.912	1.934	2.637	1.386	4.011	3.933 4.383 4.079 2.158 2.334 2.232 2.086 2.961 1.944 2.808 1.608 3.344 3.397 2.849 2.732 3.038 
1.383 1.428 1.262 2.557 1.556 1.843 1.835 1.923 1.824	2.229	2.090	2.381	1.537	2.136	0.962	3.488	3.438 3.913 3.569 1.612 1.788 1.695 1.528 2.452 1.396 2.280 1.136 2.847 2.921 2.332 2.201 2.520 
0.985 1.018 0.882 2.111 1.170 1.422 1.388 1.492 1.433	1.821	1.606	1.871	1.198	1.661	0.617	2.968	2.914 3.382 3.042 1.082 1.221 1.152 0.967 1.924 0.938 1.720 0.772 2.307 2.387 1.777 1.641 1.980 
.1889 .1538 .1697 .5215 .2696 .3788 .3104 .5028 .4512 .6674 .4826 .5190 .3736 .4348 .1428 .9706 .7259 1.155 .9078 .1284 .1183 .1282 .1049 .2041 .1985 .1878 .1469 .4233 .2244 .2230 .2191 .3545                     
.1002 .0715 .0871 .1666 .1366 .2036 .1645 .2909 .2417 .3654 .2448 .2560 .1939 .2499 .0769 .4361 .2951 .1678 .4550 .0532 .0483 .0537 .0493 .0849 .0872 .0653 .0705 .2175 .0633 .1268 .1294 .1744
.0541	.0353	.0442	.0804	.0676	.1065	.0905	.1564	.1208	.1851	.1116	.1203	.0911	.1433	.0383	.2092	.1499	.0678	.2322	.0225	.0226	.0256	.0243	.0357	.0426	.0286	.0357	.1079	.0293	.0713	.0734	.0799]';

cr=16./rate;

QPi=1; QP=qp(QPi);
rate0=rate(32,QPi); f=1000000/255;

%===============================================================================================================
rat=zeros(32,6);  PSNR=rat; SSIM=rat;
del=[0.65, 0.9, 1.3, 1.8, 2.6, 15, 30, 45];

QPi0=6;

%image 17 to 32: =======================================================================================================
disp('images 17 to 32:')
%4 UHD images: ----------------------------------------------------------------------------------------
for QPi=QPi0:6
   QPi
   QP=qp(QPi);
   H=2160; W=3840; fm=4; 
   if QPi==QPi0,      Y0 = read_yuv('\image\UHDimages.yuv',H,W,fm,'uint16',420);   end
   ix=0;
   for ia=[17 18 19 28]
      ix=ix+1;
      A=double(Y0(:,:,ix))/16;
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [rat(ia,QPi),PSNR(ia,QPi),SSIM(ia,QPi),delta]=find_coding_rate_sub(A,delta,rate0,f);
      fprintf('image%d, QP=%d: rate = %6.4f; PSNR = %6.3f dB;  SSIM = %5.3f;  delta =%7.3f \n',ia,qp(QPi),rat(ia,QPi),PSNR(ia,QPi),SSIM(ia,QPi),delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end

%4 HD images: ---------------------------------------------------------------------------------------
for QPi=QPi0:6
   QPi
   QP=qp(QPi);
   H=2160/2; W=3840/2; fm=4; 
   if QPi==QPi0,      Y0 = read_yuv('\image\HDimages.yuv',H,W,fm,'uint16',420);   end
   for ia=29:32
      A=double(Y0(:,:,ia-28))/16;
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [rat(ia,QPi),PSNR(ia,QPi),SSIM(ia,QPi),delta]=find_coding_rate_sub(A,delta,rate0,f);
      fprintf('image%d, QP=%d: rate = %6.4f; PSNR = %6.3f dB;  SSIM = %5.3f;  delta =%7.3f \n',ia,qp(QPi),rat(ia,QPi),PSNR(ia,QPi),SSIM(ia,QPi),delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end


%xray images: ------------------------------------------------------------------------------------------
for QPi=QPi0:6
   ia=20;
   QP=qp(QPi);
   H=896; W=768; fm=1; 
   if QPi==QPi0,      Y0 = read_yuv('\image\med_xray1_896x768_12bit.yuv',H,W,fm,'uint16',420);   end
      A=double(Y0(:,:,ia-19))/16;
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [rat(ia,QPi),PSNR(ia,QPi),SSIM(ia,QPi),delta]=find_coding_rate_sub(A,delta,rate0,f);
      fprintf('image%d, QP=%d: rate = %6.4f; PSNR = %6.3f dB;  SSIM = %5.3f;  delta =%7.3f \n',ia,qp(QPi),rat(ia,QPi),PSNR(ia,QPi),SSIM(ia,QPi),delta)
      fprintf('\n=============================================================================================================\n\n')
end

for QPi=QPi0:6
   QPi
   QP=qp(QPi);
   H=1536; W=1536; fm=3; 
   if QPi==QPi0,      Y0 = read_yuv('\image\med_xrays_1536x1536_12bit.yuv',H,W,fm,'uint16',420);   end
   for ia=21:23
      A=double(Y0(:,:,ia-20))/16;
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [rat(ia,QPi),PSNR(ia,QPi),SSIM(ia,QPi),delta]=find_coding_rate_sub(A,delta,rate0,f);
      fprintf('image%d, QP=%d: rate = %6.4f; PSNR = %6.3f dB;  SSIM = %5.3f;  delta =%7.3f \n',ia,qp(QPi),rat(ia,QPi),PSNR(ia,QPi),SSIM(ia,QPi),delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end

for QPi=QPi0:6
   QPi
   QP=qp(QPi);
   H=512; W=512; fm=3;
   if QPi==QPi0,      Y0 = read_yuv('\image\med_xrays_512x512_12bit.yuv',H,W,fm,'uint16',420);   end
   for ia=24:26
      A=double(Y0(:,:,ia-23))/16;
      rate0=rate(ia,QPi)
      
      delta=del(QPi);
      [rat(ia,QPi),PSNR(ia,QPi),SSIM(ia,QPi),delta]=find_coding_rate_sub(A,delta,rate0,f);
      fprintf('image%d, QP=%d: rate = %6.4f; PSNR = %6.3f dB;  SSIM = %5.3f;  delta =%7.3f \n',ia,qp(QPi),rat(ia,QPi),PSNR(ia,QPi),SSIM(ia,QPi),delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end

for QPi=QPi0:6
   ia=27;
   QP=qp(QPi);
   H=736; W=640; fm=1; 
   if QPi==QPi0,      Y0 = read_yuv('\image\med_xray8_736x640_12bit.yuv',H,W,fm,'uint16',420);   end
      A=double(Y0(:,:,ia-26))/16;
      rate0=rate(ia,QPi)
      
      delta=del(QPi);
      [rat(ia,QPi),PSNR(ia,QPi),SSIM(ia,QPi),delta]=find_coding_rate_sub(A,delta,rate0,f);
      fprintf('image%d, QP=%d: rate = %6.4f; PSNR = %6.3f dB;  SSIM = %5.3f;  delta =%7.3f \n',ia,qp(QPi),rat(ia,QPi),PSNR(ia,QPi),SSIM(ia,QPi),delta)
      fprintf('\n=============================================================================================================\n\n')
end

fprintf('%5.2f\t',PSNR(16:32,6)); fprintf('\n')
fprintf('%5.3f\t',SSIM(17:32,6)); fprintf('\n')
