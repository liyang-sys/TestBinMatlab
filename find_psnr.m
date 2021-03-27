f=1000000/255; 
snr0=zeros(1,32); snr=snr0; saving=snr; sm0=snr; sm=snr; smp0=snr; smp=snr; Delta=snr; rate=snr; rate0=snr;

nn=1; delta=1.02; %8-bit
%nn=2; delta=2.2; %7-bit 
%nn=4; delta=5; %6-bit
%nn=8; delta=10; %5-bit 
%nn=16; delta=20; %4-bit 

%images 17 to 32: =======================================================================================================
disp('images 17 to 32:')
%4 UHD images: ----------------------------------------------------------------------------------------
   H=2160; W=3840; fm=4; 
   Y0 = read_yuv('\image\UHDimages.yuv',H,W,fm,'uint16',420);
   ix=0;
   for ia=[17 18 19 28]
      ix=ix+1;
      A=double(Y0(:,:,ix))/16;
      Anbit=round(A/nn);
      SNR0=psnr(Anbit/255*nn,A/255)
      snr0(ia)=SNR0; sm0(ia)=ssim(Anbit/255*nn,A/255), smp0(ia)=ssim(Anbit*f*nn,A*f), 

      imwrite(uint8(Anbit), 'tem.jp2', 'Mode','lossless');
      x8bit=dir('tem.jp2');
      rate0(ia)=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
      
      [SNR,rat,savng,qb]=find_psnrJ2k_sub(A*257,SNR0,rate0(ia),f);
      saving(ia)=savng;   rate(ia)=rat; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f \n',ia,SNR0,SNR,rat,savng)

      %[SNR,rat,savng,delta1,qb]=find_psnr_sub(A,SNR0,delta,rate0(ia),f);
      %saving(ia)=savng;   rate(ia)=rat; Delta(ia)=delta1; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      %fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta1)
      fprintf('\n=============================================================================================================\n\n')
   end

%4 HD images: ---------------------------------------------------------------------------------------
   H=2160/2; W=3840/2; fm=4; 
   Y0 = read_yuv('\image\HDimages.yuv',H,W,fm,'uint16',420);
   for ia=29:32
      A=double(Y0(:,:,ia-28))/16;
      Anbit=round(A/nn);
      SNR0=psnr(Anbit/255*nn,A/255)
      snr0(ia)=SNR0; sm0(ia)=ssim(Anbit/255*nn,A/255), smp0(ia)=ssim(Anbit*f*nn,A*f), 

      imwrite(uint8(Anbit), 'tem.jp2', 'Mode','lossless');
      x8bit=dir('tem.jp2');
      rate0(ia)=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
      
      [SNR,rat,savng,qb]=find_psnrJ2k_sub(A*257,SNR0,rate0(ia),f);
      saving(ia)=savng;   rate(ia)=rat; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f \n',ia,SNR0,SNR,rat,savng)

      %[SNR,rat,savng,delta1,qb]=find_psnr_sub(A,SNR0,delta,rate0(ia),f);
      %saving(ia)=savng;   rate(ia)=rat; Delta(ia)=delta1; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      %fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta1)
      fprintf('\n=============================================================================================================\n\n')
   end
   
%xray images: ------------------------------------------------------------------------------------------
   ia=20;
   H=896; W=768; fm=1; 
   Y0 = read_yuv('\image\med_xray1_896x768_12bit.yuv',H,W,fm,'uint16',420);
      A=double(Y0(:,:,ia-19))/16;
      Anbit=round(A/nn);
      SNR0=psnr(Anbit/255*nn,A/255)
      snr0(ia)=SNR0; sm0(ia)=ssim(Anbit/255*nn,A/255), smp0(ia)=ssim(Anbit*f*nn,A*f), 

      imwrite(uint8(Anbit), 'tem.jp2', 'Mode','lossless');
      x8bit=dir('tem.jp2');
      rate0(ia)=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
      
      [SNR,rat,savng,qb]=find_psnrJ2k_sub(A*257,SNR0,rate0(ia),f);
      saving(ia)=savng;   rate(ia)=rat; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f \n',ia,SNR0,SNR,rat,savng)

      %[SNR,rat,savng,delta1,qb]=find_psnr_sub(A,SNR0,delta,rate0(ia),f);
      %saving(ia)=savng;   rate(ia)=rat; Delta(ia)=delta1; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      %fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta1)
      fprintf('\n=============================================================================================================\n\n')

   H=1536; W=1536; fm=3; 
   Y0 = read_yuv('\image\med_xrays_1536x1536_12bit.yuv',H,W,fm,'uint16',420); 
   for ia=21:23
      A=double(Y0(:,:,ia-20))/16;
      Anbit=round(A/nn);
      SNR0=psnr(Anbit/255*nn,A/255)
      snr0(ia)=SNR0; sm0(ia)=ssim(Anbit/255*nn,A/255), smp0(ia)=ssim(Anbit*f*nn,A*f), 

      imwrite(uint8(Anbit), 'tem.jp2', 'Mode','lossless');
      x8bit=dir('tem.jp2');
      rate0(ia)=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
       
      [SNR,rat,savng,qb]=find_psnrJ2k_sub(A*257,SNR0,rate0(ia),f);
      saving(ia)=savng;   rate(ia)=rat; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f \n',ia,SNR0,SNR,rat,savng)

      %[SNR,rat,savng,delta1,qb]=find_psnr_sub(A,SNR0,delta,rate0(ia),f);
      %saving(ia)=savng;   rate(ia)=rat; Delta(ia)=delta1; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      %fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta1)
      fprintf('\n=============================================================================================================\n\n')
   end

   H=512; W=512; fm=3;
   Y0 = read_yuv('\image\med_xrays_512x512_12bit.yuv',H,W,fm,'uint16',420);
   for ia=24:26
      A=double(Y0(:,:,ia-23))/16;
      Anbit=round(A/nn);
      SNR0=psnr(Anbit/255*nn,A/255)
      snr0(ia)=SNR0; sm0(ia)=ssim(Anbit/255*nn,A/255), smp0(ia)=ssim(Anbit*f*nn,A*f), 

      imwrite(uint8(Anbit), 'tem.jp2', 'Mode','lossless');
      x8bit=dir('tem.jp2');
      rate0(ia)=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
       
      [SNR,rat,savng,qb]=find_psnrJ2k_sub(A*257,SNR0,rate0(ia),f);
      saving(ia)=savng;   rate(ia)=rat; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f \n',ia,SNR0,SNR,rat,savng)

      %[SNR,rat,savng,delta1,qb]=find_psnr_sub(A,SNR0,delta,rate0(ia),f);
      %saving(ia)=savng;   rate(ia)=rat; Delta(ia)=delta1; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      %fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta1)
      fprintf('\n=============================================================================================================\n\n')
   end

   H=736; W=640; fm=1; 
   Y0 = read_yuv('\image\med_xray8_736x640_12bit.yuv',H,W,fm,'uint16',420); 
   ia=27;
      A=double(Y0(:,:,ia-26))/16;
      Anbit=round(A/nn);
      SNR0=psnr(Anbit/255*nn,A/255)
      snr0(ia)=SNR0; sm0(ia)=ssim(Anbit/255*nn,A/255), smp0(ia)=ssim(Anbit*f*nn,A*f), 

      imwrite(uint8(Anbit), 'tem.jp2', 'Mode','lossless');
      x8bit=dir('tem.jp2');
      rate0(ia)=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
      
      [SNR,rat,savng,qb]=find_psnrJ2k_sub(A*257,SNR0,rate0(ia),f);
      saving(ia)=savng;   rate(ia)=rat; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f \n',ia,SNR0,SNR,rat,savng)

      %[SNR,rat,savng,delta1,qb]=find_psnr_sub(A,SNR0,delta,rate0(ia),f);
      %saving(ia)=savng;   rate(ia)=rat; Delta(ia)=delta1; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      %fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta1)
      fprintf('\n=============================================================================================================\n\n')



%images 1 to 8: =================================================================================================
disp('images 1 to 8:')
idx=[1 3 4 5 6 7 8 9];  
   H=4000; W=6000; fm=9; 
   Y0 = read_yuv('\image\nikonY_acr_sharp.yuv',H,W,fm,'uint16',420);    %<======= original 12-bit images
   for ia=1:8
      A=double(Y0(:,:,idx(ia)))/16;
      Anbit=round(A/nn);
      SNR0=psnr(Anbit/255*nn,A/255)
      %SNR0=psnr(Anbit/256,A/256) %previously computed PSNR, small errors there
      snr0(ia)=SNR0; sm0(ia)=ssim(Anbit/255*nn,A/255), smp0(ia)=ssim(Anbit*f*nn,A*f), 

      imwrite(uint8(Anbit), 'tem.jp2', 'Mode','lossless');
      x8bit=dir('tem.jp2');
      rate0(ia)=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
       
      [SNR,rat,savng,qb]=find_psnrJ2k_sub(A*257,SNR0,rate0(ia),f);
      saving(ia)=savng;   rate(ia)=rat; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f \n',ia,SNR0,SNR,rat,savng)

      %[SNR,rat,savng,delta1,qb]=find_psnr_sub(A,SNR0,delta,rate0(ia),f);
      %saving(ia)=savng;   rate(ia)=rat; Delta(ia)=delta1; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      %fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta1)
      fprintf('\n=============================================================================================================\n\n')
   end

%image 9 to 16: ===============================================================================================
disp('images 9 to 12:')
   H=5504; W=8256; fm=4; 
   Y0 = read_yuv('\image\850D_original.yuv',H,W,fm,'uint16',420);
   for ia=9:12
      A=double(Y0(:,:,ia-8))/16;
      Anbit=round(A/nn);
      SNR0=psnr(Anbit/255*nn,A/255)
      snr0(ia)=SNR0; sm0(ia)=ssim(Anbit/255*nn,A/255), smp0(ia)=ssim(Anbit*f*nn,A*f), 

      imwrite(uint8(Anbit), 'tem.jp2', 'Mode','lossless');
      x8bit=dir('tem.jp2');
      rate0(ia)=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
      
      [SNR,rat,savng,qb]=find_psnrJ2k_sub(A*257,SNR0,rate0(ia),f);
      saving(ia)=savng;   rate(ia)=rat; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f \n',ia,SNR0,SNR,rat,savng)

      %[SNR,rat,savng,delta1,qb]=find_psnr_sub(A,SNR0,delta,rate0(ia),f);
      %saving(ia)=savng;   rate(ia)=rat; Delta(ia)=delta1; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      %fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta1)
      fprintf('\n=============================================================================================================\n\n')
   end
   
   
disp('images 13 to 16:')
   H=6192; W=8256; fm=4; 
   Y0 = read_yuv('\image\fujiY_original.yuv',H,W,fm,'uint16',420);
   for ia=13:16
      A=double(Y0(:,:,ia-12))/16;
      Anbit=round(A/nn);
      SNR0=psnr(Anbit/255*nn,A/255)
      snr0(ia)=SNR0; sm0(ia)=ssim(Anbit/255*nn,A/255), smp0(ia)=ssim(Anbit*f*nn,A*f), 

      imwrite(uint8(Anbit), 'tem.jp2', 'Mode','lossless');
      x8bit=dir('tem.jp2');
      rate0(ia)=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
      
      [SNR,rat,savng,qb]=find_psnrJ2k_sub(A*257,SNR0,rate0(ia),f);
      saving(ia)=savng;   rate(ia)=rat; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f \n',ia,SNR0,SNR,rat,savng)

      %[SNR,rat,savng,delta1,qb]=find_psnr_sub(A,SNR0,delta,rate0(ia),f);
      %saving(ia)=savng;   rate(ia)=rat; Delta(ia)=delta1; snr(ia)=SNR; sm(ia)=ssim(qb/255,A/255), smp(ia)=ssim(qb*f,A*f), 
      %fprintf('image%d: PSNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta1)
      fprintf('\n=============================================================================================================\n\n')
   end
   