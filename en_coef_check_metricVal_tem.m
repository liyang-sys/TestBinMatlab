binary=en_coef2D_new(coef,delta);
coefr=de_coef2D_new(binary,delta);

coefr=bd2block(coefr,M,lev,tanTheta); qb=LFP2Inv(coefr,M,fL); %<==== LFP

%for ia=1:H
 %  for ib=1:W
  %    if qb(ia,ib)>255
   %      qb(ia,ib)=255;
    %  elseif qb(ia,ib)<0
     %    qb(ia,ib)=0;
      %end
%   end
%end

SN=psnr(qb/255,A/255);
sm=ssim(qb*f,A*f);
if strcmp(check,'SSIM') %<================'check' is here !!!!!!!!!!!!!!
   mc=sm;
else
   mc=SN;
end

fprintf('PSNR = %5.2f dB,  rate = %5.3f,  SSIM = %7.5f\n',SN,length(binary)/numel(coef),sm);
