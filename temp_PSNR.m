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
%check='SN';
check='SSIM';


%===============================================================================================================
saving=zeros(32,6);
del=[0.65, 0.9, 1.3, 1.8, 2.6, 15];


%image 17 to 32: =======================================================================================================

for QPi=1:6
   QPi
   QP=qp(QPi);
   H=512; W=512; fm=3;
   hname=['\image\med_xrays_512x512_QP' num2str(QP) '.yuv'];
   Y = read_yuv(hname,H,W,fm,'uint16',420);
   if QPi==1
      Y0 = read_yuv('\image\med_xrays_512x512_12bit.yuv',H,W,fm,'uint16',420);
   end
   
   for ia=24:26
      A=double(Y0(:,:,ia-23))/16;
      qb0=double(Y(:,:,ia-23))/16;
      if strcmp(check,'SSIM')
         mc0=ssim(qb0*f,A*f);
      else
         mc0=psnr(qb0/255,A/255);
      end
      rate0=rate(ia,QPi)
      
      delta=del(QPi);
      [mc,rat,savng,delta]=find_metricVal_sub(A,mc0,delta,rate0,check,f);
      saving(ia,QPi)=savng;

      fprintf('image%d, QP=%d: mc0 = %7.5f dB, mc = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),mc0,mc,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end

%SSIM: --------------------------------------------------------------
%   -5.3769   -4.8980   -3.8292   -4.8846   -3.5044   11.8123
%   -6.7820   -5.4922   -3.7327   -3.6644   -4.7424   39.0663
%   -5.4739   -4.1145   -2.6235   -3.2897   -1.9936   13.9474

%   -5.3809   -4.8955   -3.8252   -4.8507   -3.4775   11.8764
%   -6.7825   -5.5165   -3.7187   -3.6087   -4.7460   39.0394
%   -5.4642   -4.1226   -2.6129   -3.3347   -1.9334   13.4539
 

%PSNR: --------------------------------------------------------------
%   -5.4046   -4.7219   -2.3202   -2.2708   -0.7550   15.4453
%   -8.5569   -6.7094   -3.9693   -2.6700   -1.5145   32.7801
%   -5.5704   -4.1699   -2.3534   -3.1386   -1.6229   19.5361

%   -5.4466   -4.8059   -2.3202   -2.2708   -0.9285   16.1826
%   -7.4146   -6.4531   -3.5841   -3.3939   -1.5145   32.7801
%   -5.5704   -4.2272   -2.6712   -3.1386   -1.2923   19.4027
