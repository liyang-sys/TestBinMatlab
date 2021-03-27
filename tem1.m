f=1000000/255; 
check='PSNR';
%check='SSIM';

delta=1.02; 

%image 17 to 32: =======================================================================================================
disp('images 17 to 32:')
%4 UHD images: ----------------------------------------------------------------------------------------
   H=2160; W=3840; fm=4; 
   Y0 = read_yuv('\image\UHDimages.yuv',H,W,fm,'uint16',420);
   ix=0;
   for ia=[17 18 19 28]
      ix=ix+1;
      A=double(Y0(:,:,ix))/16;
      A8bit=round(A);
      SNR0=psnr(A8bit/255,A/255)

      imwrite(uint8(A8bit), 'tem.jp2', 'Mode','lossless');
      x8bit=dir('tem.jp2');
      rate0=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
      
      [SNR,rat,savng,delta]=find_metricVal_sub(A,SNR0,delta,rate0,check,f);
      saving(ia)=savng; 


      fprintf('image%d: PNNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end

%4 HD images: ---------------------------------------------------------------------------------------
   H=2160/2; W=3840/2; fm=4; 
   Y0 = read_yuv('\image\HDimages.yuv',H,W,fm,'uint16',420);
   for ia=29:32
      A=double(Y0(:,:,ia-28))/16;
      A8bit=round(A);
      SNR0=psnr(A8bit/255,A/255)

      imwrite(uint8(A8bit), 'tem.jp2', 'Mode','lossless');
      x8bit=dir('tem.jp2');
      rate0=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
      
      [SNR,rat,savng,delta]=find_metricVal_sub(A,SNR0,delta,rate0,check,f);
      saving(ia)=savng; 


      fprintf('image%d: PNNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end

%xray images: ------------------------------------------------------------------------------------------
   ia=20;
   H=896; W=768; fm=1; 
   Y0 = read_yuv('\image\med_xray1_896x768_12bit.yuv',H,W,fm,'uint16',420);
      A=double(Y0(:,:,ia-19))/16;
      A8bit=round(A);
      SNR0=psnr(A8bit/255,A/255)

      imwrite(uint8(A8bit), 'tem.jp2', 'Mode','lossless');
      x8bit=dir('tem.jp2');
      rate0=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
      
      [SNR,rat,savng,delta]=find_metricVal_sub(A,SNR0,delta,rate0,check,f);
      saving(ia)=savng; 


      fprintf('image%d: PNNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')


      
   H=1536; W=1536; fm=3; 
   Y0 = read_yuv('\image\med_xrays_1536x1536_12bit.yuv',H,W,fm,'uint16',420); 
   for ia=21:23
      A=double(Y0(:,:,ia-20))/16;
      A8bit=round(A);
      SNR0=psnr(A8bit/255,A/255)

      imwrite(uint8(A8bit), 'tem.jp2', 'Mode','lossless');
      x8bit=dir('tem.jp2');
      rate0=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
      
      [SNR,rat,savng,delta]=find_metricVal_sub(A,SNR0,delta,rate0,check,f);
      saving(ia)=savng; 


      fprintf('image%d: PNNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end

   H=512; W=512; fm=3;
   Y0 = read_yuv('\image\med_xrays_512x512_12bit.yuv',H,W,fm,'uint16',420);
   for ia=24:26
      A=double(Y0(:,:,ia-23))/16;
      A8bit=round(A);
      SNR0=psnr(A8bit/255,A/255)

      imwrite(uint8(A8bit), 'tem.jp2', 'Mode','lossless');
      x8bit=dir('tem.jp2');
      rate0=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
      
      [SNR,rat,savng,delta]=find_metricVal_sub(A,SNR0,delta,rate0,check,f);
      saving(ia)=savng; 


      fprintf('image%d: PNNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')
   end

   H=736; W=640; fm=1; 
   Y0 = read_yuv('\image\med_xray8_736x640_12bit.yuv',H,W,fm,'uint16',420); 
   ia=27;
      A=double(Y0(:,:,ia-26))/16;
      A8bit=round(A);
      SNR0=psnr(A8bit/255,A/255)

      imwrite(uint8(A8bit), 'tem.jp2', 'Mode','lossless');
      x8bit=dir('tem.jp2');
      rate0=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
      
      [SNR,rat,savng,delta]=find_metricVal_sub(A,SNR0,delta,rate0,check,f);
      saving(ia)=savng; 


      fprintf('image%d: PNNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta)
      fprintf('\n=============================================================================================================\n\n')

      