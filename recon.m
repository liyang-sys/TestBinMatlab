rate=0.25; n=length(rate);
%rate=[0.125 0.25 0.5 1 2]; n=length(rate);
SN=zeros(1,n);

%flip=ones(256,256);  % for ia=2:2:256,  flip(ia,:)=-ones(1,256);  end
sz=size(a);

for ia=1:n
   fname='deCoef';
   if rate(ia)<1, fname=strcat(fname,'0'); end
   fname=strcat(fname,num2str(round(rate(ia)*100-0.0001)));
   fname=strcat(fname,'.dat');

   %fid=fopen(fname); coef=fread(fid, N, 'float');   fclose(fid);
   coef=rstTHDctr1(qcoef,T,delta,0.39*delta,0.46*delta);
   %coef=rstVariableDeadZone(qcoef,delta);
   %coef=rst_bit_alloc(qsubcf,T,del,coef0);
   
   %qb=dy79recon(coef);
   %qb=dy79recon_4lev(coef);
   %coef=band2block(coef,8,tanTheta);  qb=LFP2Inv(coef,8,fL); %<==== LFP for JPEG2000
   coef=bd2block(coef,M,lev,tanTheta); qb=LFP2Inv(coef,M,fL); %<==== LFP for JPEG2000 (arbitrary aspect)
   %coef=bd2block(coef,M,lev,tanTheta); qb=cos_ext_inv(coef,M,thetaM_bior,s); %<==== cos_ext for J2k
   %coef=bd2block(coef,M,lev,tanTheta); qb=cos_ext_inv(coef,M,thetaM,s); %<==== cos_ext for J2k
   %coef=tree2blockC(coef,tanTheta); qb=LFP2Inv(coef,8,fL); %<==== LFP for SPIHT
   %coef=tree2blockC(coef,tanTheta); qb=dctMinv(coef,M); %<==== DCT for SPIHT
   %coef=tree2blockC(coef,tanTheta); qb=cos_ext_inv(coef,M,thetaM,s); %<==== cos_ext for SPIHT
   %coef=tree2blockC(coef,tanTheta); qb=cos_ext_inv(coef,M,thetaM_bior,s); %<==== cos_ext for SPIHT
   %coef=tree2blockC(coef,tanTheta); qb=dctMinv(coef,M); %<==== SPIHT
   %coef=tree2blockC(coef,tanTheta); qb=pre3_ext_inv(coef); %<==== SPIHT

   
   %coef=iFurtherLevs(coef,M,lev,tanTheta);  qb=cwp1dAinv(coef,M)'; qb=cwp1dAinv(qb,M)'; 
   %coef=tree2wp(coef,4,2,1); coef=iFurtherLevs(coef,M,lev,tanTheta);  qb=cwp1dAinv(coef,M)'; qb=cwp1dAinv(qb,M)'; 
   %coef=tree2wp(coef,8,4,2); coef=iFurtherLevs(coef,M,lev,tanTheta);  qb=cwp1dAinv(coef,M)'; qb=cwp1dAinv(qb,M)'; 
   
   
   %qb=dy79recon_5lev(coef);
   %qb=dy79recon_3lev(coef);
   %qb=dy53recon(coef);
      
   %qb=CFPdyadicInv1(coef,tanTheta);   %the PTV
   
   %coef=tree2block4bandC(coef,tanTheta);  qb=LFP2Inv(coef,4,fL); %<==== LFP for JPEG2000
   %coef=band2block(coef,4,tanTheta);  qb=LFP2Inv(coef,4,fL); %<==== LFP for SPIHT
   
   %coef=band2block_5lev(coef,8,tanTheta);  qb=LFP2Inv(coef,8,fL); %<==== LFP
   %coef=band2block_5lev(coef,12,tanTheta);  qb=LFP2Inv(coef,12,fL); %<==== LFP
   
   e=qb-a;
   %e=round(qb)-a; 
   e=e.^2;
   e=sqrt(sum(sum(e))/(N(1)*N(2)));
   SN(ia)=20*log10(255/e);
   fprintf('%5.2f\n',SN(ia));
   %fprintf('rate =%6.3f b/p,  PSNR =%5.2f dB\n',rate(ia),SN(ia));
end
%fprintf('%5.2f %6.2f %6.2f %6.2f %6.2f dB\n',SN(1),SN(2),SN(3),SN(4),SN(5));
%Nnon=sum(sum(abs(sign(qcoef))))
fprintf('\n');



%PSNR=SN
%PSNR=[PSNR; SN]; save PSNRr PSNR

%figure; imshow(uint8(qb));
%imwrite(uint8(qb),'test.bmp');


%err=floor(abs((qb-a)/(0.1*delta)))+1; err=reshape(err,1,N(1)*N(2));
%n=shist(err)
%sum(n(6:length(n)))/sum(n)
