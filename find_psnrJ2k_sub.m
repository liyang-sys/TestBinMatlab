function [SN,rat,saving,Ar]=find_psnrJ2k_sub(A,SN0,rate0,f)


SN0=SN0+0.003; %<========================= shift SN0 up a bit  !!!!!!!!!!!!!!!!!!

rat=rate0;
en_coef4psnrJ2k; %<======================= 'check' is hidden here !!!!!!!!!!!!!!!!!!
eer0=SN-SN0; 

if abs(eer0)>0.016
   rat0=rat;
   if eer0>0
      rat=rat*(1-1/30); 
   else
      rat=rat*(1+1/30); 
   end
   rat %%%%%%%%%%%%%%%%

   en_coef4psnrJ2k;
   eer=SN-SN0 

   iter=0;
   while abs(eer)>0.016  &&  iter<6  && eer~=eer0
      iter=iter+1
      rat2=(rat-rat0)/(eer-eer0) * (0-eer) + rat;
      rat0=rat; eer0=eer; 
   
      rat=rat2 %%%%%%%%%%%%%%%%%%%%
      en_coef4psnrJ2k;
      eer=SN-SN0
      fprintf('-------------------------------------------------------------------------\n\n')
   end
end
Ar=Ar/257;
saving=100*(rat-rate0)/rate0;
