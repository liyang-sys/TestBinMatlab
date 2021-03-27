function [Ncfp4a,Ncfp8a,Nf26a,max4,max8,max26,Nf26,Ncfp4Ha,sn4Ha,sn4,sn26,zn4,znf26]=ssparsity2(cf_cfp8_only,r,c,w,delta)
%Tests from ssparsity.m show that Ncfp4Ha seems perform the same as Ncfp4,
%and they perform better than the remaining overall.

cfs=double(cf_cfp8_only((r-1)*w+1:r*w,(c-1)*w+1:c*w,:));
nn=128*128*96;


cfp4=shiftdim(cfs,2);
cfp8=shiftdim(cfs,2);
f26=shiftdim(cfs,2);
%Har=shiftdim(cfs,2);
%Harp=shiftdim(cfs,2);
for y=1:128
   ns=4; L=96/ns;
   [cfp4(:,:,y)]=LFP2sub(cfp4(:,:,y),ns);
   tem=cfp4(:,:,y);
   for ia=1:ns
      cfp4((ia-1)*L+1:ia*L,:,y)=tem(ia:ns:96,:);
   end
   cfp4Ha=cfp4; 
   cfp4(1:24,:,y)=CFP2(cfp4(1:24,:,y) );
   cfp4(1:12,:,y)=CFP2(cfp4(1:12,:,y) );
   cfp4(1:6,:,y)=CFP2(cfp4(1:6,:,y) );
   cfp4Ha(1:24,:,y)=Haar(cfp4Ha(1:24,:,y) );
   cfp4Ha(1:12,:,y)=Haar(cfp4Ha(1:12,:,y) );
   cfp4Ha(1:6,:,y)=Haar(cfp4Ha(1:6,:,y) );
   
   %------------------------------------------------------
   ns=8; L=96/ns;
   [cfp8(:,:,y)]=LFP2sub(cfp8(:,:,y),ns);
   tem=cfp8(:,:,y);
   for ia=1:ns
      cfp8((ia-1)*L+1:ia*L,:,y)=tem(ia:ns:96,:);
   end
   cfp8(1:12,:,y)=CFP2(cfp8(1:12,:,y) );
   cfp8(1:6,:,y)=CFP2(cfp8(1:6,:,y) );
   
   %------------------------------------------------------
   f26(:,:,y)=dyadic_symmetric_decom(f26(:,:,y),5);
   %Har(:,:,y)=Haar5lev( Har(:,:,y) );
   %Harp(:,:,y)=Haar_packet( Harp(:,:,y) );
end
cfp4=shiftdim(cfp4,1);
cfp4Ha=shiftdim(cfp4Ha,1);
cfp8=shiftdim(cfp8,1);
f26=shiftdim(f26,1);
%Har=shiftdim(Har,1);
%Harp=shiftdim(Harp,1);

qcfp4=quanTHD(cfp4,delta,delta);
qcfp4Ha=quanTHD(cfp4Ha,delta,delta);
qcfp8=quanTHD(cfp8,delta,delta);
qf26=quanTHD(f26,delta,delta);
%qHar=abs(quanTHD(Har,delta,delta));
%qHarp=abs(quanTHD(Harp,delta,delta));
max4=max(max(max(qcfp4(:,:,25:96))));
max8=max(max(max(qcfp8(:,:,25:96))));
max26=max(max(max(qf26(:,:,25:96))));

zn4=sign(abs(qcfp4));
zn4Ha=sign(abs(qcfp4Ha));
zn8=sign(abs(qcfp8));
znf26=sign(abs(qf26));
%znHar=sign(qHar);
%znHarp=sign(qHarp);

%Ncfp4=sum(sum(sum(zn4)));
Ncfp4Ha=sum(sum(sum(zn4Ha)));
%Ncfp8=sum(sum(sum(zn8)));
Nf26=sum(sum(sum(znf26)));
%NHar=sum(sum(sum(znHar)));
%NHarp=sum(sum(sum(znHarp)));

Ncfp4a=sum(sum(sum( zn4(:,:,25:96) )));
Ncfp8a=sum(sum(sum( zn8(:,:,25:96) )));
Nf26a=sum(sum(sum( znf26(:,:,25:96) )));


qcfp4=rstTHDctr1(qcfp4,delta,delta,0.45*delta,0.46*delta);
e=cfp4-qcfp4; e=e.*e; e=sqrt(sum(sum(sum(e)))/nn);
sn4=20*log10(256/e);

qcfp4Ha=rstTHDctr1(qcfp4Ha,delta,delta,0.45*delta,0.46*delta);
e=cfp4Ha-qcfp4Ha; e=e.*e; e=sqrt(sum(sum(sum(e)))/nn);
sn4Ha=20*log10(256/e);

qf26=rstTHDctr1(qf26,delta,delta,0.45*delta,0.46*delta);
qf26=shiftdim(qf26,2);
for y=1:128
   qf26(:,:,y)=dyadic_symmetric_recon(qf26(:,:,y),5);
end
qf26=shiftdim(qf26,1);
e=cfs-qf26; e=e.*e; e=sqrt(sum(sum(sum(e)))/nn);
sn26=20*log10(256/e);
