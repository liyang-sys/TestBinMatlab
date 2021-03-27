sz=size(a);
fprintf('\n');
%coef=rstVariableDeadZone(qcr,delta);
coef=coefr;
%[Nnonf,zone0f,subzonef,subcoeff]=Coef_Statistics(coefr);

   %qb=dy79recon(coef);
   %qb=Nondy79recon_3lev_PlusCFP2(coef);
   %qb=dy79recon_3lev_PlusCFP2(coef);
   %qb=dy79recon_4lev_PlusCFP2(coef);
   %qb=CFP2bd_Lev_inv(coef,Lev);
   
   %coef=coef_reorder(coef);
   %coef=band2block(coef,8,tanTheta); qb=LFP2Inv(coef,8,fL); %<==== LFP
   coef=bd2block(coef,M,lev,tanTheta); qb=LFP2Inv(coef,M,fL); %<==== LFP
   
   %coef=band2block_7lev(coef,4,tanTheta);  qb=LFP2Inv(coef,4,fL);

   N=size(qb);
   for ia=1:N(1)
      for ib=1:N(2)
         if qb(ia,ib)>hg
            qb(ia,ib)=hg;
         elseif qb(ia,ib)<lw
            qb(ia,ib)=lw;
         end
      end
   end
   
SN=psnr(qb/255,a/255);   fprintf('PSNR = %5.2f dB;  \n',SN);
%SN=psnr(qb/255,a/255);   SSIM=ssim(qb*f,a*f);   fprintf('PSNR = %5.2f dB;   SSIM = %5.3f\n',SN,SSIM);
