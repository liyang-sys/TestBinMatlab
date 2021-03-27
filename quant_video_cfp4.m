%load Cactus_cfp4_3d_transformed_5lev %8-bit
%load ParkScene_cfp4_3d_transformed_5lev  %10-bit
load Kimono_cfp4_3d_transformed_5lev
%a=double(a);
a=double(a)/4; %for 10bit videos

nn=size(a); nn=nn(1)*nn(2)*nn(3); nn3=nn/3;
ru2=sqrt(2);

del=2.15;  %48.7413; Note, after recon transform 48.6205 

qa=quanTHD(a,del,del);
maxamp=max(max(max(abs(qa(:,:,2))))) %%%%%%%%%%%%%%%%%

zn=abs(sign(qa));
Nnon=[sum(sum(zn(:,:,2))) sum(sum(zn(:,:,5)))  sum(sum(sum(zn(:,:,9:10)))) ...
    sum(sum(sum(zn(:,:,17:20)))) sum(sum(sum(zn(:,:,33:40)))) sum(sum(sum(zn(:,:,65:80))))]/1024^2 %%%%%%%%%%%%%%%%%%%
Nnon0=sum(Nnon) %%%%%%%%%%%%%%%%%%%

qa=rstTHDctr1(qa,del,del,0.45*del,0.46*del);
e0=a-qa; e0=e0.*e0; e0=sqrt(sum(sum(sum(e0)))/nn);
SNR0=20*log10(256/e0)


%-------------------------------------------------------------------------
M=4;
N=size(a);  w=floor(N(1:2)/M);  md=N(1:2)-M*w; 
nbk=w; hbk=nbk/2; qbk=nbk/8;
tanTheta=1/8;
[tem,fL]=LFP2(zeros(1024,1024),M); 
for ia=1:12
   qa(1:qbk(1),1:qbk(2),ia)=LowHigh2block(qa(1:qbk(1),1:qbk(2),ia));
   qa(1:qbk(1),1:qbk(2),ia)=CFP2bandInv(qa(1:qbk(1),1:qbk(2),ia),tanTheta);
end
for ia=1:96
   qa(:,:,ia)=band2block(qa(:,:,ia),M,tanTheta);   qa(:,:,ia)=LFP2Inv(qa(:,:,ia),M,fL); %<==== LFP
end


%-------------------------------------------------------------------------
qa=shiftdim(qa,2);  
for x=1:1024
   x
   for y=1:1024
      qa(:,x,y)=dyadic_periodic_recon(qa(:,x,y),5);
   end
end
qa=shiftdim(qa,1);

%save Cactus_quantized_cfp4_delta_2p15 qa del
%save ParkScene_quantized_cfp4_delta_2p15 qa del
save Kimono_quantized_cfp4_delta_2p15 qa del

