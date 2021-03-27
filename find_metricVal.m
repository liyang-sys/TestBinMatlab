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


%================================================================================================================
%check='PSNR';
check='SSIM';
%----------------------------------------------------------------------------------------------------------------
compr='HEVC';
%compr='J2K';
%compr='JPEGXT';
%================================================================================================================


qp=[0 3 6 9 12 30 36];  f=1000000/255; 

%data:=================================================================================================================================================
rate=[2.897 2.931 2.769 4.055 2.912 3.317 3.357 3.378 3.318	3.764	3.691	4.026	2.912	3.716	2.376	5.135	5.044 5.531 5.203 3.267 3.418 3.328 3.186 4.013 3.087 3.882 2.713 4.396 4.460 3.902 3.791 4.112 
2.344 2.389 2.218 3.496 2.415 2.777 2.803 2.866 2.763	3.187	3.131	3.449	2.385	3.153	1.859	4.540	4.456 4.920 4.606 2.707 2.866 2.771 2.634 3.473 2.509 3.332 2.139 3.849 3.902 3.360 3.249 3.557 
1.842 1.895 1.715 3.014 1.976 2.297 2.311 2.387 2.272	2.691	2.606	2.912	1.934	2.637	1.386	4.011	3.933 4.383 4.079 2.158 2.334 2.232 2.086 2.961 1.944 2.808 1.608 3.344 3.397 2.849 2.732 3.038 
1.383 1.428 1.262 2.557 1.556 1.843 1.835 1.923 1.824	2.229	2.090	2.381	1.537	2.136	0.962	3.488	3.438 3.913 3.569 1.612 1.788 1.695 1.528 2.452 1.396 2.280 1.136 2.847 2.921 2.332 2.201 2.520 
0.985 1.018 0.882 2.111 1.170 1.422 1.388 1.492 1.433	1.821	1.606	1.871	1.198	1.661	0.617	2.968	2.914 3.382 3.042 1.082 1.221 1.152 0.967 1.924 0.938 1.720 0.772 2.307 2.387 1.777 1.641 1.980 
.1002 .0715 .0871 .1666 .1366 .2036 .1645 .2909 .2417 .3654 .2448 .2560 .1939 .2499 .0769 .4361 .2951 .1678 .4550 .0532 .0483 .0537 .0493 .0849 .0872 .0653 .0705 .2175 .0633 .1268 .1294 .1744
.0541	.0353	.0442	.0804	.0676	.1065	.0905	.1564	.1208	.1851	.1116	.1203	.0911	.1433	.0383	.2092	.1499	.0678	.2322	.0225	.0226	.0256	.0243	.0357	.0426	.0286	.0357	.1079	.0293	.0713	.0734	.0799]';

JXT_PSNR=[55.87	56.17	56.44	54.61	55.55	54.81	55.24	55.59	55.72	54.9	55.07	55.82	55	54.99	55.48	52.97	50.91	54	51.83	55.18	55.78	56.06	55.89	54.28	54.76	53.95	56.66	50.64	48.08	53.4	52.37	50.06
53.58	53.9	54.2	51.86	53.18	52.25	52.69	53.02	52.89	51.77	52.6	53.17	52.12	52.38	53.34	50.06	47.99	50.73	48.64	53.33	53.69	53.88	53.91	51.29	52.68	51.63	54.39	48.76	46.56	51.22	50.42	48.16
51.42	51.9	52.05	49.44	51.1	50.02	50.45	50.7	50.13	49.03	50.38	50.76	49.45	50.02	51.18	47.49	45.77	47.64	46.15	51.55	51.78	51.93	52.1	49	50.54	49.66	52.34	47.09	45.17	49.33	48.69	46.29
49.3	49.92	49.86	47.26	49.02	47.9	48.33	48.46	47.44	46.37	48.25	48.55	46.87	47.6	48.82	45.17	44	45.04	44.05	49.55	49.92	49.99	50.23	47.12	48.1	47.85	50.01	45.53	43.64	47.56	47	44.3
47.11	47.97	47.59	45.16	46.93	45.86	46.28	46.14	44.99	43.99	46.1	46.39	44.32	45.1	46.11	43.01	42.43	42.58	42.25	47.18	47.95	48	48.14	45.64	44.88	45.97	47.41	43.74	41.38	45.76	44.98	42.16
22.45	21.05	24.26	23.82	26.15	24.84	23.51	28.2	26.42	26.91	29.23	30.21	25.47	24.27	21.36	26.83	25.22	25.62	26.42	0	0	0	0	0	0	0	0	23.52	0	22.4	19.15	14.62]';

JXT_SSIM=[0.949	0.952	0.934	0.905	0.881	0.919	0.922	0.939	0.906	0.929	0.959	0.991	0.915	0.965	0.946	0.994	0.986	0.995	0.998	0.96	0.96	0.956	0.954	0.984	0.975	0.981	0.973	0.982	0.943	0.985	0.97	0.909
0.926	0.93	0.902	0.875	0.844	0.89	0.891	0.926	0.869	0.903	0.944	0.985	0.877	0.946	0.915	0.991	0.973	0.99	0.995	0.94	0.938	0.936	0.931	0.969	0.961	0.967	0.957	0.974	0.923	0.974	0.956	0.885
0.893	0.899	0.856	0.843	0.806	0.849	0.85	0.908	0.821	0.868	0.924	0.977	0.828	0.921	0.868	0.988	0.956	0.981	0.992	0.914	0.911	0.911	0.902	0.948	0.935	0.949	0.934	0.963	0.901	0.959	0.94	0.854
0.843	0.854	0.784	0.811	0.771	0.8	0.795	0.884	0.76	0.818	0.901	0.966	0.775	0.887	0.794	0.982	0.935	0.966	0.986	0.87	0.872	0.871	0.857	0.918	0.889	0.921	0.89	0.947	0.873	0.936	0.916	0.815
0.764	0.783	0.673	0.785	0.739	0.762	0.733	0.862	0.69	0.765	0.881	0.949	0.725	0.836	0.68	0.974	0.908	0.94	0.978	0.783	0.805	0.803	0.774	0.878	0.801	0.877	0.816	0.921	0.832	0.902	0.879	0.777
0.166	0.05	0.096	0.254	0.227	0.33	0.291	0.479	0.265	0.391	0.397	0.384	0.238	0.333	0.066	0.517	0.411	0.196	0.597	0	0	0	0	0	0	0	0	0.301	0	0.275	0.274	0.212]';
%======================================================================================================================================================

cr=16./rate; %for J2K

saving=zeros(32,6); 
del=[0.65, 0.9, 1.3, 1.8, 2.6, 16 28];


%image 1 to 8: =================================================================================================
disp('images 1 to 8:')
idx=[1 3 4 5 6 7 8 9];  QPi0=6;
for QPi=QPi0:6
   QPi
   QP=qp(QPi);
   H=4000; W=6000; fm=9; 
   hname=['\image\nikonY_acr_sharp_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==QPi0,   Y0 = read_yuv('\image\nikonY_acr_sharp.yuv',H,W,fm,'uint16',420);   end
   for ia=1:8
      A=double(Y0(:,:,idx(ia)))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,idx(ia)))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      end
      if strcmp(check,'SSIM')
         if strcmp(compr,'JPEGXT')
            mc0=JXT_SSIM(ia,QPi);      if mc0==0, mc0=0.2; end
         else
            mc0=ssim(qb0*f,A*f);
         end
      else
         if strcmp(compr,'JPEGXT')
            mc0=JXT_PSNR(ia,QPi);      if mc0==0, mc0=30; end
         else
            mc0=psnr(qb0/255,A/255);
         end
      end
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [mc,rat,savng,delta]=find_metricVal_sub(A,mc0,delta,rate0,check,f);
      saving(ia,QPi)=savng; 

      fprintf('image%d, QP=%d: mc0 = %7.5f, mc = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),mc0,mc,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end

%image 9 to 16: ===============================================================================================
disp('images 9 to 12:')
for QPi=QPi0:6
   QPi
   QP=qp(QPi);
   H=5504; W=8256; fm=4; 
   hname=['\image\850D_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==QPi0,      Y0 = read_yuv('\image\850D_original.yuv',H,W,fm,'uint16',420);   end
   for ia=9:12
      A=double(Y0(:,:,ia-8))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,ia-8))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      if strcmp(check,'SSIM')
         if strcmp(compr,'JPEGXT')
            mc0=JXT_SSIM(ia,QPi);      if mc0==0, mc0=0.2; end
         else
            mc0=ssim(qb0*f,A*f);
         end
      else
         if strcmp(compr,'JPEGXT')
            mc0=JXT_PSNR(ia,QPi);      if mc0==0, mc0=30; end
         else
            mc0=psnr(qb0/255,A/255);
         end
      end
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [mc,rat,savng,delta]=find_metricVal_sub(A,mc0,delta,rate0,check,f);
      saving(ia,QPi)=savng; 

      fprintf('image%d, QP=%d: mc0 = %7.5f, mc = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),mc0,mc,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end
disp('images 13 to 16:')
for QPi=QPi0:6
   QPi
   QP=qp(QPi);
   H=6192; W=8256; fm=4; 
   hname=['\image\Fuji_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==QPi0,      Y0 = read_yuv('\image\fujiY_original.yuv',H,W,fm,'uint16',420);   end
   for ia=13:16
      A=double(Y0(:,:,ia-12))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,ia-12))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      if strcmp(check,'SSIM')
         if strcmp(compr,'JPEGXT')
            mc0=JXT_SSIM(ia,QPi);      if mc0==0, mc0=0.2; end
         else
            mc0=ssim(qb0*f,A*f);
         end
      else
         if strcmp(compr,'JPEGXT')
            mc0=JXT_PSNR(ia,QPi);      if mc0==0, mc0=30; end
         else
            mc0=psnr(qb0/255,A/255);
         end
      end
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [mc,rat,savng,delta]=find_metricVal_sub(A,mc0,delta,rate0,check,f);
      saving(ia,QPi)=savng; 

      fprintf('image%d, QP=%d: mc0 = %7.5f, mc = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),mc0,mc,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end

%image 17 to 32: =======================================================================================================
disp('images 17 to 32:')
%4 UHD images: ----------------------------------------------------------------------------------------
for QPi=QPi0:6
   QPi
   QP=qp(QPi);
   H=2160; W=3840; fm=4; 
   hname=['\image\UHDimages_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==QPi0,      Y0 = read_yuv('\image\UHDimages.yuv',H,W,fm,'uint16',420);   end
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
      if strcmp(check,'SSIM')
         if strcmp(compr,'JPEGXT')
            mc0=JXT_SSIM(ia,QPi);      if mc0==0, mc0=0.2; end
         else
            mc0=ssim(qb0*f,A*f);
         end
      else
         if strcmp(compr,'JPEGXT')
            mc0=JXT_PSNR(ia,QPi);      if mc0==0, mc0=30; end
         else
            mc0=psnr(qb0/255,A/255);
         end
      end
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [mc,rat,savng,delta]=find_metricVal_sub(A,mc0,delta,rate0,check,f);
      saving(ia,QPi)=savng; 

      fprintf('image%d, QP=%d: mc0 = %7.5f, mc = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),mc0,mc,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end

%4 HD images: ---------------------------------------------------------------------------------------
for QPi=QPi0:6
   QPi
   QP=qp(QPi);
   H=2160/2; W=3840/2; fm=4; 
   hname=['\image\HDimages_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==QPi0,      Y0 = read_yuv('\image\HDimages.yuv',H,W,fm,'uint16',420);   end
   for ia=29:32
      A=double(Y0(:,:,ia-28))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,ia-28))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      if strcmp(check,'SSIM')
         if strcmp(compr,'JPEGXT')
            mc0=JXT_SSIM(ia,QPi);      if mc0==0, mc0=0.2; end
         else
            mc0=ssim(qb0*f,A*f);
         end
      else
         if strcmp(compr,'JPEGXT')
            mc0=JXT_PSNR(ia,QPi);      if mc0==0, mc0=30; end
         else
            mc0=psnr(qb0/255,A/255);
         end
      end
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [mc,rat,savng,delta]=find_metricVal_sub(A,mc0,delta,rate0,check,f);
      saving(ia,QPi)=savng; 

      fprintf('image%d, QP=%d: mc0 = %7.5f, mc = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),mc0,mc,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end


%xray images: ------------------------------------------------------------------------------------------
for QPi=QPi0:6
   ia=20;
   QP=qp(QPi);
   H=896; W=768; fm=1; 
   hname=['\image\med_xray1_896x768_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==QPi0,      Y0 = read_yuv('\image\med_xray1_896x768_12bit.yuv',H,W,fm,'uint16',420);   end
      A=double(Y0(:,:,ia-19))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,ia-19))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      if strcmp(check,'SSIM')
         if strcmp(compr,'JPEGXT')
            mc0=JXT_SSIM(ia,QPi);      if mc0==0, mc0=0.2; end
         else
            mc0=ssim(qb0*f,A*f);
         end
      else
         if strcmp(compr,'JPEGXT')
            mc0=JXT_PSNR(ia,QPi);      if mc0==0, mc0=30; end
         else
            mc0=psnr(qb0/255,A/255);
         end
      end
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [mc,rat,savng,delta]=find_metricVal_sub(A,mc0,delta,rate0,check,f);
      saving(ia,QPi)=savng; 

      fprintf('image%d, QP=%d: mc0 = %7.5f, mc = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),mc0,mc,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
end

for QPi=QPi0:6
   QPi
   QP=qp(QPi);
   H=1536; W=1536; fm=3; 
   hname=['\image\med_xrays_1536x1536_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==QPi0,      Y0 = read_yuv('\image\med_xrays_1536x1536_12bit.yuv',H,W,fm,'uint16',420);   end
   
   for ia=21:23
      A=double(Y0(:,:,ia-20))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,ia-20))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      if strcmp(check,'SSIM')
         if strcmp(compr,'JPEGXT')
            mc0=JXT_SSIM(ia,QPi);      if mc0==0, mc0=0.2; end
         else
            mc0=ssim(qb0*f,A*f);
         end
      else
         if strcmp(compr,'JPEGXT')
            mc0=JXT_PSNR(ia,QPi);      if mc0==0, mc0=30; end
         else
            mc0=psnr(qb0/255,A/255);
         end
      end
      rate0=rate(ia,QPi)

      delta=del(QPi);
      [mc,rat,savng,delta]=find_metricVal_sub(A,mc0,delta,rate0,check,f);
      saving(ia,QPi)=savng; 

      fprintf('image%d, QP=%d: mc0 = %7.5f, mc = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),mc0,mc,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end

for QPi=QPi0:6
   QPi
   QP=qp(QPi);
   H=512; W=512; fm=3;
   hname=['\image\med_xrays_512x512_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==QPi0,      Y0 = read_yuv('\image\med_xrays_512x512_12bit.yuv',H,W,fm,'uint16',420);   end
   
   for ia=24:26
      A=double(Y0(:,:,ia-23))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,ia-23))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      if strcmp(check,'SSIM')
         if strcmp(compr,'JPEGXT')
            mc0=JXT_SSIM(ia,QPi);      if mc0==0, mc0=0.2; end
         else
            mc0=ssim(qb0*f,A*f);
         end
      else
         if strcmp(compr,'JPEGXT')
            mc0=JXT_PSNR(ia,QPi);      if mc0==0, mc0=30; end
         else
            mc0=psnr(qb0/255,A/255);
         end
      end
      rate0=rate(ia,QPi)
      
      delta=del(QPi);
      [mc,rat,savng,delta]=find_metricVal_sub(A,mc0,delta,rate0,check,f);
      saving(ia,QPi)=savng; 

      fprintf('image%d, QP=%d: mc0 = %7.5f, mc = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),mc0,mc,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end
end

for QPi=QPi0:6
   ia=27;
   QP=qp(QPi);
   H=736; W=640; fm=1; 
   hname=['\image\med_xray8_736x640_QP' num2str(QP) '.yuv'];
   if strcmp(compr,'HEVC'),  Y = read_yuv(hname,H,W,fm,'uint16',420); end
   if QPi==QPi0,      Y0 = read_yuv('\image\med_xray8_736x640_12bit.yuv',H,W,fm,'uint16',420);   end
      A=double(Y0(:,:,ia-26))/16;
      if strcmp(compr,'HEVC')
         qb0=double(Y(:,:,ia-26))/16;
      elseif strcmp(compr,'J2K')
         imwrite(uint16(round(A*257)), 'tem.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',cr(ia,QPi));
         qb0=double(imread('tem.jp2'))/257;
      else
      end
      if strcmp(check,'SSIM')
         if strcmp(compr,'JPEGXT')
            mc0=JXT_SSIM(ia,QPi);      if mc0==0, mc0=0.2; end
         else
            mc0=ssim(qb0*f,A*f);
         end
      else
         if strcmp(compr,'JPEGXT')
            mc0=JXT_PSNR(ia,QPi);      if mc0==0, mc0=30; end
         else
            mc0=psnr(qb0/255,A/255);
         end
      end
      rate0=rate(ia,QPi)
      
      delta=del(QPi);
      [mc,rat,savng,delta]=find_metricVal_sub(A,mc0,delta,rate0,check,f);
      saving(ia,QPi)=savng; 

      fprintf('image%d, QP=%d: mc0 = %7.5f, mc = %7.5f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,qp(QPi),mc0,mc,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
end
