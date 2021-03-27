function [SN,rat,saving,delta,qb]=find_psnr_sub(A,SN0,delta,rate0,f)

[H,W]=size(A);
M=8; lev=3; [coef,fL]=LFP2(A,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP
coef0=coef;


SN0=SN0+0.006; %<========================= shift SN0 up a bit  !!!!!!!!!!!!!!!!!!


en_coef4psnr; %<======================= 'check' is hidden here !!!!!!!!!!!!!!!!!!
eer0=SN-SN0; 

if abs(eer0)>0.016
   delta0=delta;
   if eer0<0
      delta=delta*(1-1/30); 
   else
      delta=delta*(1+1/30); 
   end
   delta %%%%%%%%%%%%%%%%

   coef=coef0;
   en_coef4psnr;
   eer=SN-SN0 

   iter=0;
   while abs(eer)>0.016  &&  iter<6
      iter=iter+1
      delta2=(delta-delta0)/(eer-eer0) * (0-eer) + delta;
      delta0=delta; eer0=eer; 
   
      delta=delta2 %%%%%%%%%%%%%%%%%%%%
      coef=coef0;
      en_coef4psnr;
      eer=SN-SN0
      fprintf('-------------------------------------------------------------------------\n\n')
   end
end
rat=length(binary)/numel(qb);
saving=100*(rat-rate0)/rate0;
