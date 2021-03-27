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


qp=[0 3 6 9 12 36];
f=1000000/255; 


%HEVC: =========================================================================================================
rate=[2.897 2.931 2.769 4.055 2.912 3.317 3.357 3.378 3.318	3.764	3.691	4.026	2.912	3.716	2.376	5.135	5.044 5.531 5.203 3.267 3.418 3.328 3.186 4.013 3.087 3.882 2.713 4.396 4.460 3.902 3.791 4.112 
2.344 2.389 2.218 3.496 2.415 2.777 2.803 2.866 2.763	3.187	3.131	3.449	2.385	3.153	1.859	4.540	4.456 4.920 4.606 2.707 2.866 2.771 2.634 3.473 2.509 3.332 2.139 3.849 3.902 3.360 3.249 3.557 
1.842 1.895 1.715 3.014 1.976 2.297 2.311 2.387 2.272	2.691	2.606	2.912	1.934	2.637	1.386	4.011	3.933 4.383 4.079 2.158 2.334 2.232 2.086 2.961 1.944 2.808 1.608 3.344 3.397 2.849 2.732 3.038 
1.383 1.428 1.262 2.557 1.556 1.843 1.835 1.923 1.824	2.229	2.090	2.381	1.537	2.136	0.962	3.488	3.438 3.913 3.569 1.612 1.788 1.695 1.528 2.452 1.396 2.280 1.136 2.847 2.921 2.332 2.201 2.520 
0.985 1.018 0.882 2.111 1.170 1.422 1.388 1.492 1.433	1.821	1.606	1.871	1.198	1.661	0.617	2.968	2.914 3.382 3.042 1.082 1.221 1.152 0.967 1.924 0.938 1.720 0.772 2.307 2.387 1.777 1.641 1.980 
.0541	.0353	.0442	.0804	.0676	.1065	.0905	.1564	.1208	.1851	.1116	.1203	.0911	.1433	.0383	.2092	.1499	.0678	.2322	.0225	.0226	.0256	.0243	.0357	.0426	.0286	.0357	.1079	.0293	.0713	.0734	.0799]';

cr=16./rate;

QPi=1; QP=qp(QPi);
rate0=rate(32,QPi);



%===============================================================================================================
saving=zeros(32,6);
del=[0.65, 0.9, 1.3, 1.8, 2.6, 15];

%compr='HEVC';
compr='J2K';

%image 1 to 8: =================================================================================================
disp('images 1 to 8:')
idx=[1 3 4 5 6 7 8 9]; 
for QPi=1:6
   QPi
   QP=qp(QPi);
   H=4000; W=6000; fm=9; 
   hname=['\image\nikonY_acr_sharp_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==1,   Y0 = read_yuv('\image\nikonY_acr_sharp.yuv',H,W,fm,'uint16',420);   end
   for ia=1:8
      A=double(Y0(:,:,idx(ia)))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,idx(ia)))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      sm0=ssim(qb0*f,A*f);
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [sm,rat,savng,delta]=find_ssim_sub(A,sm0,delta,rate0,f);
      saving(ia,QPi)=savng;

      fprintf('image%d, QP=%d: sm0 = %7.5f dB, sm = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),sm0,sm,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end

%image 9 to 16: ===============================================================================================
disp('images 9 to 12:')
for QPi=1:6
   QPi
   QP=qp(QPi);
   H=5504; W=8256; fm=4; 
   hname=['\image\850D_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==1,      Y0 = read_yuv('\image\850D_original.yuv',H,W,fm,'uint16',420);   end
   for ia=9:12
      A=double(Y0(:,:,ia-8))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,ia-8))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      sm0=ssim(qb0*f,A*f);
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [sm,rat,savng,delta]=find_ssim_sub(A,sm0,delta,rate0,f);
      saving(ia,QPi)=savng;

      fprintf('image%d, QP=%d: sm0 = %7.5f dB, sm = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),sm0,sm,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end
disp('images 13 to 16:')
for QPi=1:6
   QPi
   QP=qp(QPi);
   H=6192; W=8256; fm=4; 
   hname=['\image\Fuji_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==1,      Y0 = read_yuv('\image\fujiY_original.yuv',H,W,fm,'uint16',420);   end
   for ia=13:16
      A=double(Y0(:,:,ia-12))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,ia-12))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      sm0=ssim(qb0*f,A*f);
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [sm,rat,savng,delta]=find_ssim_sub(A,sm0,delta,rate0,f);
      saving(ia,QPi)=savng;

      fprintf('image%d, QP=%d: sm0 = %7.5f dB, sm = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),sm0,sm,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end

%image 17 to 32: =======================================================================================================
disp('images 17 to 32:')
%4 UHD images: ----------------------------------------------------------------------------------------
for QPi=1:6
   QPi
   QP=qp(QPi);
   H=2160; W=3840; fm=4; 
   hname=['\image\UHDimages_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==1,      Y0 = read_yuv('\image\UHDimages.yuv',H,W,fm,'uint16',420);   end
   ix=0;
   for ia=[17 18 19 28]
      ix=ix+1;
      A=double(Y0(:,:,ix))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,ix))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      sm0=ssim(qb0*f,A*f);
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [sm,rat,savng,delta]=find_ssim_sub(A,sm0,delta,rate0,f);
      saving(ia,QPi)=savng;

      fprintf('image%d, QP=%d: sm0 = %7.5f dB, sm = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),sm0,sm,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end

%4 HD images: ---------------------------------------------------------------------------------------
for QPi=1:6
   QPi
   QP=qp(QPi);
   H=2160/2; W=3840/2; fm=4; 
   hname=['\image\HDimages_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==1,      Y0 = read_yuv('\image\HDimages.yuv',H,W,fm,'uint16',420);   end
   for ia=29:32
      A=double(Y0(:,:,ia-28))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,ia-28))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      sm0=ssim(qb0*f,A*f);
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [sm,rat,savng,delta]=find_ssim_sub(A,sm0,delta,rate0,f);
      saving(ia,QPi)=savng;

      fprintf('image%d, QP=%d: sm0 = %7.5f dB, sm = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),sm0,sm,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end


%xray images: ------------------------------------------------------------------------------------------
for QPi=1:6
   ia=20;
   QP=qp(QPi);
   H=896; W=768; fm=1; 
   hname=['\image\med_xray1_896x768_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==1,      Y0 = read_yuv('\image\med_xray1_896x768_12bit.yuv',H,W,fm,'uint16',420);   end
      A=double(Y0(:,:,ia-19))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,ia-19))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      sm0=ssim(qb0*f,A*f);
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [sm,rat,savng,delta]=find_ssim_sub(A,sm0,delta,rate0,f);
      saving(ia,QPi)=savng;

      fprintf('image%d, QP=%d: sm0 = %7.5f dB, sm = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),sm0,sm,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
end

for QPi=1:6
   QPi
   QP=qp(QPi);
   H=1536; W=1536; fm=3; 
   hname=['\image\med_xrays_1536x1536_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==1,      Y0 = read_yuv('\image\med_xrays_1536x1536_12bit.yuv',H,W,fm,'uint16',420);   end
   
   for ia=21:23
      A=double(Y0(:,:,ia-20))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,ia-20))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      sm0=ssim(qb0*f,A*f);
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [sm,rat,savng,delta]=find_ssim_sub(A,sm0,delta,rate0,f);
      saving(ia,QPi)=savng;

      fprintf('image%d, QP=%d: sm0 = %7.5f dB, sm = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),sm0,sm,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end

for QPi=1:6
   QPi
   QP=qp(QPi);
   H=512; W=512; fm=3;
   hname=['\image\med_xrays_512x512_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==1,      Y0 = read_yuv('\image\med_xrays_512x512_12bit.yuv',H,W,fm,'uint16',420);   end
   
   for ia=24:26
      A=double(Y0(:,:,ia-23))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,ia-23))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      sm0=ssim(qb0*f,A*f);
      rate0=rate(ia,QPi)
      
      delta=del(QPi);
      [sm,rat,savng,delta]=find_ssim_sub(A,sm0,delta,rate0,f);
      saving(ia,QPi)=savng;

      fprintf('image%d, QP=%d: sm0 = %7.5f dB, sm = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),sm0,sm,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end

for QPi=1:6
   ia=27;
   QP=qp(QPi);
   H=736; W=640; fm=1; 
   hname=['\image\med_xray8_736x640_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==1,      Y0 = read_yuv('\image\med_xray8_736x640_12bit.yuv',H,W,fm,'uint16',420);   end
      A=double(Y0(:,:,ia-26))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,ia-26))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      sm0=ssim(qb0*f,A*f);
      rate0=rate(ia,QPi)
      
      delta=del(QPi);
      [sm,rat,savng,delta]=find_ssim_sub(A,sm0,delta,rate0,f);
      saving(ia,QPi)=savng;

      fprintf('image%d, QP=%d: sm0 = %7.5f dB, sm = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),sm0,sm,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
end
