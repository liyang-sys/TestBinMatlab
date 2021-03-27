%load Cactus_cfp8_3d_transformed_5lev; 
%load ParkScene_cfp8_3d_transformed_5lev;
%load Kimono_cfp8_3d_transformed_5lev;

%Ldc=coef(:,:,2); L1=coef(:,:,5); L2=coef(:,:,9:10); L3=coef(:,:,17:20); L4=coef(:,:,33:40); L5=coef(:,:,65:80);
%clear coef
%save Cactus_levels Ldc L1  L2  L3  L4  L5
%save Kimono_levels Ldc L1  L2  L3  L4  L5

%------------------------------------------------------------------------------
%load Cactus_levels
%load Cactus_cfp8_only
%load Kimono_levels
%load Kimono_cfp8_only

cfp8_only=cf_cfp8_only(:,:,33:48);

w=1024/8;
sb1=2; sb2=2; %<===================================
sub=L5((sb1-1)*w+1:sb1*w,(sb2-1)*w+1:sb2*w,:);
sub8=cfp8_only((sb1-1)*w+1:sb1*w,(sb2-1)*w+1:sb2*w,:);
sz=size(sub); nn=sz(1)*sz(2)*sz(3);

delta=2.05 %
%delta=4

qsub=quanTHD(sub,delta,delta);
qsub8=quanTHD(sub8,delta,delta);
subr=rstTHDctr1(qsub,delta,delta,0.45*delta,0.46*delta);
e=sub-subr; e=e.*e; e=sqrt(sum(sum(sum(e)))/nn);
SNR=20*log10(256/e)


zn=uint8((1-abs(sign(qsub)))*255);
zn8=uint8((1-abs(sign(qsub8)))*255);
maxmag=(max(max(max(abs(qsub))))), non=sum(sum(sum(abs(sign(qsub)))))/nn

[cf,z,sn,cf1]=coef_sign_L5H3(qsub);
[cf8,z8,sn8,cf18]=coef_sign_L5H3(qsub8);

