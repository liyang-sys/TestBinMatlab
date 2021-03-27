f=1000000/255; 
check='PSNR';
%check='SSIM';


Y0=imread('C:\image\IEEEaccess\HDRimages\nikon850D5.tif');
[H,W,D]=size(Y0);
del=257; mdel=[1 2 4];  Y=zeros(H,W,D); snr=zeros(1,D); saving=snr; rate=snr;
for ia=1:D
   md=mdel(3);
   %delta=1.2*md; 
   %delta=1.1*md; 
   delta=md;

   A=double(Y0(:,:,ia))/del;
   Anbit=round(A/md)*md;
   SNR0=psnr(Anbit/255,A/255)

   imwrite(uint8(Anbit/md), 'tem.jp2', 'Mode','lossless');
   x8bit=dir('tem.jp2');
   rate0=x8bit.bytes*8/numel(A) %%%%%%%%%%%%%%%%%%%%%%%%%%
   
   
   %=============================================================================================
   M=8; lev=3; [coef,fL]=LFP2(A,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP
   en_coef_check_metricVal_tem; %<==================== 'check' is hidden here !!!!!!!!!!!!!!!!!!
   rat=length(binary)/numel(qb);   savng=100*(rat-rate0)/rate0; SNR=SN;
   %=============================================================================================
   
   
   
   %[SNR,rat,savng,delta,qb]=find_metricVal_sub(A,SNR0,delta,rate0,check,f);

   Y(:,:,ia)=qb; snr(ia)=SNR; saving(ia)=savng; rate(ia)=rat;
   fprintf('image%d: PNNR0 = %5.2f, PSNR = %5.2f, rate = %5.3f, saving = %4.1f, delta =%7.3f \n',ia,SNR0,SNR,rat,savng,delta)
   fprintf('\n=============================================================================================================\n\n')
end
      
Y=round(Y*257);
y=uint16(Y);
