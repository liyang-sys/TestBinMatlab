function [rate,SN,SSIM,delta]=find_coding_rate_sub(a,delta,rate0,f)

M=8; lev=3; [coef,fL]=LFP2(a,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP
%coef=coef_reorder(coef);
%M=16; lev=2; [coef,fL]=LFP2(a,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP
coef0=coef;

num=numel(a);
fsz0=rate0*num/8; er=0.0008*fsz0/2; fsz=fsz0-er/10;

test_en_coef1
eer0=file_size-fsz 
SN0=SN; delta0=delta;

if eer0<0
   delta=delta*(1-1/10); 
else
   delta=delta*(1+1/10); 
end
delta %%%%%%%%%%%%%%%%
coef=coef0;
test_en_coef1
eer=file_size-fsz %%%%%%%%%%%%%%%%%%%

iter=0;
while abs(eer)>er && abs(SN-SN0)>0.003 && iter<10
   iter=iter+1;
   delta2=(delta-delta0)/(eer-eer0) * (0-eer) + delta;
   
   delta0=delta; eer0=eer; SN0=SN;
   delta=delta2 %%%%%%%%%%%%%%%%%%%%
   coef=coef0;
   test_en_coef1
   eer=file_size-fsz %%%%%%%%%%%%%%%%%%%   
   fprintf('-------------------------------------------------------------------------\n\n')
end
rate=file_size*8/numel(qb);
fprintf('PSNR = %6.3f dB;  SSIM = %5.3f;   rate = %6.4f bpp,   delta =%6.2f \n',SN,SSIM,rate, delta);
fprintf('\n===================================================================\n\n\n')
